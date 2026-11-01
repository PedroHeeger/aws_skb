# SNS Topic:
  output "topic_name" {
    value = aws_sns_topic.example.name
  }

  output "topic_arn" {
    value = aws_sns_topic.example.arn
  }


# SNS Subscription:
  output "subscription_arn" {
    value = aws_sns_topic_subscription.example.arn
  }

  output "subscription_protocol" {
    value = aws_sns_topic_subscription.example.protocol
  }

  output "subscription_endpoint" {
    value = aws_sns_topic_subscription.example.endpoint
  }
