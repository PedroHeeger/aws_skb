# Definindo Variáveis
variable "region" {
  description = "Região da AWS"
  default     = "us-east-1"
}

variable "topic_name" {
  description = "Nome do tópico SNS"
  type        = string
  default     = "topicTest1"
}

variable "display_name" {
  description = "Nome de exibição do tópico SNS"
  type        = string
  default     = "Topic Test 1"
}

variable "protocol" {
  description = "Protocolo de assinatura SNS"
  type        = string
  default     = "email"
}

variable "notification_endpoint" {
  description = "Endpoint de notificação para a assinatura SNS"
  type        = string
  default     = "phcstudy@proton.me"
}



# Executando o código
provider "aws" {
  region = var.region
}

# Criando o tópico SNS
resource "aws_sns_topic" "example" {
  name        = var.topic_name
  display_name = var.display_name
}

# Adicionando uma subscrição ao tópico SNS
resource "aws_sns_topic_subscription" "example" {
  topic_arn = aws_sns_topic.example.arn
  protocol  = var.protocol
  endpoint  = var.notification_endpoint
}



# Outputs
output "topic_arn" {
  description = "ARN do tópico SNS criado"
  value       = aws_sns_topic.example.arn
}

output "topic_name" {
  description = "Nome do tópico SNS criado"
  value       = aws_sns_topic.example.name
}

output "subscription_arn" {
  description = "ARN da subscrição SNS criada"
  value       = aws_sns_topic_subscription.example.arn
}

output "subscription_endpoint" {
  description = "Endpoint da subscrição SNS criada"
  value       = aws_sns_topic_subscription.example.endpoint
}