#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON SNS"
Write-Output "TOPIC CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$topicName = "snsTopicTest1"
$displayName = "SNS Topic Test 1"
$region = "us-east-1"
$accountId = "001727357081"
$topicArn = "arn:aws:sns:${region}:${accountId}:$topicName"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o tópico $topicName"
    $condition = aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o tópico $topicName"
        aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o ARN de todos os tópicos"
        aws sns list-topics --query "Topics[].TopicArn" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o tópico $topicName"
        aws sns create-topic --name $topicName --attributes DisplayName=$displayName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o tópico $topicName"
        aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON SNS"
Write-Output "TOPIC EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$topicName = "snsTopicTest1"
$region = "us-east-1"
$accountId = "001727357081"
$topicArn = "arn:aws:sns:${region}:${accountId}:$topicName"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o tópico $topicName"
    $condition = aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o ARN de todos os tópicos"
        aws sns list-topics --query "Topics[].TopicArn" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o tópico $topicName"
        aws sns delete-topic --topic-arn $topicArn

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o ARN de todos os tópicos"
        aws sns list-topics --query "Topics[].TopicArn" --output text
    } else {Write-Output "Não existe o tópico $topicName"}
} else {Write-Host "Código não executado"}