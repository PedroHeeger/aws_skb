#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM GROUP "
    Write-Output "***********************************************"
    Write-Output "1) Criar Grupo ($($iamGroupConfig.groupName))"
    Write-Output "2) Excluir Grupo ($($iamGroupConfig.groupName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-IamGroupExists -groupName $iamGroupConfig.groupName
                if (($condition).Count -gt 0) {
                    Show-IamGroupName -groupName $iamGroupConfig.groupName
                } else {
                    Show-IamGroupsAll
                    New-IamGroup -groupName $iamGroupConfig.groupName
                    Get-IamGroupName -groupName $iamGroupConfig.groupName
                }
            }

        "2" {
                $condition = Test-IamGroupExists -groupName $iamGroupConfig.groupName
                if (($condition).Count -gt 0) {
                    Show-IamGroupsAll
                    Remove-IamGroupUsersAll -groupName $iamGroupConfig.groupName
                    Disconnect-IamGroupPoliciesAll -groupName $iamGroupConfig.groupName
                    Remove-IamGroup -groupName $iamGroupConfig.groupName
                    Show-IamGroupsAll
                } else {Write-Output "Não existe o grupo do IAM $($iamGroupConfig.groupName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")