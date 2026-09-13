#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM MFA DEVICE "
    Write-Output "***********************************************"
    Write-Output "1) Criar o dispositivo MFA ($($iamMfaDeviceConfig.deviceName))"
    Write-Output "2) Excluir o dispositivo MFA ($($iamMfaDeviceConfig.deviceName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-IamMfaDeviceExists -deviceName $iamMfaDeviceConfig.deviceName
                if (($condition).Count -gt 0) {
                    Show-IamMfaDeviceName -deviceName $iamMfaDeviceConfig.deviceName
                } else {
                    Show-IamMfaDevicesAll
                    New-IamMfaDevice -deviceName $iamMfaDeviceConfig.deviceName -mfaPath $iamMfaDeviceConfig.mfaPath -mfaFile $iamMfaDeviceConfig.mfaFile -tagKey $iamMfaDeviceConfig.tagKey -tagValue $iamMfaDeviceConfig.tagValue
                    Get-IamMfaDeviceName -deviceName $iamMfaDeviceConfig.deviceName
                }
        }

        "2" {
                $condition = Test-IamMfaDeviceExists -deviceName $iamMfaDeviceConfig.deviceName
                if (($condition).Count -gt 0) {
                    Show-IamMfaDevicesAll
                    $deviceArn = Get-IamMfaDeviceArn -deviceName $iamMfaDeviceConfig.deviceName
                    Disconnect-IamMfaUser -deviceName $iamMfaDeviceConfig.deviceName -deviceArn $deviceArn
                    Remove-IamMfaDevice -deviceName $iamMfaDeviceConfig.deviceName -deviceArn $deviceArn -mfaPath $iamMfaDeviceConfig.mfaPath -mfaFile $iamMfaDeviceConfig.mfaFile
                    Show-IamMfaDevicesAll
                } else {Write-Output "Não existe um dispositivo de MFA com o nome $($iamMfaDeviceConfig.deviceName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")