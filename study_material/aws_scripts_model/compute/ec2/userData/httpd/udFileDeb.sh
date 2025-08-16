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
echo "APACHE HTTP (HTTPD) INSTALLATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando os pacotes"
sudo apt-get update -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Atualizando o sistema"
sudo apt-get upgrade -y

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Instalando o pacote"
sudo apt-get install -y apache2

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Reiniciando o serviço"
sudo systemctl restart apache2

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Habilitando o serviço para que seja executado automaticamente"
sudo systemctl enable apache2