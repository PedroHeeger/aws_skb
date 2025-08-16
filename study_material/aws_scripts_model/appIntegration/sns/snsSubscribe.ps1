#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON SNS"
Write-Output "SUBSCRIPTION CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$topicName = "snsTopicTest1"
$region = "us-east-1"
$accountId = "001727357081"
$topicArn = "arn:aws:sns:${region}:${accountId}:$topicName"
$protocol = "email"
$notificationEndpoint = "phcstudy@proton.me"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o tópico $topicName"
    $condition = aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe a subscrição de endpoint $notificationEndpoint para o tópico $topicName"
        $condition = aws sns list-subscriptions-by-topic --topic-arn $topicArn --query "Subscriptions[?Endpoint=='$notificationEndpoint'].Endpoint" --output text
        if (($condition).Count -gt 0) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Já existe a subscrição de endpoint $notificationEndpoint para o tópico $topicName"
            aws sns list-subscriptions-by-topic --topic-arn $topicArn --query "Subscriptions[?Endpoint=='$notificationEndpoint'].Endpoint" --output text
        } else {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando o endpoint de todas as subscrições do tópico $topicName"
            aws sns list-subscriptions-by-topic --topic-arn $topicArn --query "Subscriptions[].Endpoint" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Criando a subscrição de endpoint $notificationEndpoint para o tópico $topicName"
            aws sns subscribe --topic-arn $topicArn --protocol $protocol --notification-endpoint $notificationEndpoint

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se o endpoint $notificationEndpoint da subscrição para o tópico $topicName já foi confirmada"
            do {Write-Output "Confirme o endpoint $notificationEndpoint da subscrição"
                Start-Sleep -Seconds 10
                $status = (aws sns list-subscriptions-by-topic --topic-arn $topicArn --query "Subscriptions[?Endpoint=='$notificationEndpoint']" | ConvertFrom-Json).SubscriptionArn
            } while ($status -eq "PendingConfirmation")

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando a subscrição de endpoint $notificationEndpoint para o tópico $topicName"
            aws sns list-subscriptions-by-topic --topic-arn $topicArn --query "Subscriptions[?Endpoint=='$notificationEndpoint'].Endpoint" --output text
        }
    } else {Write-Output "Não existe o tópico $topicName"}
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AMAZON SNS"
Write-Output "SUBSCRIPTION EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$topicName = "snsTopicTest1"
$region = "us-east-1"
$accountId = "001727357081"
$topicArn = "arn:aws:sns:${region}:${accountId}:$topicName"
$protocol = "email"
$notificationEndpoint = "phcstudy@proton.me"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o tópico $topicName"
    $condition = aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe a subscrição de endpoint $notificationEndpoint para o tópico $topicName"
        $condition = aws sns list-subscriptions-by-topic --topic-arn $topicArn --query "Subscriptions[?Endpoint=='$notificationEndpoint'].Endpoint" --output text
        if (($condition).Count -gt 0) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando o endpoint de todas as subscrições do tópico $topicName"
            aws sns list-subscriptions-by-topic --topic-arn $topicArn --query "Subscriptions[].Endpoint" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo a ARN da subscrição de endpoint $notificationEndpoint do tópico $topicName"
            $subscriptionArn = aws sns list-subscriptions-by-topic --topic-arn $topicArn --query "Subscriptions[?Endpoint=='$notificationEndpoint'].SubscriptionArn" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Removendo a subscrição de endpoint $notificationEndpoint para o tópico $topicName"
            aws sns unsubscribe --subscription-arn $subscriptionArn

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando o endpoint de todas as subscrições do tópico $topicName"
            aws sns list-subscriptions-by-topic --topic-arn $topicArn --query "Subscriptions[].Endpoint" --output text
        } else {Write-Output "Não existe a subscrição de endpoint $notificationEndpoint para o tópico $topicName"}
    } else {Write-Output "Não existe o tópico $topicName"}        
} else {Write-Host "Código não executado"}