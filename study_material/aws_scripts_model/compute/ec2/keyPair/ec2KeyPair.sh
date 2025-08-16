#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2"
echo "KEY PAIR CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
keyPairName="keyPairTest"
keyPairPath="G:/Meu Drive/4_PROJ/scripts/aws/.default/secrets/awsKeyPair/test"
region="us-east-1"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o par de chaves $keyPairName"
    condition=$(aws ec2 describe-key-pairs --region $region --output text | grep "$keyPairName" | wc -l)
    if [[ $condition -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe o par de chaves $keyPairName"
        aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName'].KeyName" --region $region --output text
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os pares de chaves criados"
        aws ec2 describe-key-pairs --query "KeyPairs[].KeyName" --region $region --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o par de chaves $keyPairName e salvado o arquivo de chave privada"
        aws ec2 create-key-pair --key-name "$keyPairName" --query 'KeyMaterial' --region $region --output text > "$keyPairPath/$keyPairName.pem"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando apenas o par de chave $keyPairName"
        aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName'].KeyName" --region $region --output text
    fi
else
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2"
echo "KEY PAIR EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
keyPairName="keyPairTest"
keyPairPath="G:/Meu Drive/4_PROJ/scripts/aws/.default/secrets/awsKeyPair/test"
region="us-east-1"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "${resposta,,}" == 'y' ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o par de chaves $keyPairName"
    condition=$(aws ec2 describe-key-pairs --region $region --output text | grep "$keyPairName" | wc -l)
    if [[ $condition -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os pares de chaves criados"
        aws ec2 describe-key-pairs --query "KeyPairs[].KeyName" --region $region --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo o par de chaves $keyPairName"
        aws ec2 delete-key-pair --key-name "$keyPairName" --region $region 

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Verificando se existe o arquivo de chave privada $keyPairName.pem"
        if [ -e "$keyPairPath/$keyPairName.pem" ]; then
            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Removendo o arquivo de chave privada $keyPairName.pem"
            rm "$keyPairPath/$keyPairName.pem"
        else
            echo "Não existe o arquivo de chave privada $keyPairName.pem"
        fi

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Verificando se existe o arquivo de chave privada $keyPairName.ppk"
        if [ -e "$keyPairPath/$keyPairName.ppk" ]; then
            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Removendo o arquivo de chave privada $keyPairName.ppk"
            rm "$keyPairPath/$keyPairName.ppk"
        else
            echo "Não existe o arquivo de chave privada $keyPairName.ppk"
        fi

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os pares de chaves criados"
        aws ec2 describe-key-pairs --query "KeyPairs[].KeyName" --region $region --output text
    else
        echo "Não existe o par de chaves $keyPairName"
    fi
else
    echo "Código não executado"
fi