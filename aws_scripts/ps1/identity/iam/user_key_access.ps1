#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM USER KEY ACCESS "
    Write-Output "***********************************************"
    Write-Output "1) Criar chave de acesso para o usuário ($($iamUserConfig.userName))"
    Write-Output "2) Excluir chave de acesso para o usuário ($($iamUserConfig.userName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-IAMUserExists -userName $iamUserConfig.userName
                if (($condition).Count -gt 0) {
                    $condition = Test-IamUserKeyAccessExists -userName $iamUserConfig.userName
                    if (($condition).Count -gt 0) {
                        Show-IamUserKeyAccessId -userName $iamUserConfig.userName
                    } else {
                        Show-IamUserKeyAccessesAll -userName $iamUserConfig.userName
                        New-IamUserKeyAccess -userName $iamUserConfig.userName -keyAccessPath $iamUserKeyAccessConfig.keyAccessPath -keyAccessFile $iamUserKeyAccessConfig.keyAccessFile
                        Get-IamUserKeyAccessId -userName $iamUserConfig.userName
                    }
                } else {Write-Output "Não existe o usuário do IAM $($iamUserConfig.userName)"}
            }

        "2" {
                $condition = Test-IAMUserExists -userName $iamUserConfig.userName
                if (($condition).Count -gt 0) {
                    $condition = Test-IamUserKeyAccessExists -userName $iamUserConfig.userName
                    if (($condition).Count -gt 0) {
                        Show-IamUserKeyAccessesAll -userName $iamUserConfig.userName
                        $keyAccessId = Get-IamUserKeyAccessId -userName $iamUserConfig.userName
                        Remove-IamUserKeyAccess -userName $iamUserConfig.userName -keyAccessId $keyAccessId -keyAccessPath $iamUserKeyAccessConfig.keyAccessPath -keyAccessFile $iamUserKeyAccessConfig.keyAccessFile
                        Show-IamUserKeyAccessesAll -userName $iamUserConfig.userName
                    } else {Write-Output "Não existe chave de acesso para o usuário do IAM $($iamUserConfig.userName)"}
                } else {Write-Output "Não existe o usuário do IAM $($iamUserConfig.userName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")