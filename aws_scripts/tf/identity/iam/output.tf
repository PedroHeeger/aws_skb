# IAM User:
  # output "user_name" {
  #   value = aws_iam_user.example.name
  # }

  # output "user_password" {
  #   value     = aws_iam_user_login_profile.example.password
  #   sensitive = true
  # }

  # output "access_key_info" {
  #   value = {
  #     access_key_id     = aws_iam_access_key.example.id,
  #     secret_access_key = aws_iam_access_key.example.secret
  #   }
  #   sensitive = true
  # }


# IAM Group:
  # output "group_name" {
  #   value = aws_iam_group.example.name
  # }


# IAM Role:
  output "role_name" {
    value = aws_iam_role.example.name
  }


# IAM Instance Profile:
  output "instance_profile_name" {    
    value = aws_iam_instance_profile.example.name
  }


# IAM Policy:
  output "policy_name" {
    value = aws_iam_policy.example.name
  }


# IAM User Policy:
  # output "user_customer_managed_policy_name" {
  #   value = element(split("/", aws_iam_user_policy_attachment.example1.policy_arn), 1)
  # }

  # output "user_aws_managed_policy_name" {
  #   value = element(split("/", aws_iam_user_policy_attachment.example2.policy_arn), 1)
  # }

  # output "user_inline_policy_name" {
  #   value = aws_iam_user_policy.example3.name
  # }


# IAM Group Policy:
  # output "group_customer_managed_policy_name" {
  #   value = element(split("/", aws_iam_group_policy_attachment.example1.policy_arn), 1)
  # }

  # output "group_aws_managed_policy_name" {
  #   value = element(split("/", aws_iam_group_policy_attachment.example2.policy_arn), 1)
  # }

  # output "group_inline_policy_name" {
  #   value = aws_iam_group_policy.example3.name
  # }


# IAM Role Policy:
  output "role_customer_managed_policy_name" {
    value = element(split("/", aws_iam_role_policy_attachment.example1.policy_arn), 1)
  }

  output "role_aws_managed_policy_name" {
    value = element(split("/", aws_iam_role_policy_attachment.example2.policy_arn), 1)
  }

  output "role_inline_policy_name" {
    value = aws_iam_role_policy.example3.name
  }