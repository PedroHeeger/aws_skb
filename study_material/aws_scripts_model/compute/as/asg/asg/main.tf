# Definindo Variáveis
variable "region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "asg_name" {
  description = "Nome do Auto Scaling Group"
  type        = string
  default     = "asgTest1"
}

variable "launch_temp_name" {
  description = "Nome do Launch Template"
  type        = string
  default     = "launchTempTest1"
}

variable "launch_config_name" {
  description = "Nome do Launch Configuration"
  type        = string
  default     = "launchConfigTest1"
}

variable "launch_temp_version" {
  description = "Versão do Launch Template"
  type        = number
  # default     = 1
  default     = 2
}

variable "min_size" {
  description = "Quantidade mínima de instâncias no grupo de Auto Scaling."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Quantidade máxima de instâncias no grupo de Auto Scaling."
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Capacidade desejada de instâncias no grupo de Auto Scaling."
  type        = number
  default     = 1
}

variable "default_cooldown" {
  description = "Tempo de espera padrão, em segundos, entre ações do Auto Scaling."
  type        = number
  default     = 300
}

variable "health_check_type" {
  description = "Tipo de verificação de integridade usado no grupo de Auto Scaling (EC2 ou ELB)."
  type        = string
  default     = "EC2"
}

variable "health_check_grace_period" {
  description = "Tempo de tolerância, em segundos, para as verificações de integridade antes da marcação de instâncias como não saudáveis."
  type        = number
  default     = 300
}


variable "az1" {
  description = "Nome da zona de disponibilidade 1"
  type        = string
  default     = "us-east-1a"
}

variable "az2" {
  description = "Nome da zona de disponibilidade 2"
  type        = string
  default     = "us-east-1b"
}

variable "tag_name_instance" {
  description = "Nome da tag da instância"
  type        = string
  default     = "ec2Test"
}

variable "tg_name" {
  description = "Nome do Target Group"
  type        = string
  default     = "tgTest1"
}

variable "clb_name" {
  description = "Nome do Classic Load Balancer (CLB)"
  type        = string
  default     = "clbTest1"
}




# Executando o código
provider "aws" {
  region = var.region
}

# Extraindo o launch template
data "aws_launch_template" "example" {
  name = var.launch_temp_name
}

# # Extraindo o launch configuration
# data "aws_launch_configuration" "example" {
#   name = var.launch_config_name
# }

# Extraindo a VPC
data "aws_vpcs" "default_vpc" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

# Extraindo as sub-redes
data "aws_subnets" "default_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.default_vpc.ids[0]]
  }

  filter {
    name   = "availability-zone"
    values = [var.az1, var.az2]
  }
}

data "aws_subnet" "selected_default_subnet" {
  for_each = toset(data.aws_subnets.default_subnet.ids)
  id       = each.value
}

# Extraindo o target group (ALB)
data "aws_lb_target_group" "existing_tg" {
  name = var.tg_name
}

# # Extraindo o Classic Load Balancer
# data "aws_elb" "existing_clb" {
#   name = var.clb_name
# }

# AUTO SCALING GROUP TYPE 1
# Criando o Auto Scaling Group
resource "aws_autoscaling_group" "example" {
  name                 = var.asg_name
  launch_template {
    id      = data.aws_launch_template.example.id
    version = var.launch_temp_version
  }
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier = [for s in data.aws_subnet.selected_default_subnet : s.id]

  health_check_type          = var.health_check_type
  health_check_grace_period  = var.health_check_grace_period
  default_cooldown           = var.default_cooldown
  force_delete               = true  # Está flag fará com que as instâncias sejam encerradas durante um evento de redução, mesmo que não tenham sido marcadas para encerramento pelo grupo do Auto Scaling.

  tag {
    key                 = "Name"
    value               = var.tag_name_instance
    propagate_at_launch = true
  }

  target_group_arns = [data.aws_lb_target_group.existing_tg.arn]
  # load_balancers = [data.aws_elb.existing_clb.name]
}


# AUTO SCALING GROUP TYPE 2
# Criando o Auto Scaling Group
# resource "aws_autoscaling_group" "example" {
#   name                 = var.asg_name

#   launch_template {
#     id      = data.aws_launch_template.example.id
#     version = var.launch_temp_version
#   }
#   min_size             = var.min_size
#   max_size             = var.max_size
#   desired_capacity     = var.desired_capacity

#   health_check_type          = var.health_check_type
#   health_check_grace_period  = var.health_check_grace_period
#   default_cooldown           = var.default_cooldown
#   force_delete               = true  # Está flag fará com que as instâncias sejam encerradas durante um evento de redução, mesmo que não tenham sido marcadas para encerramento pelo grupo do Auto Scaling.

#   # target_group_arns = [data.aws_lb_target_group.existing_tg.arn]
#   load_balancers = [data.aws_elb.existing_clb.name]
# }


# AUTO SCALING GROUP TYPE 3
# Criando o Auto Scaling Group
# resource "aws_autoscaling_group" "example" {
#   name                 = var.asg_name
#   launch_configuration      = data.aws_launch_configuration.example.name
#   min_size             = var.min_size
#   max_size             = var.max_size
#   desired_capacity     = var.desired_capacity
#   vpc_zone_identifier = [for s in data.aws_subnet.selected_default_subnet : s.id]

#   health_check_type          = var.health_check_type
#   health_check_grace_period  = var.health_check_grace_period
#   default_cooldown           = var.default_cooldown
#   force_delete               = true  # Está flag fará com que as instâncias sejam encerradas durante um evento de redução, mesmo que não tenham sido marcadas para encerramento pelo grupo do Auto Scaling.
  
#   tag {
#     key                 = "Name"
#     value               = var.tag_name_instance
#     propagate_at_launch = true
#   }

#   target_group_arns = [data.aws_lb_target_group.existing_tg.arn]
#   # load_balancers = [data.aws_elb.existing_clb.name]
# }