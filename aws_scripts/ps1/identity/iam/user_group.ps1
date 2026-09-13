#!/usr/bin/env powershell
. "$PSScriptRoot\..\identity_variables.ps1"
. "$PSScriptRoot\..\identity_functions.ps1"
$env:AWS_PROFILE = $awsProfile
$env:AWS_DEFAULT_REGION = $region

function Show-Menu {
    Write-Output "***********************************************"
    Write-Output " AWS - IDENTITY - PROVISIONAMENTO - IAM USER GROUP "
    Write-Output "***********************************************"
    Write-Output "1) Adicionar o usuário ($($iamUserConfig.userName)) ao grupo ($($iamGroupConfig.groupName))"
    Write-Output "2) Excluir o usuário ($($iamUserConfig.userName)) do grupo ($($iamGroupConfig.groupName))"
    Write-Output "3) Sair"
    Write-Output "***********************************************"
}

do {
    Show-Menu
    $selection = Read-Host "Escolha uma opção"
    switch ($selection) {
        "1" {
                $condition = Test-IamGroupAndUserExists -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName
                if (($condition)) {
                    $condition = Test-IamGroupUserAttached -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName
                    if (($condition).Count -gt 0) {
                        Show-IamGroupUser -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName
                    } else {
                        Show-IamGroupUsersAll -groupName $iamGroupConfig.groupName
                        Add-IamGroupUser -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName
                        Get-IamGroupUser -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName
                    }
                } else {Write-Output "Não existe o grupo do IAM $($iamGroupConfig.groupName) ou o usuário $($iamUserConfig.userName)"}
            }

        "2" {
                $condition = Test-IamGroupAndUserExists -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName
                if (($condition)) {
                    $condition = Test-IamGroupUserAttached -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName
                    if (($condition).Count -gt 0) {
                        Show-IamGroupUsersAll -groupName $iamGroupConfig.groupName
                        Remove-IamGroupUser -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName
                        Show-IamGroupUsersAll -groupName $iamGroupConfig.groupName
                    } else {Write-Output "Não existe o usuário $($iamUserConfig.userName) no grupo $($iamGroupConfig.groupName)"}
                } else {Write-Output "Não existe o grupo do IAM $($iamGroupConfig.groupName) ou o usuário $($iamUserConfig.userName)"}
        }

        "3" { Write-Output "Saindo..."; break }
        
        Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
    }
} while ($selection -ne "3")





















# Write-Output "***********************************************"
# Write-Output "SERVIÇO: AWS IAM"
# Write-Output "IAM USER ADD GROUP"

# Write-Output "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "Definindo variáveis"
# $iamGroupName = "iamGroupTest"
# $iamUserName = "iamUserTest"

# Write-Output "-----//-----//-----//-----//-----//-----//-----"
# $resposta = Read-Host "Deseja executar o código? (y/n) "
# if ($resposta.ToLower() -eq 'y') {
#     Write-Output "-----//-----//-----//-----//-----//-----//-----"
#     Write-Output "Verificando se existe o grupo $iamGroupName e o usuário do IAM $iamUserName"
#     $condition = (aws iam list-groups --query "Groups[?GroupName=='$iamGroupName'].GroupName" --output text).Count -gt 0 -and (aws iam list-users --query "Users[?UserName=='$iamUserName'].UserName" --output text).Count -gt 0
#     if ($condition) {
#         Write-Output "-----//-----//-----//-----//-----//-----//-----"
#         Write-Output "Verificando se existe o usuário do IAM $iamUserName no grupo $iamGroupName"
#         $condition = aws iam get-group --group-name $iamGroupName --query "Users[?UserName=='$iamUserName'].UserName" --output text
#         if (($condition).Count -gt 0) {
#             Write-Output "-----//-----//-----//-----//-----//-----//-----"
#             Write-Output "Já existe o usuário do IAM $iamUserName no grupo $iamGroupName"
#             aws iam get-group --group-name $iamGroupName --query "Users[?UserName=='$iamUserName'].UserName" --output text
#         } else {
#             Write-Output "-----//-----//-----//-----//-----//-----//-----"
#             Write-Output "Listando todos os usuários do IAM do grupo $iamGroupName"
#             aws iam get-group --group-name $iamGroupName --query "Users[].UserName" --output text
        
#             Write-Output "-----//-----//-----//-----//-----//-----//-----"
#             Write-Output "Adicionando o usuário do IAM $iamUserName ao grupo $iamGroupName"
#             aws iam add-user-to-group --user-name $iamUserName --group-name $iamGroupName

#             Write-Output "-----//-----//-----//-----//-----//-----//-----"
#             Write-Output "Listando o usuário $iamUserName no grupo $iamGroupName"
#             aws iam get-group --group-name $iamGroupName --query "Users[?UserName=='$iamUserName'].UserName" --output text
#         }
#     } else {Write-Output "Não existe o grupo $iamGroupName ou o usuário do IAM $iamUserName"}
# } else {Write-Host "Código não executado"}




# #!/usr/bin/env powershell

# Write-Output "***********************************************"
# Write-Output "SERVIÇO: AWS IAM"
# Write-Output "IAM USER REMOVE GROUP"

# Write-Output "-----//-----//-----//-----//-----//-----//-----"
# Write-Output "Definindo variáveis"
# $iamGroupName = "iamGroupTest"
# $iamUserName = "iamUserTest"

# Write-Output "-----//-----//-----//-----//-----//-----//-----"
# $resposta = Read-Host "Deseja executar o código? (y/n) "
# if ($resposta.ToLower() -eq 'y') {
#     Write-Output "-----//-----//-----//-----//-----//-----//-----"
#     Write-Output "Verificando se existe o grupo $iamGroupName e o usuário do IAM $iamUserName"
#     $condition = (aws iam list-groups --query "Groups[?GroupName=='$iamGroupName'].GroupName" --output text).Count -gt 0 -and (aws iam list-users --query "Users[?UserName=='$iamUserName'].UserName" --output text).Count -gt 0
#     if ($condition) {
#         Write-Output "-----//-----//-----//-----//-----//-----//-----"
#         Write-Output "Verificando se existe o usuário do IAM $iamUserName no grupo $iamGroupName"
#         $condition = aws iam get-group --group-name $iamGroupName --query "Users[?UserName=='$iamUserName'].UserName" --output text
#         if (($condition).Count -gt 0) {
#             Write-Output "-----//-----//-----//-----//-----//-----//-----"
#             Write-Output "Listando todos os usuários do IAM do grupo $iamGroupName"
#             aws iam get-group --group-name $iamGroupName --query "Users[].UserName" --output text

#             Write-Output "-----//-----//-----//-----//-----//-----//-----"
#             Write-Output "Removendo o usuário do IAM $iamUserName do grupo $iamGroupName"
#             aws iam remove-user-from-group --user-name $iamUserName --group-name $iamGroupName

#             Write-Output "-----//-----//-----//-----//-----//-----//-----"
#             Write-Output "Listando todos os usuários do IAM do grupo $iamGroupName"
#             aws iam get-group --group-name $iamGroupName --query "Users[].UserName" --output text
#         } else {Write-Output "Não existe o usuário do IAM $iamUserName no grupo $iamGroupName"}
#     } else {Write-Output "Não existe o grupo $iamGroupName ou o usuário do IAM $iamUserName"}      
# } else {Write-Host "Código não executado"}