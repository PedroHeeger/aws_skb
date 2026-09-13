#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM USER POLICY "
    Write-Output "***********************************************"
    Write-Output "1) Adicionar a policy ($($iamPolicyConfig.policyName)) ao usuário ($($iamUserConfig.userName))"
    Write-Output "2) Excluir a policy ($($iamPolicyConfig.policyName)) do usuário ($($iamUserConfig.userName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-IamUserExists -userName $iamUserConfig.userName
                if (($condition).Count -gt 0) {
                    $condition = Test-IamUserPolicyAttached -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName
                    if (($condition)) {
                        Show-IamUserPolicy -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName
                    } else {
                        Show-IamUserPoliciesAll -userName $iamUserConfig.userName
                        Add-IamUserPolicy -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName -policyFile $iamPolicyConfig.policyFile -policyDocument $iamPolicyConfig.policyDocument
                        Get-IamUserPolicy -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName
                    }
                } else {Write-Output "Não existe o usuário do IAM $($iamUserConfig.userName)"}
            }

        "2" {
                $condition = Test-IamUserExists -userName $iamUserConfig.userName
                if (($condition).Count -gt 0) {
                    $condition = Test-IamUserPolicyAttached -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName
                    if (($condition)) {
                        Show-IamUserPoliciesAll -userName $iamUserConfig.userName
                        Remove-IamUserPolicy -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName
                        Show-IamUserPoliciesAll -userName $iamUserConfig.userName
                    } else {Write-Output "Não existe a policy $($iamPolicyConfig.policyName) no usuário $($iamUserConfig.userName)"}
                } else {Write-Output "Não existe o usuário do IAM $($iamUserConfig.userName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")
