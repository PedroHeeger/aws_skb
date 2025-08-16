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
echo "ZSHELL INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando o pacote"
sudo apt-get install -y zsh

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo o ZSH como shell padrao"
sudo chsh -s /usr/bin/zsh ubuntu




echo "***********************************************"
echo "OH MY ZSHELL INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variaveis"
echo "Usuario atual: $(whoami)"
export HOME="/home/ubuntu"
export ZSH_CUSTOM="/home/ubuntu/.oh-my-zsh/custom"
echo "$HOME"
echo "$ZSH_CUSTOM"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando o srcipt de instalacao do Oh My ZShell"
echo "$(pwd)"
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o oh-my-zsh-install.sh

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Executando o srcipt de instalação"
sh oh-my-zsh-install.sh --unattended --path=$HOME

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Removendo o srcipt de instalacao do Oh My ZShell"
rm oh-my-zsh-install.sh




echo "***********************************************"
echo "POWER LEVEL PLUGIN"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Clonando o repositório para a pasta do Oh My Zsh"
sudo -E git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Adicionando o comando typeset no arquivo de configuração do Zsh"
sudo -E echo "typeset -g POWERLEVEL9K_INSTANT_PROMPT=off" | sudo -E tee -a ${ZDOTDIR:-$HOME}/.zshrc

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Verificando se existe o arquivo de configuração do Zsh"
rc_file="$HOME/.zshrc"
if [ -f "$rc_file" ]; then
  echo "-----//-----//-----//-----//-----//-----//-----"
  echo "Fazendo a alteração do tema no arquivo de configuração do Zsh"
  sed -i 's#ZSH_THEME=.*#ZSH_THEME="powerlevel10k/powerlevel10k"#' $HOME/.zshrc
else
  echo "O arquivo $rc_file não existe."
fi

# Executar o comando "p10k configure" para configurar o layout do Oh My Zshell




echo "***********************************************"
echo "AUTO SUGGESTIONS PLUGIN"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Clonando o repositório para caminho personalizado"
sudo -E git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Adicionando o caminho deste arquivo no arquivo de configuração do Zsh"
sudo -E echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" | sudo -E tee -a ${ZDOTDIR:-$HOME}/.zshrc




echo "***********************************************"
echo "SYNTAX HIGHLIGHTING PLUGIN"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Clonando o repositório para caminho personalizado"
sudo -E git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Adicionando o caminho deste arquivo no arquivo de configuração do Zsh"
sudo -E echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" | sudo -E tee -a ${ZDOTDIR:-$HOME}/.zshrc

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Indicando que esse Shell deve ser iniciado"
echo "zsh" >> /home/ubuntu/.bashrc




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




echo "***********************************************"
echo "K3D INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
link="https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando e executando o script de instalação"
wget -q -O - $link | bash




echo "***********************************************"
echo "KUBECTL INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando os pacotes de dependência"
sudo apt-get install -y apt-transport-https ca-certificates curl

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Criando um diretório para armazenar chaves de repositórios"
sudo install -m 0755 -d /etc/apt/keyrings

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando a chave de assinatura pública para os repositórios de pacotes Kubernetes"
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Adicionando o repositório do pacote à lista de fontes de pacotes do sistema"
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando os pacotes"
sudo apt-get update -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando o pacote"
sudo apt-get install -y kubectl

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Exibindo a versão"
kubectl version --client

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Alterando o proprietario e grupo da pasta .kube para o usuario ubuntu"
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube