# Definindo Variáveis
variable "region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "launch_temp_name" {
  description = "Nome do Launch Template"
  type        = string
  default     = "launchTempTest1"
}

variable "version_description" {
  description = "Descrição da versão do Launch Template"
  type        = string
  default     = "My version "
}

variable "image_id" {
  description = "Imagem Id da instância"
  type        = string
  default     = "ami-0fc5d935ebf8bc3bc"
}

variable "instance_type" {
  description = "Tipo da instância"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Nome do par de chaves"
  type        = string
  default     = "keyPairUniversal"
}

variable "user_data_path" {
  description = "Caminho para o arquivo user data"
  type        = string
  default     = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/httpd"
}

variable "user_data_file" {
  description = "Arquivo user data"
  type        = string
  default     = "udFileDebBase64.txt"
}

variable "device_name" {
  description = "Nome do Dispositivo de Armazenamento"
  type        = string
  default     = "dev/xvda"
}

variable "volume_size" {
  description = "Tamanho do Volume de Armazenamento"
  type        = number
  default     = 8
}

variable "volume_type" {
  description = "Tipo do Volume de Armazenamento"
  type        = string
  default     = "gp2"
}

variable "instance_profile_name" {
  description = "Nome do Perfil de Instância"
  type        = string
  # default     = "instanceProfileTest"
  default     = "ecsInstanceRole"
}

variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
  default     = "default"
  # default     = "vpcTest1"
}

variable "az1" {
  description = "Nome da zona de disponibilidade 1"
  type        = string
  default     = "us-east-1a"
}

variable "sg_name" {
  description = "Nome do Security Group"
  type        = string
  default     = "default"
  # default     = "sgTest1"
}

variable "tag_name_instance" {
  description = "Nome da tag da instância"
  type        = string
  default     = "ec2Test"
}




# Executando o código
provider "aws" {
  region = var.region
}




# Verificando se existe algum launch template. Caso não exista, o try irá prevenir erro.
data "aws_launch_template" "example" {
  count = length(try([for launch_template in data.aws_launch_template.example : launch_template], [])) > 0 ? 1 : 0     # Para quando não existir o lt
  # count = length(try(var.launch_temp_name, [])) > 0 ? 1 : 0                                                              # Para quando existir o lt e só quiser mudar a versão
  name = var.launch_temp_name
}

# Verificando se existe o launch template de nome procurado. Em seguida, definindo a versão.
locals {
  launch_template_exists = length([for lt in data.aws_launch_template.example : lt.name if lt.name == var.launch_temp_name]) > 0 ? data.aws_launch_template.example[0].name : "Não existe o launch template ${var.launch_temp_name}"
  latest_version = length([for lt in data.aws_launch_template.example : lt if lt.name == var.launch_temp_name]) > 0 ? data.aws_launch_template.example[0].latest_version : 0
  next_version = local.latest_version + 1
}

# Output para mostrar o resultado da verificação do nome e versão
output "launch_template_exists" {
  value = {
    lt_name = local.launch_template_exists
    lt_version = local.latest_version
    lt_next_version = local.next_version
  }
}


# VPC DEFAULT
data "aws_vpcs" "example" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

# # VPC CREATED
# data "aws_vpcs" "example" {
#   filter {
#     name   = "tag:Name"
#     values = [var.vpc_name]
#   }
# }


# Extraindo o grupo de segurança padrão
data "aws_security_group" "example" {
  name        = var.sg_name
  vpc_id      = data.aws_vpcs.example.ids[0]
}


# # LAUNCH TEMPLATE 1
# # Criando o Launch Template do tipo 1
# resource "aws_launch_template" "example" {
#   name                   = var.launch_temp_name
#   description            = "${var.version_description} - v${local.next_version}"
#   image_id               = var.image_id
#   instance_type          = var.instance_type
#   key_name               = var.key_pair_name
#   user_data              = file(pathexpand("${var.user_data_path}/${var.user_data_file}"))
#   vpc_security_group_ids = [data.aws_security_group.example.id]
#   default_version        = local.next_version

#   block_device_mappings {
#     device_name = var.device_name

#     ebs {
#       volume_size = var.volume_size
#       volume_type = var.volume_type
#     }
#   }

#   iam_instance_profile {
#     name = var.instance_profile_name
#   }
# }



# LAUNCH TEMPLATE 2
# Extraindo as sub-redes padrões
data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.example.ids[0]]
  }

  filter {
    name   = "availability-zone"
    values = [var.az1]
  }
}

data "aws_subnet" "example" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}

# Criando o Launch Template do tipo 2
resource "aws_launch_template" "example" {
  name            = var.launch_temp_name
  description     = "${var.version_description} - v${local.next_version}"
  image_id        = var.image_id
  instance_type   = var.instance_type
  key_name        = var.key_pair_name
  user_data       = file(pathexpand("${var.user_data_path}/${var.user_data_file}"))
  default_version = local.next_version

  block_device_mappings {
    device_name = var.device_name

    ebs {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }
  }

  dynamic network_interfaces {
    for_each = data.aws_subnet.example

    content {
      associate_public_ip_address = true
      subnet_id                   = network_interfaces.value.id
      security_groups             = [data.aws_security_group.example.id]
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.tag_name_instance
    }
  }
}