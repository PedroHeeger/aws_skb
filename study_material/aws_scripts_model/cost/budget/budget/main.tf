# Definindo Variáveis
variable "region" {
  description = "Região da AWS"
  type = string
  default     = "us-east-1"
}

# Variáveis para o orçamento (Budget)
variable "account_id" {
  description = "ID da conta AWS"
  type        = string
  default     = "001727357081"
}

variable "budget_name" {
  description = "Nome do orçamento"
  type        = string
  default     = "Gastos acima de 4.0 dolares"
}

variable "limit_amount" {
  description = "Limite do orçamento"
  type        = number
  default     = 4.0
}

variable "unit" {
  description = "Unidade do orçamento (ex: USD)"
  type        = string
  default     = "USD"
}

variable "time_unit" {
  description = "Período de tempo para o orçamento (ex: MONTHLY)"
  type        = string
  default     = "MONTHLY"
}

variable "budget_type" {
  description = "Tipo de orçamento (ex: COST)"
  type        = string
  default     = "COST"
}

variable "notification_type" {
  description = "Tipo de notificação (ex: ACTUAL)"
  type        = string
  default     = "ACTUAL"
}

variable "comparison_operator" {
  description = "Operador de comparação para o orçamento (ex: GREATER_THAN)"
  type        = string
  default     = "GREATER_THAN"
}

variable "threshold" {
  description = "Valor do limiar da notificação (ex: 50.0)"
  type        = number
  default     = 50.0
}

variable "threshold_type" {
  description = "Tipo do limiar (ex: PERCENTAGE)"
  type        = string
  default     = "PERCENTAGE"
}

variable "notification_state" {
  description = "Estado da notificação (ex: ALARM)"
  type        = string
  default     = "ALARM"
}

variable "subscription_type" {
  description = "Tipo de assinatura para a notificação (ex: EMAIL)"
  type        = string
  default     = "EMAIL"
}

variable "address" {
  description = "Endereço de e-mail para a notificação"
  type        = string
  default     = "pedroheeger19@gmail.com"
}




# Executando o código
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 0.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Criando o Budget
resource "aws_budgets_budget" "example" {
  name              = var.budget_name
  budget_type       = var.budget_type
  limit_amount      = var.limit_amount
  limit_unit        = var.unit
  time_unit         = var.time_unit

  notification {
    comparison_operator        = var.comparison_operator
    threshold                  = var.threshold
    threshold_type             = var.threshold_type
    notification_type          = var.notification_type
    subscriber_email_addresses = [var.address]
  }
}