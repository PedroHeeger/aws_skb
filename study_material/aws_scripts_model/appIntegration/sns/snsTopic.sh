#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AMAZON SNS"
echo "TOPIC CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
topicName="snsTopicTest1"
displayName="SNS Topic Test 1"
region="us-east-1"
accountId="001727357081"
topicArn="arn:aws:sns:${region}:${accountId}:${topicName}"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [[ "$resposta" == "y" || "$resposta" == "Y" ]]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o tópico $topicName"
    condition=$(aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text | wc -w)
    if [[ "$condition" -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe o tópico $topicName"
        aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o ARN de todos os tópicos"
        aws sns list-topics --query "Topics[].TopicArn" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o tópico $topicName"
        aws sns create-topic --name $topicName --attributes DisplayName=$displayName

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o tópico $topicName"
        aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
    fi
else
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AMAZON SNS"
echo "TOPIC EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
topicName="snsTopicTest1"
region="us-east-1"
accountId="001727357081"
topicArn="arn:aws:sns:${region}:${accountId}:${topicName}"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [[ "$resposta" == "y" || "$resposta" == "Y" ]]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o tópico $topicName"
    condition=$(aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text | wc -w)
    if [[ "$condition" -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o ARN de todos os tópicos"
        aws sns list-topics --query "Topics[].TopicArn" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo o tópico $topicName"
        aws sns delete-topic --topic-arn $topicArn

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o ARN de todos os tópicos"
        aws sns list-topics --query "Topics[].TopicArn" --output text
    else
        echo "Não existe o tópico $topicName"
    fi
else
    echo "Código não executado"
fi