#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM USER "
    Write-Output "***********************************************"
    Write-Output "1) Criar Usuário ($($iamUserConfig.userName))"
    Write-Output "2) Excluir Usuário ($($iamUserConfig.userName))"
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
                    Show-IamUserName -userName $iamUserConfig.userName
                } else {
                    Show-IamUsersAll
                    New-IamUser -userName $iamUserConfig.userName -tagKey $iamUserConfig.tagKey -tagValue $iamUserConfig.tagValue
                    New-IamLoginProfile -userName $iamUserConfig.userName -userPassword $iamUserConfig.userPassword
                    Get-IamUserName -userName $iamUserConfig.userName
                    }
            }

        "2" {
                $condition = Test-IamUserExists -userName $iamUserConfig.userName
                if (($condition).Count -gt 0) {
                    Show-IamUsersAll
                    Remove-IamUserGroupsAll -userName $iamUserConfig.userName
                    Disconnect-IamUserPoliciesAll -userName $iamUserConfig.userName
                    Remove-IamUserMfaAll -userName $iamUserConfig.userName
                    Remove-IamUserKeyAccessesAll -userName $iamUserConfig.userName -keyAccessPath $iamUserKeyAccessConfig.keyAccessPath -keyAccessFile $iamUserKeyAccessConfig.keyAccessFile
                    Remove-IamLoginProfile -userName $iamUserConfig.userName
                    Remove-IamUser -userName $iamUserConfig.userName
                    Show-IamUsersAll
                } else {Write-Output "Não existe o usuário do IAM $($iamUserConfig.userName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")