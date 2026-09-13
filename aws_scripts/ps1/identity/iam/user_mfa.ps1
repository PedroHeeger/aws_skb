#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM USER MFA "
    Write-Output "***********************************************"
    Write-Output "1) Adicionar o dispositivo MFA ($($iamMfaDeviceConfig.deviceName)) para o usuário ($($iamUserConfig.userName))"
    Write-Output "2) Excluir o dispositivo MFA ($($iamMfaDeviceConfig.deviceName)) do usuário ($($iamUserConfig.userName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-IamUserAndMfaDeviceExists -userName $iamUserConfig.userName -deviceName $iamMfaDeviceConfig.deviceName
                if (($condition)) {
                    $condition = Test-IamUserMfaAttached -userName $iamUserConfig.userName -deviceName $iamMfaDeviceConfig.deviceName
                    if (($condition).Count -gt 0) {
                        Show-IamUserMfa -userName $iamUserConfig.userName -deviceName $iamMfaDeviceConfig.deviceName
                    } else {
                        Show-IamUserMfaDevicesAll -userName $iamUserConfig.userName
                        Enable-IamUserMfaDevice -userName $iamUserConfig.userName -deviceName $iamMfaDeviceConfig.deviceName
                        Get-IamUserMfa -userName $iamUserConfig.userName -deviceName $iamMfaDeviceConfig.deviceName
                    }
                } else {Write-Output "Não existe o usuário do IAM $($iamUserConfig.userName) ou o dispositivo MFA $($iamMfaDeviceConfig.deviceName)"}
            }

        "2" {
                $condition = Test-IamUserAndMfaDeviceExists -userName $iamUserConfig.userName -deviceName $iamMfaDeviceConfig.deviceName
                if (($condition)) {
                    $condition = Test-IamUserMfaAttached -userName $iamUserConfig.userName -deviceName $iamMfaDeviceConfig.deviceName
                    if (($condition).Count -gt 0) {
                        Show-IamUserMfaDevicesAll -userName $iamUserConfig.userName
                        $deviceArn = Get-IamMfaDeviceArn -deviceName $iamMfaDeviceConfig.deviceName
                        Disconnect-IamMfaUser -deviceName $iamMfaDeviceConfig.deviceName -deviceArn $deviceArn
                        Show-IamUserMfaDevicesAll -userName $iamUserConfig.userName
                    } else {Write-Output "Não existe o dipositivo MFA $($iamMfaDeviceConfig.deviceName) associado ao usuário do IAM $($iamUserConfig.userName)"}
                } else {Write-Output "Não existe o usuário do IAM $($iamUserConfig.userName) ou o dispositivo MFA ($($iamMfaDeviceConfig.deviceName))"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")