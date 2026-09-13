#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM INSTANCE PROFILE ROLE "
    Write-Output "***********************************************"
    Write-Output "1) Adicionar a role ($($iamRoleConfig.roleName)) ao instance profile ($($instProfConfig.instProfName))"
    Write-Output "2) Excluir a role ($($iamRoleConfig.roleName)) do instance profile ($($instProfConfig.instProfName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-IamInstProfAndRoleExists -instProfName $instProfConfig.instProfName -roleName $iamRoleConfig.roleName
                if (($condition)) {
                    $condition = Test-IamInstProfRoleAttached -instProfName $instProfConfig.instProfName -roleName $iamRoleConfig.roleName
                    if (($condition).Count -gt 0) {
                        Show-IamInstProfRole -instProfName $instProfConfig.instProfName -roleName $iamRoleConfig.roleName
                    } else {
                        Show-IamInstProfRolesAll -instProfName $instProfConfig.instProfName
                        Add-RoleToInstanceProfile -instProfName $instProfConfig.instProfName -roleName $iamRoleConfig.roleName
                        Get-IamInstProfRole -instProfName $instProfConfig.instProfName -roleName $iamRoleConfig.roleName
                    }
                } else {Write-Output "Não existe o instance profile $($instProfConfig.instProfName) ou a role $($iamRoleConfig.roleName)"}
            }

        "2" {
                $condition = Test-IamInstProfAndRoleExists -instProfName $instProfConfig.instProfName -roleName $iamRoleConfig.roleName
                if (($condition)) {
                    $condition = Test-IamInstProfRoleAttached -instProfName $instProfConfig.instProfName -roleName $iamRoleConfig.roleName
                    if (($condition).Count -gt 0) {
                        Show-IamInstProfRolesAll -instProfName $instProfConfig.instProfName
                        Remove-IamInstanceProfileRole -instProfName $instProfConfig.instProfName -roleName $iamRoleConfig.roleName
                        Show-IamInstProfRolesAll -instProfName $instProfConfig.instProfName
                    } else {Write-Output "Não existe a role $($iamRoleConfig.roleName) no instance profile $($instProfConfig.instProfName)"}
                } else {Write-Output "Não existe o instance profile $($instProfConfig.instProfName) ou a role $($iamRoleConfig.roleName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")