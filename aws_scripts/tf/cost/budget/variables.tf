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


# Budget:
  variable "budget_name" {
    description = "Nome do budget"
    type        = string
    default     = "Teste 6 dolares"
  }

  variable "budget_type" {
    description = "COST | USAGE | RI_UTILIZATION | RI_COVERAGE | SAVINGS_PLANS_UTILIZATION | SAVINGS_PLANS_COVERAGE"
    type        = string
    # default     = "COST"
      default     = "USAGE"
    #   default     = "RI_UTILIZATION"
    #   default     = "RI_COVERAGE"
    #   default     = "SAVINGS_PLANS_UTILIZATION"
    #   default     = "SAVINGS_PLANS_COVERAGE"

    validation {
      condition     = contains(["COST", "USAGE", "RI_UTILIZATION", "RI_COVERAGE", "SAVINGS_PLANS_UTILIZATION", "SAVINGS_PLANS_COVERAGE"], var.budget_type)
      error_message = "O budget_type deve ser: COST, USAGE, RI_UTILIZATION, RI_COVERAGE, SAVINGS_PLANS_UTILIZATION ou SAVINGS_PLANS_COVERAGE."
    }
  }

  variable "budgeting_method" {
    description = "FIXED | AUTO_ADJUSTING_HISTORICAL | AUTO_ADJUSTING_FORECAST (apenas para COST e USAGE)"
    type        = string
    default     = "FIXED"
      # default     = "AUTO_ADJUSTING_HISTORICAL"
    #   default     = "AUTO_ADJUSTING_FORECAST"

    validation {
      condition     = contains(["FIXED", "AUTO_ADJUSTING_HISTORICAL", "AUTO_ADJUSTING_FORECAST"], var.budgeting_method)
      error_message = "O budgeting_method deve ser: FIXED, AUTO_ADJUSTING_HISTORICAL ou AUTO_ADJUSTING_FORECAST."
    }
  }

  variable "budget_adjustment_period" {
    description = "Número de períodos para cálculo histórico (apenas AUTO_ADJUSTING_HISTORICAL)"
    type        = number
    default     = 12
  }

  variable "limit_amount" {
    description = "Valor do limite (COST e USAGE com FIXED)"
    type        = string
    default     = "6.0"
  }

  variable "price_unit" {
    description = "Unidade monetária para COST"
    type        = string
    default     = "USD"
  }

  variable "usage_unit" {
    description = "Unidade de uso para USAGE (ex: GB, Hrs)"
    type        = string
    default     = "GB"
  }

  variable "time_unit" {
    description = "DAILY | MONTHLY | QUARTERLY | ANNUALLY"
    type        = string
    # default     = "ANNUALLY"
    #   default     = "DAILY"
      default     = "MONTHLY"
    #   default     = "QUARTERLY"

    validation {
      condition     = contains(["DAILY", "MONTHLY", "QUARTERLY", "ANNUALLY"], var.time_unit)
      error_message = "O time_unit deve ser: DAILY, MONTHLY, QUARTERLY ou ANNUALLY."
    }
  }

  variable "time_period_start" {
    description = "Formato: dd/MM/yyyy. Vazio = padrão da AWS. É convertido para o formato do Terraform (yyyy-MM-dd_00:00) no main.tf"
    type        = string
    default     = "01/10/2026"
    #   default     = ""

    validation {
      condition     = var.time_period_start == "" || can(regex("^[0-9]{2}/[0-9]{2}/[0-9]{4}$", var.time_period_start))
      error_message = "O time_period_start deve estar no formato dd/MM/yyyy ou vazio."
    }
  }

  variable "time_period_end" {
    description = "Formato: dd/MM/yyyy. Vazio = padrão da AWS. É convertido para o formato do Terraform (yyyy-MM-dd_00:00) no main.tf"
    type        = string
    # default     = ""
    default     = "31/12/2027"

    validation {
      condition     = var.time_period_end == "" || can(regex("^[0-9]{2}/[0-9]{2}/[0-9]{4}$", var.time_period_end))
      error_message = "O time_period_end deve estar no formato dd/MM/yyyy ou vazio."
    }
  }

  variable "budget_against" {
    description = "Dimensão do Budget Against para USAGE: USAGE_TYPE_GROUP | USAGE_TYPE"
    type        = string
    # default     = "USAGE_TYPE"
    default     = "USAGE_TYPE_GROUP"

    validation {
      condition     = contains(["", "USAGE_TYPE", "USAGE_TYPE_GROUP"], var.budget_against)
      error_message = "O budget_against deve ser: USAGE_TYPE, USAGE_TYPE_GROUP ou vazio."
    }
  }

  variable "budget_against_values" {
    description = "Lista de valores do Budget Against (apenas USAGE). Lista vazia = sem filtro"
    type        = list(string)
    # default     = ["DataTransfer-Out-Bytes", "DataTransfer-In-Bytes", "USE1-BoxUsage:t3.micro"]   # USAGE_TYPE
    default     = ["EC2: Running Hours", "EC2: Data Transfer - Internet (Out)"]                  # USAGE_TYPE_GROUP
  }

  variable "budget_tags" {
    description = "Tags que serão aplicadas ao budget"
    type        = map(string)
    default     = {
      ManagedBy   = "Terraform"
      Environment = "Test"
    }
  }


