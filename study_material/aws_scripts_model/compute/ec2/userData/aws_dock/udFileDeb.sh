#!/bin/bash

echo "***********************************************"
echo "LINUX TOOLS AND GIT INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando os pacotes"
sudo apt-get update -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando o sistema"
sudo apt-get upgrade -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando os pacotes"
sudo apt-get install -y nano vim curl wget unzip zip git




echo "***********************************************"
echo "AWS CLI INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
link="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando o pacote"
curl "$link" -o "awscliv2.zip"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Descompactando o pacote"
unzip awscliv2.zip

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando o pacote"
sudo ./aws/install




echo "***********************************************"
echo "DOCKER INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando os pacotes"
sudo apt-get update -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando os pacotes necessários para realizar: download seguro (SSL) (ca-certificates), operações de transferência de dados (curl) e manipulação de chaves GPG (gnupg)"
sudo apt-get install -y ca-certificates curl gnupg

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Criando um diretório para armazenar chaves de repositórios"
sudo install -m 0755 -d /etc/apt/keyrings

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando a chave GPG oficial do Docker, desarmazenando e salvando ela no diretório de chaves (com o Gnupg)"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Garantindo que a chave GPG do Docker tenha as permissões corretas"
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Adicionando o repositório do Docker à lista de fontes de pacotes do sistema"
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
"$(. /etc/os-release && echo "$UBUNTU_CODENAME")" stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando os pacotes"
sudo apt-get update -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando os pacotes principais do Docker, incluindo o Docker Community Edition, o daemon (dockerd), a CLI (docker), o containerd (motor de execução de contêineres), e plugins adicionais (Docker Buildx e Docker Compose)."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin




echo "***********************************************"
echo "DOCKER CONFIGURATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
username="ubuntu"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Adicionando o usuário ao grupo do Docker"
sudo usermod -aG docker ${username}

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Confirmando as alterações realizadas no grupo"
sudo newgrp docker

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Reiniciando o serviço"  
sudo systemctl restart docker




echo "***********************************************"
echo "DOCKER AUTHENTICATION WITH AWS ECR"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
region="us-east-1"
accountId="001727357081"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Autenticando o Docker com AWS ECR"
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $accountId.dkr.ecr.$region.amazonaws.com