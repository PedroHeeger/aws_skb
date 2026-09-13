#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM INSTANCE PROFILE "
    Write-Output "***********************************************"
    Write-Output "1) Criar Instance Profile ($($instProfConfig.instProfName))"
    Write-Output "2) Excluir Instance Profile ($($instProfConfig.instProfName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-InstanceProfileExists -instProfName $instprofconfig.instProfName
                if (($condition).Count -gt 0) {
                    Show-InstanceProfileName -instProfName $instprofconfig.instProfName
                } else {
                    Show-InstanceProfilesAll
                    New-InstanceProfile -instProfName $instprofconfig.instProfName -tagKey $instprofconfig.tagKey -tagValue $instprofconfig.tagValue
                    Get-InstanceProfileName -instProfName $instprofconfig.instProfName
                }
            }

        "2" {
                $condition = Test-InstanceProfileExists -instProfName $instprofconfig.instProfName
                if (($condition).Count -gt 0) {
                    Show-InstanceProfilesAll
                    Disconnect-InstanceProfileRole -instProfName $instprofconfig.instProfName
                    Remove-InstanceProfile -instProfName $instprofconfig.instProfName
                    Show-InstanceProfilesAll
                } else {Write-Output "Não existe o instance profile do IAM $($instprofconfig.instProfName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")