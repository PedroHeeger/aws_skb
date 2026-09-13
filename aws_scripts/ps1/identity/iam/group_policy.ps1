#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM GROUP POLICY "
    Write-Output "***********************************************"
    Write-Output "1) Adicionar a policy ($($iamPolicyConfig.policyName)) ao grupo ($($iamGroupConfig.groupName))"
    Write-Output "2) Excluir a policy ($($iamPolicyConfig.policyName)) do grupo ($($iamGroupConfig.groupName))"
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
                    $condition = Test-IamGroupPolicyAttached -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName
                    if (($condition)) {
                        Show-IamGroupPolicy -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName
                    } else {
                        Show-IamGroupPoliciesAll -groupName $iamGroupConfig.groupName
                        Add-IamGroupPolicy -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName -policyFile $iamPolicyConfig.policyFile -policyDocument $iamPolicyConfig.policyDocument
                        Get-IamGroupPolicy -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName
                    }
                } else {Write-Output "Não existe o grupo do IAM $($iamGroupConfig.groupName)"}
            }

        "2" {
                $condition = Test-IamGroupExists -groupName $iamGroupConfig.groupName
                if (($condition).Count -gt 0) {
                    $condition = Test-IamGroupPolicyAttached -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName
                    if (($condition)) {
                        Show-IamGroupPoliciesAll -groupName $iamGroupConfig.groupName
                        Remove-IamGroupPolicy -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName
                        Show-IamGroupPoliciesAll -groupName $iamGroupConfig.groupName
                    } else {Write-Output "Não existe a policy $($iamPolicyConfig.policyName) no grupo $($iamGroupConfig.groupName)"}
                } else {Write-Output "Não existe o grupo do IAM $($iamGroupConfig.groupName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")
