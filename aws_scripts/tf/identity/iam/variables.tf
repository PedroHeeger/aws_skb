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


# IAM User:
  variable "user_name" {
    description = "Nome do usuário do IAM"
    type        = string
    default     = "UserTest"
  }

  variable "user_password" {
    description = "Senha do usuário do IAM"
    type        = string
    default     = "PwdTest123"
  }

  variable "user_tags" {
    description = "Tags que serão aplicadas ao usuário do IAM"
    type        = map(string)
    default     = {
      ManagedBy = "Terraform"
      Project   = "Test"
    }
  }


# IAM Group:
  variable "group_name" {
    description = "Nome do grupo do IAM"
    default     = "GroupTest"
  }


# IAM Role:
  variable "role_name" {
    description = "Nome da função do IAM"
    default     = "RoleTest"
  }

  variable "role_description" {
    description = "Descrição da função do IAM"
    type        = string
    default     = "Role de Teste criada por JSON (Arquivo ou Inline)"
  }

  variable "trust_policy_file" {
    description = "Caminho do arquivo JSON da política de confiança (Trust Policy)"
    type        = string
    default     = "" # Deixe vazio por padrão para usar o código inline
    # default     = "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/trust_policy_document.json"
  }

  variable "trust_policy_document" {
    description = "Conteúdo JSON da política de confiança (Trust Policy)"
    type        = string
    default     = <<EOF
      {
      "Version": "2012-10-17",
      "Statement": [
          {
          "Effect": "Allow",
          "Principal": {"Service": "ec2.amazonaws.com"},
          "Action": "sts:AssumeRole"
          }
      ]
      }
      EOF
  }

  variable "role_tags" {
    description = "Tags que serão aplicadas à função do IAM"
    type        = map(string)
    default     = {
      ManagedBy = "Terraform"
      Project   = "Test"
    }
  }


# IAM Instance Profile:
  variable "instance_profile_name" {
    description = "Nome do perfil de instância do IAM"
    default     = "InstanceProfileTest"
  }

  variable "instance_profile_tags" {
    description = "Tags que serão aplicadas ao perfil de instância do IAM"
    type        = map(string)
    default     = {
      ManagedBy = "Terraform"
      Project   = "Test"
    }
  }


# IAM Policy:
  variable "customer_managed_policy_name" {
    description = "Nome da Política gerenciada pelo cliente (Customer Managed Policy)"
    type        = string
    default     = "customManagedPolicy"
  }

  variable "customer_managed_policy_description" {
    description = "Descrição da Política gerenciada pelo cliente (Customer Managed Policy)"
    type        = string
    default     = "Política de Teste criada por JSON (Arquivo ou Inline)"
  }

  variable "policy_tags" {
    description = "Tags que serão aplicadas à política do IAM"
    type        = map(string)
    default     = {
      ManagedBy = "Terraform"
      Project   = "Test"
    }
  }

  variable "managed_policy_file" {
    description = "Caminho do arquivo JSON da política"
    type        = string
    default     = "" # Deixe vazio por padrão para usar o código inline
    # default     = "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/policy_document.json"
  }

  variable "managed_policy_document" {
    description = "Conteúdo JSON da política"
    type        = string
    default     = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": ["s3:GetObject", "s3:ListBucket"],
        "Resource": "arn:aws:s3:::seu-bucket/*"
      }
    ]
  }
  EOF
  }


  variable "inline_policy_file" {
    description = "Caminho do arquivo JSON da política"
    type        = string
  #   default     = "" # Deixe vazio por padrão para usar o código inline
    default     = "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/policy_document.json"
  }

  variable "inline_policy_document" {
    description = "Conteúdo JSON da política"
    type        = string
    default     = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": ["s3:GetObject", "s3:ListBucket"],
        "Resource": "arn:aws:s3:::seu-bucket/*"
      }
    ]
  }
  EOF
  }


# IAM User Policy:
  variable "user_aws_managed_policy_name" {
    description = "Nome da Política gerenciada pela AWS (AWS Managed Policy) do user"
    type        = string
    default     = "AmazonS3ReadOnlyAccess"
  }

  variable "user_inline_policy_name" {
    description = "Nome da Política em linha (Inline Policy) do user"
    type        = string
    default     = "userInlinePolicy"
  }


# IAM Group Policy:
  variable "group_aws_managed_policy_name" {
    description = "Nome da Política gerenciada pela AWS (AWS Managed Policy) do group"
    type        = string
    default     = "AmazonS3ReadOnlyAccess"
  }

  variable "group_inline_policy_name" {
    description = "Nome da Política em linha (Inline Policy) do group"
    type        = string
    default     = "groupInlinePolicy"
  }


# IAM Role Policy:
  variable "role_aws_managed_policy_name" {
    description = "Nome da Política gerenciada pela AWS (AWS Managed Policy) da role"
    type        = string
    default     = "AmazonS3ReadOnlyAccess"
  }

  variable "role_inline_policy_name" {
    description = "Nome da Política em linha (Inline Policy) da role"
    type        = string
    default     = "roleInlinePolicy"
  }

