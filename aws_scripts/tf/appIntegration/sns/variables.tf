# Gerais:
  variable "aws_profile" {
    description = "Perfil do AWS CLI que será utilizado"
    type        = string
    default     = "default" # Altere para o nome do seu perfil personalizado se tiver um
  }

  variable "region" {
    description = "Região da AWS"
    type        = string
    default     = "us-east-1"
  }


# SNS Topic:
  variable "topic_name" {
    description = "Nome do tópico SNS (se FIFO, o sufixo .fifo é adicionado automaticamente)"
    type        = string
    default     = "snsTopicTest1"
  }

  variable "display_name" {
    description = "Nome de exibição do tópico SNS"
    type        = string
    default     = "SNS Topic Test 1"
  }

  variable "fifo_topic" {
    description = "false = Standard | true = FIFO (nome recebe o sufixo .fifo)"
    type        = bool
    # default     = false
    default     = true
  }

  variable "content_based_deduplication" {
    description = "Apenas para FIFO: true habilita deduplicação baseada no conteúdo"
    type        = bool
    # default     = false
    default     = true
  }

  variable "kms_master_key_id" {
    description = "Vazio = sem encriptação | ex: alias/aws/sns para KMS gerenciado pela AWS"
    type        = string
    default     = ""
  #   default     = "alias/aws/sns"
  }

  variable "max_message_size" {
    description = "Tamanho máximo da mensagem em KiB (1 a 1024). Padrão AWS = 256. Acima de 256 só aceita subscrição SQS ou Lambda"
    type        = number
    default     = 356

    validation {
      condition     = var.max_message_size >= 1 && var.max_message_size <= 1024
      error_message = "O max_message_size deve estar entre 1 e 1024 KiB."
    }
  }

  variable "topic_tags" {
    description = "Tags que serão aplicadas ao tópico SNS"
    type        = map(string)
    default     = {
      ManagedBy   = "Terraform"
      Environment = "Test"
    }
  }


# SNS Topic Policy:
  variable "access_policy_file" {
    description = "Caminho do arquivo JSON da access policy (placeholders <topicArn> e <accountId> são preenchidos no main.tf)"
    type        = string
    default     = "" # Deixe vazio para usar o documento inline
    # default     = "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/sns/sns_topic_access_policy.json"
  }

  variable "access_policy_document" {
    description = "Conteúdo JSON da access policy (placeholders <topicArn> e <accountId> são preenchidos no main.tf)"
    type        = string
    default     = <<EOF
  {
    "Version": "2008-10-17",
    "Id": "__default_policy_ID1",
    "Statement": [
      {
        "Sid": "__default_statement_ID",
        "Effect": "Allow",
        "Principal": {"AWS": "*"},
        "Action": [
          "SNS:GetTopicAttributes",
          "SNS:SetTopicAttributes",
          "SNS:AddPermission",
          "SNS:RemovePermission",
          "SNS:DeleteTopic",
          "SNS:Subscribe",
          "SNS:ListSubscriptionsByTopic",
          "SNS:Publish"
        ],
        "Resource": "<topicArn>",
        "Condition": {"StringEquals": {"AWS:SourceOwner": "<accountId>"}}
      }
    ]
  }
  EOF
  }


# SNS Subscription:
  # --- Tópico Standard: email | email-json | sms | http | https | sqs | lambda | application
  # --- Tópico FIFO: apenas sqs (fila Standard ou FIFO)
  # --- Ative o par protocol / sns_endpoint correspondente
  variable "protocol" {
    description = "Protocolo da subscrição"
    type        = string
    # default     = "email"
  #   default     = "email-json"
  #   default     = "sms"
  #   default     = "http"
    # default     = "https"
    default     = "sqs"
    # default     = "lambda"
  #   default     = "application"
  }

  variable "sns_endpoint" {
    description = "Endpoint da subscrição"
    type        = string
    # default     = "phcstudy@proton.me"                                                  # email
  #   default     = "phcstudy@proton.me"                                                  # email-json
  #   default     = "+5500000000000"                                                      # sms (formato E.164)
  #   default     = "http://exemplo.com/endpoint"                                         # http
    # default     = "https://exemplo.com/endpoint"                                        # https
    # default     = "arn:aws:sqs:us-east-1:001727357081:sqsQueueTest1"                    # sqs
    default     = "arn:aws:sqs:us-east-1:001727357081:sqsQueueTest1.fifo"               # sqs fifo
    # default     = "arn:aws:lambda:us-east-1:001727357081:function:functionTest1"        # lambda
  #   default     = "arn:aws:sns:us-east-1:001727357081:endpoint/GCM/appTest1/id"         # application
  }

  variable "dlq_arn" {
    description = "Redrive Policy / Dead-Letter Queue (opcional). Vazio = sem DLQ. Tópico FIFO exige fila .fifo"
    type        = string
    # default     = ""
    # default     = "arn:aws:sqs:us-east-1:001727357081:sqsDlqTest1"
    default     = "arn:aws:sqs:us-east-1:001727357081:sqsDlqTest1.fifo"
  }

  variable "filter_policy_file" {
    description = "Caminho do arquivo JSON da filter policy (opcional, tem prioridade sobre o documento). Vazio = usa o documento"
    type        = string
    default     = "" # Deixe vazio para usar o documento inline
    # default     = "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/sns/sns_filter_policy.json"
  }

  variable "filter_policy_document" {
    description = "Conteúdo JSON da filter policy (opcional). Vazio junto com o file = sem filtro"
    type        = string
    # default     = "" # Deixe vazio para usar o arquivo
    default     = "{\"evento\": [\"pedido_criado\"]}"
  }

  variable "filter_policy_scope" {
    description = "MessageAttributes | MessageBody (só vale junto com o filtro)"
    type        = string
    default     = "MessageAttributes"
    # default     = "MessageBody"
  }

  variable "raw_message_delivery" {
    description = "true = entrega só o corpo, sem o JSON do SNS. Apenas http | https | sqs"
    type        = bool
    default     = false
    # default     = true
  }
