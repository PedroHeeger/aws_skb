#!/usr/bin/env powershell
. "$PSScriptRoot\..\cost_variables.ps1"
. "$PSScriptRoot\..\cost_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - COST - PROVISIONAMENTO - BUDGET "
    Write-Output "***********************************************"
    Write-Output "1) Criar Budget ($($budgetConfig.budgetName))"
    Write-Output "2) Excluir Budget ($($budgetConfig.budgetName))"
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
                    Show-BudgetName -accountId $accountId -budgetName $budgetConfig.budgetName
                } else {
                    Show-BudgetsAll -accountId $accountId
                    New-Budget -accountId $accountId -budgetName $budgetConfig.budgetName -budgetType $budgetConfig.budgetType -timeUnit $budgetConfig.timeUnit -budgetingMethod $budgetConfig.budgetingMethod -budgetAdjustmentPeriod $budgetConfig.budgetAdjustmentPeriod -limitAmount $budgetConfig.limitAmount -priceUnit $budgetConfig.priceUnit -usageUnit $budgetConfig.usageUnit -timePeriodStart $budgetConfig.timePeriodStart -timePeriodEnd $budgetConfig.timePeriodEnd -utilizationThreshold $budgetConfig.utilizationThreshold -budgetAgainst $budgetConfig.budgetAgainst -budgetAgainstValues $budgetConfig.budgetAgainstValues -tagKey $budgetConfig.tagKey -tagValue $budgetConfig.tagValue
                    Get-BudgetName -accountId $accountId -budgetName $budgetConfig.budgetName
                }
            }

        "2" {
                $condition = Test-BudgetExists -accountId $accountId -budgetName $budgetConfig.budgetName
                if (($condition).Count -gt 0) {
                    Show-BudgetsAll -accountId $accountId
                    Disconnect-BudgetNotificationsAll -accountId $accountId -budgetName $budgetConfig.budgetName
                    Remove-Budget -accountId $accountId -budgetName $budgetConfig.budgetName
                    Show-BudgetsAll -accountId $accountId
                } else {Write-Output "Não existe o budget $($budgetConfig.budgetName)"}
        }

        "3" { Write-Output "Saindo..."; break }

        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")
