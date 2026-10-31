#!/usr/bin/env powershell
. "$PSScriptRoot\..\appIntegration_variables.ps1"
. "$PSScriptRoot\..\appIntegration_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

$defaults = Set-SnsTopicFifoDefaults -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -fifoTopic $snsTopicConfig.fifoTopic
$snsTopicConfig.topicName = $defaults.topicName
$snsTopicConfig.topicArn  = $defaults.topicArn

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - APP INTEGRATION - PROVISIONAMENTO - SNS SUBSCRIPTION "
    Write-Output "***********************************************"
    Write-Output "1) Criar Subscrição ($($snsSubscriptionConfig.snsEndpointName)) no Tópico ($($snsTopicConfig.topicName))"
    Write-Output "2) Excluir Subscrição ($($snsSubscriptionConfig.snsEndpointName)) do Tópico ($($snsTopicConfig.topicName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-SnsTopicExists -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn
                if (($condition).Count -gt 0) {
                    $condition = Test-SnsSubscriptionProtocol -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -protocol $snsSubscriptionConfig.protocol
                    if (($condition).Count -gt 0) {
                        $condition = Test-SnsSubscriptionExists -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -snsEndpoint $snsSubscriptionConfig.snsEndpoint -snsEndpointName $snsSubscriptionConfig.snsEndpointName
                        if (($condition).Count -gt 0) {
                            Show-SnsSubscriptionEndpoint -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -snsEndpoint $snsSubscriptionConfig.snsEndpoint -snsEndpointName $snsSubscriptionConfig.snsEndpointName
                        } else {
                            Show-SnsSubscriptionsAll -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn
                            New-SnsSubscription -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -protocol $snsSubscriptionConfig.protocol -snsEndpoint $snsSubscriptionConfig.snsEndpoint -snsEndpointName $snsSubscriptionConfig.snsEndpointName -dlqArn $snsSubscriptionConfig.dlqArn -filterPolicyScope $snsSubscriptionConfig.filterPolicyScope -filterPolicyFile $snsSubscriptionConfig.filterPolicyFile -filterPolicyDocument $snsSubscriptionConfig.filterPolicyDocument -rawMessageDelivery $snsSubscriptionConfig.rawMessageDelivery
                            Get-SnsSubscriptionArn -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -snsEndpoint $snsSubscriptionConfig.snsEndpoint -snsEndpointName $snsSubscriptionConfig.snsEndpointName
                        }
                    } else {Write-Output "O protocolo $($snsSubscriptionConfig.protocol) não é permitido para o tópico $($snsTopicConfig.topicName)"}
                } else {Write-Output "Não existe o tópico SNS $($snsTopicConfig.topicName)"}
            }

        "2" {
                $condition = Test-SnsSubscriptionExists -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -snsEndpoint $snsSubscriptionConfig.snsEndpoint -snsEndpointName $snsSubscriptionConfig.snsEndpointName
                if (($condition).Count -gt 0) {
                    Show-SnsSubscriptionsAll -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn
                    $subscriptionArn = Get-SnsSubscriptionArn -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -snsEndpoint $snsSubscriptionConfig.snsEndpoint -snsEndpointName $snsSubscriptionConfig.snsEndpointName
                    Remove-SnsSubscription -topicName $snsTopicConfig.topicName -snsEndpointName $snsSubscriptionConfig.snsEndpointName -subscriptionArn $subscriptionArn
                    Show-SnsSubscriptionsAll -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn
                } else {Write-Output "Não existe a subscrição de endpoint $($snsSubscriptionConfig.snsEndpointName) para o tópico $($snsTopicConfig.topicName)"}
        }

        "3" { Write-Output "Saindo..."; break }

        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")
