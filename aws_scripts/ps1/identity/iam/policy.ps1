#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM POLICY "
    Write-Output "***********************************************"
    Write-Output "1) Criar Política ($($iamPolicyConfig.policyName))"
    Write-Output "2) Excluir Política ($($iamPolicyConfig.policyName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-IamPolicyExists -policyName $iamPolicyConfig.policyName
                if (($condition).Count -gt 0) {
                    Show-IamPolicyName -policyName $iamPolicyConfig.policyName
                } else {
                    Show-IamPoliciesAll
                    New-IamPolicy -policyName $iamPolicyConfig.policyName -policyDescription $iamPolicyConfig.policyDescription -policyFile $iamPolicyConfig.policyFile -policyDocument $iamPolicyConfig.policyDocument -tagKey $iamPolicyConfig.tagKey -tagValue $iamPolicyConfig.tagValue
                    Get-IamPolicyName -policyName $iamPolicyConfig.policyName
                }
            }

        "2" {
                $condition = Test-IamPolicyExists -policyName $iamPolicyConfig.policyName
                if (($condition).Count -gt 0) {
                    Show-IamPoliciesAll
                    Disconnect-IamPolicyUsers -policyName $iamPolicyConfig.policyName -policyArn $policyArn
                    Disconnect-IamPolicyGroups -policyName $iamPolicyConfig.policyName -policyArn $policyArn
                    Disconnect-IamPolicyRoles -policyName $iamPolicyConfig.policyName -policyArn $policyArn
                    $policyArn = Get-IamPolicyArn -policyName $iamPolicyConfig.policyName
                    Remove-IamPolicy -policyName $iamPolicyConfig.policyName -policyArn $policyArn
                    Show-IamPoliciesAll
                } else {Write-Output "Não existe a policy do IAM $($iamPolicyConfig.policyName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")