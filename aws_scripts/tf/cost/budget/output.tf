# Budget:
  output "budget_name" {
    value = aws_budgets_budget.example.name
  }

  output "budget_arn" {
    value = aws_budgets_budget.example.arn
  }

  output "budget_type" {
    value = aws_budgets_budget.example.budget_type
  }

  output "budget_limit" {
    value = "${aws_budgets_budget.example.limit_amount} ${aws_budgets_budget.example.limit_unit}"
  }

  output "budget_time_unit" {
    value = aws_budgets_budget.example.time_unit
  }


# Budget Notification:
  output "budget_notification" {
    value = aws_budgets_budget.example.notification
  }