# Budget Notification:
  variable "notification_type" {
    description = "ACTUAL | FORECASTED (RI e Savings Plans são fixados em ACTUAL no main.tf)"
    type        = string
    default     = "ACTUAL"
      # default     = "FORECASTED"

    validation {
      condition     = contains(["ACTUAL", "FORECASTED"], var.notification_type)
      error_message = "O notification_type deve ser: ACTUAL ou FORECASTED."
    }
  }

  variable "comparison_operator" {
    description = "GREATER_THAN | LESS_THAN | EQUAL_TO (RI e Savings Plans são fixados em LESS_THAN no main.tf)"
    type        = string
    default     = "GREATER_THAN"
    #   default     = "LESS_THAN"
      # default     = "EQUAL_TO"

    validation {
      condition     = contains(["GREATER_THAN", "LESS_THAN", "EQUAL_TO"], var.comparison_operator)
      error_message = "O comparison_operator deve ser: GREATER_THAN, LESS_THAN ou EQUAL_TO."
    }
  }

  variable "threshold" {
    description = "Valor do limite da notificação"
    type        = number
    default     = 75.65
  }

  variable "threshold_type" {
    description = "PERCENTAGE | ABSOLUTE_VALUE (Cost)"
    type        = string
    default     = "PERCENTAGE"
    # default     = "ABSOLUTE_VALUE"

    validation {
      condition     = contains(["PERCENTAGE", "ABSOLUTE_VALUE"], var.threshold_type)
      error_message = "O threshold_type deve ser: PERCENTAGE ou ABSOLUTE_VALUE."
    }
  }

  # --- Subscribers: até 10 EMAIL e 1 SNS (ARN do tópico, exige access policy liberando budgets.amazonaws.com). Pelo menos um dos dois é obrigatório ---
  variable "subscriber_email_addresses" {
    description = "Lista de emails que receberão a notificação (até 10). Lista vazia = sem email"
    type        = list(string)
    default     = ["phcstudy@proton.me"]
    # default     = []

    validation {
      condition     = length(var.subscriber_email_addresses) <= 10
      error_message = "A notificação aceita no máximo 10 emails."
    }
  }

  variable "subscriber_sns_topic_arns" {
    description = "ARN do tópico SNS que receberá a notificação (até 1). Lista vazia = sem SNS"
    type        = list(string)
    # default     = []
    default     = ["arn:aws:sns:us-east-1:001727357081:snsTopicTest1"]

    validation {
      condition     = length(var.subscriber_sns_topic_arns) <= 1
      error_message = "A notificação aceita no máximo 1 tópico SNS."
    }
  }
