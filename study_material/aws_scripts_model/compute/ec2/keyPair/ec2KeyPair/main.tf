# Definindo Variáveis
variable "region" {
  description = "Região da AWS"
  default     = "us-east-1"
}

variable "key_pair_name" {
  description = "Nome do par de chaves"
  default     = "keyPairTest"
}

variable "key_pair_path" {
  description = "Caminho para a chave pública"
  default     = "G:/Meu Drive/4_PROJ/scripts/aws/.default/secrets/awsKeyPair/test"
}



# Executando o código
provider "aws" {
  region = var.region
}

# Cria os arquivos de chave (Deve ser executado antes de criar o par de chaves na AWS)
resource "null_resource" "generate_key_pair" {
  provisioner "local-exec" {
    command = <<-EOT
      powershell.exe -Command ssh-keygen -t rsa -b 2048 -f `"${var.key_pair_path}/${var.key_pair_name}`" -N `"`"
    EOT
  }
}

# Os arquivos de chave devem existir antes da execução desse comando
resource "aws_key_pair" "example" {
  key_name   = var.key_pair_name
  public_key = file("${var.key_pair_path}/${var.key_pair_name}.pub")
}

output "key_pair" {
  value     = aws_key_pair.example.key_name
}