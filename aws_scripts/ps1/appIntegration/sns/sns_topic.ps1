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
    Write-Output " AWS - APP INTEGRATION - PROVISIONAMENTO - SNS TOPIC "
    Write-Output "***********************************************"
    Write-Output "1) Criar Tópico SNS ($($snsTopicConfig.topicName))"
    Write-Output "2) Excluir Tópico SNS ($($snsTopicConfig.topicName))"
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
                    Show-SnsTopicArn -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn
                } else {
                    Show-SnsTopicsAll
                    New-SnsTopic -topicName $snsTopicConfig.topicName -displayName $snsTopicConfig.displayName -fifoTopic $snsTopicConfig.fifoTopic -contentBasedDeduplication $snsTopicConfig.contentBasedDeduplication -kmsMasterKeyId $snsTopicConfig.kmsMasterKeyId -maxMessageSize $snsTopicConfig.maxMessageSize -topicArn $snsTopicConfig.topicArn -accountId $accountId -accessPolicyFile $snsTopicConfig.accessPolicyFile -tagKey $snsTopicConfig.tagKey -tagValue $snsTopicConfig.tagValue
                    Get-SnsTopicArn -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn
                }
            }

        "2" {
                $condition = Test-SnsTopicExists -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn
                if (($condition).Count -gt 0) {
                    Show-SnsTopicsAll
                    Remove-SnsTopic -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn
                    Show-SnsTopicsAll
                } else {Write-Output "Não existe o tópico SNS $($snsTopicConfig.topicName)"}
        }

        "3" { Write-Output "Saindo..."; break }

        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")
