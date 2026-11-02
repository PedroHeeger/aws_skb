# Gerais:
  # Valores calculados a partir das variáveis
  locals {
    # COST e USAGE aceitam método (FIXED / AUTO_ADJUSTING). RI e Savings Plans não
    is_cost_usage = contains(["COST", "USAGE"], var.budget_type)
    is_fixed      = var.budgeting_method == "FIXED"

    # Limite: FIXED usa o valor e a unidade informados | AUTO_ADJUSTING a AWS calcula | RI e Savings Plans = 100 PERCENTAGE
    limit_amount = local.is_cost_usage ? (local.is_fixed ? var.limit_amount : null) : "100"
    limit_unit   = local.is_cost_usage ? (local.is_fixed ? (var.budget_type == "COST" ? var.price_unit : var.usage_unit) : null) : "PERCENTAGE"

    # Datas: dd/MM/yyyy -> yyyy-MM-dd_00:00 (formato exigido pelo Terraform)
    time_period_start = var.time_period_start != "" ? format("%s-%s-%s_00:00", split("/", var.time_period_start)[2], split("/", var.time_period_start)[1], split("/", var.time_period_start)[0]) : null
    time_period_end   = var.time_period_end != "" ? format("%s-%s-%s_00:00", split("/", var.time_period_end)[2], split("/", var.time_period_end)[1], split("/", var.time_period_end)[0]) : null

    # Filtro do Budget Against: apenas USAGE com valores informados
    usage_filter = var.budget_type == "USAGE" && length(var.budget_against_values) > 0

    # Notificação: RI e Savings Plans são fixados em ACTUAL e LESS_THAN
    notification_type   = local.is_cost_usage ? var.notification_type : "ACTUAL"
    comparison_operator = local.is_cost_usage ? var.comparison_operator : "LESS_THAN"
  }


# Budget:
  # Criando o budget (COST, USAGE, RI ou Savings Plans)
  resource "aws_budgets_budget" "example" {
    name              = var.budget_name
    budget_type       = var.budget_type
    time_unit         = var.time_unit
    limit_amount      = local.limit_amount
    limit_unit        = local.limit_unit
    time_period_start = local.time_period_start
    time_period_end   = local.time_period_end
    tags              = var.budget_tags

    # Auto-ajuste (apenas COST e USAGE com AUTO_ADJUSTING_HISTORICAL ou AUTO_ADJUSTING_FORECAST)
    dynamic "auto_adjust_data" {
      for_each = local.is_cost_usage && !local.is_fixed ? [1] : []
      content {
        auto_adjust_type = var.budgeting_method == "AUTO_ADJUSTING_HISTORICAL" ? "HISTORICAL" : "FORECAST"

        dynamic "historical_options" {
          for_each = var.budgeting_method == "AUTO_ADJUSTING_HISTORICAL" ? [1] : []
          content {
            budget_adjustment_period = var.budget_adjustment_period
          }
        }
      }
    }

    # Filtro do Budget Against (apenas USAGE com valores informados)
    # USAGE_TYPE -> UsageType | USAGE_TYPE_GROUP -> UsageTypeGroup (nomes usados pelo cost_filter)
    dynamic "cost_filter" {
      for_each = local.usage_filter ? [1] : []
      content {
        name   = var.budget_against == "USAGE_TYPE" ? "UsageType" : "UsageTypeGroup"
        values = var.budget_against_values
      }
    }

    # Tipos de custo (exigido pelo Terraform para RI e Savings Plans, pois os padrões conflitam com esses tipos)
    dynamic "cost_types" {
      for_each = local.is_cost_usage ? [] : [1]
      content {
        include_credit             = false
        include_discount           = false
        include_other_subscription = false
        include_recurring          = false
        include_refund             = false
        include_subscription       = true
        include_support            = false
        include_tax                = false
        include_upfront            = false
        use_blended                = false
      }
    }


# Budget Notification:
    # Adicionando a notificação no budget (comente este bloco para criar o budget sem notificação)
    notification {
      notification_type          = local.notification_type
      comparison_operator        = local.comparison_operator
      threshold                  = var.threshold
      threshold_type             = var.threshold_type
      subscriber_email_addresses = var.subscriber_email_addresses
      subscriber_sns_topic_arns  = var.subscriber_sns_topic_arns
    }


    lifecycle {
      # USAGE exige a dimensão do Budget Against
      precondition {
        condition     = var.budget_type != "USAGE" || var.budget_against != ""
        error_message = "É necessário definir budget_against para o tipo USAGE: USAGE_TYPE_GROUP ou USAGE_TYPE."
      }

      # Notificação exige pelo menos um subscriber (comente junto com o bloco notification)
      precondition {
        condition     = length(var.subscriber_email_addresses) + length(var.subscriber_sns_topic_arns) > 0
        error_message = "A notificação exige pelo menos um subscriber: subscriber_email_addresses ou subscriber_sns_topic_arns."
      }
    }
  }
