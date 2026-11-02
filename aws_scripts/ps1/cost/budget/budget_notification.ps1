#!/usr/bin/env powershell
. "$PSScriptRoot\..\cost_variables.ps1"
. "$PSScriptRoot\..\cost_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

$defaults = Set-BudgetNotificationDefaults -budgetType $budgetConfig.budgetType -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator
$budgetNotificationConfig.notificationType   = $defaults.notificationType
$budgetNotificationConfig.comparisonOperator = $defaults.comparisonOperator

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - COST - PROVISIONAMENTO - BUDGET NOTIFICATION "
    Write-Output "***********************************************"
    Write-Output "1) Criar Notificação no Budget ($($budgetConfig.budgetName))"
    Write-Output "2) Excluir Notificação do Budget ($($budgetConfig.budgetName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-BudgetExists -accountId $accountId -budgetName $budgetConfig.budgetName
                if (($condition).Count -gt 0) {
                    $condition = Test-BudgetNotificationExists -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType
                    if (($condition).Count -gt 0) {
                        Show-BudgetNotification -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType
                    } else {
                        Show-BudgetNotificationsAll -accountId $accountId -budgetName $budgetConfig.budgetName
                        New-BudgetNotification -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType -subscribers $budgetNotificationConfig.subscribers
                        Get-BudgetNotification -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType
                    }
                } else {Write-Output "Não existe o budget $($budgetConfig.budgetName)"}
            }

        "2" {
                $condition = Test-BudgetExists -accountId $accountId -budgetName $budgetConfig.budgetName
                if (($condition).Count -gt 0) {
                    $condition = Test-BudgetNotificationExists -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType
                    if (($condition).Count -gt 0) {
                        Show-BudgetNotificationsAll -accountId $accountId -budgetName $budgetConfig.budgetName
                        Remove-BudgetNotification -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType
                        Show-BudgetNotificationsAll -accountId $accountId -budgetName $budgetConfig.budgetName
                    } else {Write-Output "Não existe a notificação configurada no budget $($budgetConfig.budgetName)"}
                } else {Write-Output "Não existe o budget $($budgetConfig.budgetName)"}
        }

        "3" { Write-Output "Saindo..."; break }

        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")
