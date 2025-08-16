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
echo "Baixando o pacote"
sudo apt-get install -y nano vim curl wget unzip zip git




echo "***********************************************"
echo "NVM AND NODE.JS INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando e instalando o NVM"
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Carregando o NVM na sessão atual"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo o NVM para ser carregado automaticamente"
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.bashrc

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Baixando e instalando o Node.js com NVM"
nvm install 16