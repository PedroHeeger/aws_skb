# Definindo Variáveis
variable "region" {
  description = "Região da AWS"
  default     = "us-east-1"
}

variable "tag_name_instance" {
  description = "Nome da tag da instância"
  default     = "ec2Test1"
}

variable "sg_name" {
  description = "Nome do Security Group"
  default     = "default"
}

variable "az1" {
  description = "Nome da zona de disponibilidade 1"
  default     = "us-east-1a"
}

variable "az2" {
  description = "Nome da zona de disponibilidade 2"
  default     = "us-east-1b"
}

variable "image_id" {
  description = "Imagem Id da instância"
  default     = "ami-0fc5d935ebf8bc3bc"
}

variable "so" {
  description = "Sistema Operacional"
  default     = "ubuntu"
  # default     = "ec2-user"
}


variable "instance_type" {
  description = "Tipo da instância"
  default     = "t2.micro"
}

variable "key_pair_path" {
  description = "Caminho para o arquivo de chave privada"
  default     = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/.default/secrets/awsKeyPair/universal"
}

variable "key_pair_name" {
  description = "Nome do par de chaves"
  default     = "keyPairUniversal"
}

variable "user_data_path" {
  description = "Caminho para o arquivo user data"
  default     = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/0linuxTools_git"
}

variable "user_data_file" {
  description = "Arquivo user data"
  default     = "udFile.sh"
}

variable "device_name" {
  description = "Nome do Dispositivo de Armazenamento"
  default     = "dev/sda1"
}

variable "volume_size" {
  description = "Tamanho do Volume de Armazenamento"
  default     = 12
}

variable "volume_type" {
  description = "Tipo do Volume de Armazenamento"
  default     = "gp2"
}

variable "instance_profile_name" {
  description = "Nome do Perfil de Instância"
  default     = "instanceProfileTest"
}



# Executando o código
provider "aws" {
  region = var.region
}


# VPC DEFAULT
data "aws_vpcs" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

# VPC CREATED
# data "aws_vpcs" "existing" {
#   filter {
#     name   = "tag:Name"
#     values = [var.vpc_name]
#   }
# }


# SUBNETS DEFAULT
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.default.ids[0]]            # PARA VPC DEFAULT
    # values = [data.aws_vpcs.existing.ids[0]]          # PARA VPC CREATED
  }

  filter {
    name   = "availability-zone"
    values = [var.az1, var.az2]
  }
}


# SG DEFAULT
data "aws_security_group" "default" {
  name    = var.sg_name
  vpc_id = data.aws_vpcs.default.ids[0]                   # PARA VPC DEFAULT
#   vpc_id = data.aws_vpcs.existing.ids[0]                    # PARA VPC CREATED
}

# SG CREATED
# data "aws_security_group" "existing" {
#   name    = var.sg_name
#   vpc_id = data.aws_vpcs.default.ids[0]                   # PARA VPC DEFAULT
# #   vpc_id = data.aws_vpcs.existing.ids[0]                    # PARA VPC CREATED
# }


# INSTÂNCIA
resource "aws_instance" "example" {
  ami             = var.image_id
  instance_type   = var.instance_type
  key_name        = var.key_pair_name
  count           = 1
  vpc_security_group_ids = [data.aws_security_group.default.id]            # PARA SG DEFAULT
  # vpc_security_group_ids = [aws_security_group.existing.id]         # PARA SG CREATED
  subnet_id       = data.aws_subnets.default.ids[0]                        # PARA SUBNET DEFAULT
  # subnet_id       = data.aws_subnet.default.id                        # PARA SUBNET CREATED

  user_data = file(pathexpand("${var.user_data_path}/${var.user_data_file}"))

  tags = {
    Name = var.tag_name_instance
  }

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  # iam_instance_profile = var.instance_profile_name
}


# Saída
output "public_ip" {
  value = aws_instance.example[0].public_ip
}

output "ssh_command" {
  description = "Comando para acesso remoto via SSH"
  value       = format("ssh -i %s/%s.pem %s@%s", var.key_pair_path, var.user_data_file, var.so, aws_instance.example[0].public_ip)
}

output "ssm_command" {
  description = "Comando para acesso remoto via AWS SSM"
  value       = format("aws ssm start-session --target %s", aws_instance.example[0].id)
}