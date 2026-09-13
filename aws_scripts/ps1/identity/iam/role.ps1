#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM ROLE "
    Write-Output "***********************************************"
    Write-Output "1) Criar Role ($($iamRoleConfig.roleName))"
    Write-Output "2) Excluir Role ($($iamRoleConfig.roleName))"
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
                    Show-IamRoleName -roleName $iamRoleConfig.roleName
                } else {
                    Show-IamRolesAll
                    New-IamRole -roleName $iamRoleConfig.roleName -roleDescription $iamRoleConfig.roleDescription -trustPolicyFile $iamRoleConfig.trustPolicyFile -trustPolicyDocument $iamRoleConfig.trustPolicyDocument -tagKey $iamRoleConfig.tagKey -tagValue $iamRoleConfig.tagValue
                    Get-IamRoleName -roleName $iamRoleConfig.roleName
                }
            }

        "2" {
                $condition = Test-IamRoleExists -roleName $iamRoleConfig.roleName
                if (($condition).Count -gt 0) {
                    Show-IamRolesAll
                    Disconnect-IamRoleInstanceProfilesAll -roleName $iamRoleConfig.roleName
                    Disconnect-IamRolePoliciesAll -roleName $iamRoleConfig.roleName
                    Remove-IamRole -roleName $iamRoleConfig.roleName
                    Show-IamRolesAll
                } else {Write-Output "Não existe a role do IAM $($iamRoleConfig.roleName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")