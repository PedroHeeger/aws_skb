# Gerais:
  # Obtendo o ID da conta (usado no placeholder <accountId> da access policy)
  data "aws_caller_identity" "current" {}


# SNS Topic:
  # Criando o tópico SNS (Standard ou FIFO)
  resource "aws_sns_topic" "example" {
    name                        = var.fifo_topic ? "${var.topic_name}.fifo" : var.topic_name
    display_name                = var.display_name
    fifo_topic                  = var.fifo_topic
    content_based_deduplication = var.fifo_topic ? var.content_based_deduplication : null
    kms_master_key_id           = var.kms_master_key_id != "" ? var.kms_master_key_id : null
    maximum_message_size        = var.max_message_size * 1024
    tags                        = var.topic_tags
  }


# SNS Topic Policy:
  # Aplicando a access policy no tópico (substitui os placeholders <topicArn> e <accountId>)
  resource "aws_sns_topic_policy" "example" {
    arn = aws_sns_topic.example.arn
    policy = replace(
      replace(
        var.access_policy_file != "" ? file(var.access_policy_file) : var.access_policy_document,
        "<topicArn>", aws_sns_topic.example.arn
      ),
      "<accountId>", data.aws_caller_identity.current.account_id
    )
  }


# SNS Subscription:
  # Criando a subscrição no tópico SNS
  resource "aws_sns_topic_subscription" "example" {
    topic_arn            = aws_sns_topic.example.arn
    protocol             = var.protocol
    endpoint             = var.sns_endpoint
    redrive_policy       = var.dlq_arn != "" ? jsonencode({ deadLetterTargetArn = var.dlq_arn }) : null
    filter_policy        = var.filter_policy_file != "" ? file(var.filter_policy_file) : (var.filter_policy_document != "" ? var.filter_policy_document : null)
    filter_policy_scope  = var.filter_policy_file != "" || var.filter_policy_document != "" ? var.filter_policy_scope : null
    raw_message_delivery = var.raw_message_delivery

    lifecycle {
      # Tópico FIFO só aceita sqs
      precondition {
        condition     = !var.fifo_topic || var.protocol == "sqs"
        error_message = "O tópico é FIFO e aceita apenas o protocolo: sqs."
      }

      # Tópico Standard acima de 256 KiB só aceita sqs e lambda
      precondition {
        condition     = var.fifo_topic || var.max_message_size <= 256 || contains(["sqs", "lambda"], var.protocol)
        error_message = "O tópico é Standard acima de 256 KiB e aceita apenas os protocolos: sqs, lambda."
      }

      # Tópico Standard até 256 KiB aceita os protocolos abaixo
      precondition {
        condition     = var.fifo_topic || var.max_message_size > 256 || contains(["email", "email-json", "sms", "http", "https", "sqs", "lambda", "application"], var.protocol)
        error_message = "O tópico é Standard e aceita apenas os protocolos: email, email-json, sms, http, https, sqs, lambda, application."
      }

      # Raw message delivery só funciona com http, https e sqs
      precondition {
        condition     = !var.raw_message_delivery || contains(["http", "https", "sqs"], var.protocol)
        error_message = "Raw message delivery é suportado apenas para os protocolos: http, https, sqs."
      }
    }
  }
