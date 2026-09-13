# IAM User:
  # # Criando um usuário do IAM
  # resource "aws_iam_user" "example" {
  #   name = var.user_name
  #   tags = var.user_tags
  # }

  # # Criando um perfil de login
  # resource "aws_iam_user_login_profile" "example" {
  #   user                    = aws_iam_user.example.name
  #   # password                = var.user_password
  #   password_reset_required = true
  # }

  # # Criando uma chave de acesso
  # resource "aws_iam_access_key" "example" {
  #   user = aws_iam_user.example.name
  # }


# IAM Group:
  # # Criando um grupo do IAM
  # resource "aws_iam_group" "example" {
  #   name = var.group_name
  # }



# IAM Role:
  # Criando uma role do IAM
  resource "aws_iam_role" "example" {
    name               = var.role_name
    description        = var.role_description
    assume_role_policy = var.trust_policy_file != "" ? file(var.trust_policy_file) : var.trust_policy_document
    tags               = var.role_tags
  }


# IAM Instance Profile:
  # Criando um perfil de instância do IAM
  resource "aws_iam_instance_profile" "example" {
    name = var.instance_profile_name
    role = aws_iam_role.example.name
    tags = var.instance_profile_tags
  }


# IAM Policy::
  # Criando uma política gerenciada pelo cliente (Customer Managed Policy)
  resource "aws_iam_policy" "example" {
    name        = var.customer_managed_policy_name
    description = var.customer_managed_policy_description
    policy      = var.managed_policy_file != "" ? file(var.managed_policy_file) : var.managed_policy_document
    tags        = var.policy_tags
  }


# IAM User Group:
  # # Adicionando o usuário ao grupo
  # resource "aws_iam_user_group_membership" "example" {
  #   user  = aws_iam_user.example.name
  #   groups = [aws_iam_group.example.name]
  # }


# IAM User Policy:
  # # Anexando a política gerenciada pelo cliente (Customer Managed Policy) ao user
  # resource "aws_iam_user_policy_attachment" "example1" {
  #   user       = aws_iam_user.example.name
  #   policy_arn = aws_iam_policy.example.arn
  # }

  # # Anexando uma política gerenciada pela AWS (AWS Managed Policy) ao user
  # resource "aws_iam_user_policy_attachment" "example2" {
  #   user       = aws_iam_user.example.name
  #   policy_arn = "arn:aws:iam::aws:policy/${var.user_aws_managed_policy_name}"
  # }

  # # Criando uma política em linha (Inline Policy) ao user
  # resource "aws_iam_user_policy" "example3" {
  #   user   = aws_iam_user.example.name
  #   name   = var.user_inline_policy_name
  #   policy = var.inline_policy_file != "" ? file(var.inline_policy_file) : var.inline_policy_document
  # }


# IAM Group Policy:
  # # Anexando a política gerenciada pelo cliente (Customer Managed Policy) ao group
  # resource "aws_iam_group_policy_attachment" "example1" {
  #   group      = aws_iam_group.example.name
  #   policy_arn = aws_iam_policy.example.arn
  # }

  # # Anexando uma política gerenciada pela AWS (AWS Managed Policy) ao group
  # resource "aws_iam_group_policy_attachment" "example2" {
  #   group      = aws_iam_group.example.name
  #   policy_arn = "arn:aws:iam::aws:policy/${var.group_aws_managed_policy_name}"
  # }

  # # Criando uma política em linha (Inline Policy) ao group
  # resource "aws_iam_group_policy" "example3" {
  #   group = aws_iam_group.example.name
  #   name   = var.group_inline_policy_name
  #   policy = var.inline_policy_file != "" ? file(var.inline_policy_file) : var.inline_policy_document
  # }


# IAM Role Policy:
  # Anexando a política gerenciada pelo cliente (Customer Managed Policy) à role
  resource "aws_iam_role_policy_attachment" "example1" {
    role       = aws_iam_role.example.name
    policy_arn = aws_iam_policy.example.arn
  }

  # Anexando uma política gerenciada pela AWS (AWS Managed Policy) à role
  resource "aws_iam_role_policy_attachment" "example2" {
    role       = aws_iam_role.example.name
    policy_arn = "arn:aws:iam::aws:policy/${var.role_aws_managed_policy_name}"
  }

  # Criando uma política em linha (Inline Policy) à role
  resource "aws_iam_role_policy" "example3" {
    role   = aws_iam_role.example.name
    name   = var.role_inline_policy_name
    policy = var.inline_policy_file != "" ? file(var.inline_policy_file) : var.inline_policy_document
  }

