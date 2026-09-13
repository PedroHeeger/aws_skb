#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM ROLE POLICY "
    Write-Output "***********************************************"
    Write-Output "1) Adicionar a policy ($($iamPolicyConfig.policyName)) à role ($($iamRoleConfig.roleName))"
    Write-Output "2) Excluir a policy ($($iamPolicyConfig.policyName)) da role ($($iamRoleConfig.roleName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-IamRoleExists -roleName $iamRoleConfig.roleName
                if (($condition).Count -gt 0) {
                    $condition = Test-IamRolePolicyAttached -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName
                    if (($condition)) {
                        Show-IamRolePolicy -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName
                    } else {
                        Show-IamRolePoliciesAll -roleName $iamRoleConfig.roleName
                        Add-IamRolePolicy -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName -policyFile $iamPolicyConfig.policyFile -policyDocument $iamPolicyConfig.policyDocument
                        Get-IamRolePolicy -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName
                    }
                } else {Write-Output "Não existe a role do IAM $($iamRoleConfig.roleName)"}
            }

        "2" {
                $condition = Test-IamRoleExists -roleName $iamRoleConfig.roleName
                if (($condition).Count -gt 0) {
                    $condition = Test-IamRolePolicyAttached -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName
                    if (($condition)) {
                        Show-IamRolePoliciesAll -roleName $iamRoleConfig.roleName
                        Remove-IamRolePolicy -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName
                        Show-IamRolePoliciesAll -roleName $iamRoleConfig.roleName
                    } else {Write-Output "Não existe a policy $($iamPolicyConfig.policyName) na role $($iamRoleConfig.roleName)"}
                } else {Write-Output "Não existe a role do IAM $($iamRoleConfig.roleName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")
