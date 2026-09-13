#!/usr/bin/env powershell




# IAM User:
    function Test-IamUserExists {
        <# Verifica se existe um usuário no IAM com o nome especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )
        
        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o usuário do IAM $userName"
        $userName = aws iam list-users --query "Users[?UserName=='$userName'].UserName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência do usuário do IAM $userName." -ForegroundColor Red }
        return $userName
    }
    # $userFound = Test-IAMUserExists -userName $iamUserConfig.userName


    function Show-IamUserName {
        <# Exibe o nome do usuário IAM especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe um usuário do IAM $userName"
        $userName = aws iam list-users --query "Users[?UserName=='$userName'].UserName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir o usuário do IAM $userName." -ForegroundColor Red }
        return $userName
    }
    # Show-IamUserName -userName $iamUserConfig.userName


    function Show-IamUsersAll {
        <# Lista o UserName de todos os usuários IAM criados #>
        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todos os usuários do IAM criados"
        $users = aws iam list-users --query "Users[].UserName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar os usuários do IAM." -ForegroundColor Red }
        return $users
    }
    # Show-IamUsersAll


    function New-IamUser {
        <# Cria um novo usuário no IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [string]$tagKey, [string]$tagValue
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Criando o usuário do IAM $userName"
        aws iam create-user --user-name $userName --tags "Key=$tagKey,Value=$tagValue" --output json --no-cli-pager
        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o usuário do IAM $userName." -ForegroundColor Red }
    }
    # New-IamUser -userName $iamUserConfig.userName -tagKey $iamUserConfig.tagKey -tagValue $iamUserConfig.tagValue


    function New-IamLoginProfile {
        <# Cria um perfil de login (acesso ao console) para o usuário especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$userPassword
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Criando um perfil de login do usuário do IAM $userName"
        aws iam create-login-profile --user-name $userName --password $userPassword --output json
        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o perfil de login do usuário $userName." -ForegroundColor Red }
    }
    # New-IamLoginProfile -userName $iamUserConfig.userName -userPassword $iamUserConfig.userPassword


    function Get-IamUserName {
        <# Extrai o nome de um usuário IAM específico #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o usuário do IAM $userName"
        aws iam list-users --query "Users[?UserName=='$userName'].UserName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o usuário do IAM $userName." -ForegroundColor Red }
    }
    # Get-IamUserName -userName $iamUserConfig.userName


    function Remove-IamUserGroupsAll {
        <# Verifica os grupos do usuário e o remove de cada um deles #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando quais grupos o usuário do IAM $userName está inserido"
        $condition = aws iam list-groups-for-user --user-name $userName --query 'Groups[].GroupName' --output text
        # Verifica se o retorno não está vazio ou nulo
        if (-not [string]::IsNullOrWhiteSpace($condition)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando os grupos do usuário do IAM $userName em uma lista"
            $groups = $condition -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo o usuário do IAM $userName dos grupos"
            foreach ($iamGroupName in $groups) {aws iam remove-user-from-group --group-name $iamGroupName --user-name $userName}
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover o usuário $userName dos grupos." -ForegroundColor Red }
        } else {Write-Host "Não existem grupos que o usuário do IAM $userName faça parte"}
    }
    # Remove-IamUserGroupsAll -userName $iamUserConfig.userName


    function Disconnect-IamUserPoliciesAll {
        <# Verifica as managed e inline policies do usuário e as remove #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem managed policies vinculadas ao usuário do IAM $userName"
        $condition = aws iam list-attached-user-policies --user-name $userName --query "AttachedPolicies[].PolicyName" --output text

        if (-not [string]::IsNullOrWhiteSpace($condition)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando as managed policies do usuário do IAM $userName em uma lista"
            $policies = $condition -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo as managed policies do usuário do IAM $userName"
            foreach ($policyName in $policies) {
                $policyArn = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].Arn" --output text
                aws iam detach-user-policy --user-name $userName --policy-arn $policyArn    
            }
            if ($LastExitCode -ne 0) { Write-Host "Falha ao desanexar as managed policies do usuário $userName." -ForegroundColor Red }
        } else {Write-Host "Não existem managed policies vinculadas ao usuário do IAM $userName"}

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem inline policies vinculadas ao usuário do IAM $userName"
        $conditionInline = aws iam list-user-policies --user-name $userName --query "PolicyNames[]" --output text

        if (-not [string]::IsNullOrWhiteSpace($conditionInline)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando as inline policies do usuário do IAM $userName em uma lista"
            $inlinePolicies = $conditionInline -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo as inline policies do usuário do IAM $userName"
            foreach ($policyName in $inlinePolicies) {
                aws iam delete-user-policy --user-name $userName --policy-name $policyName
            }
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover as inline policies do usuário $userName." -ForegroundColor Red }
        } else {Write-Host "Não existem inline policies vinculadas ao usuário do IAM $userName"}
    }
    # Disconnect-IamUserPoliciesAll -userName $userName


    function Remove-IamUserMfaAll {
        <# Verifica os dispositivos MFA do usuário e os desativa se existirem #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem dispositivos MFA associados ao usuário do IAM $userName"
        $condition = aws iam list-mfa-devices --user-name $userName --query "MFADevices[].SerialNumber" --output text

        if (-not [string]::IsNullOrWhiteSpace($condition)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando os dispositivos MFA do usuário do IAM $userName em uma lista"
            $serialNumbers = $condition -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Desativando os dispositivos MFA do usuário do IAM $userName"
            foreach ($serialNumber in $serialNumbers) {
                aws iam deactivate-mfa-device --user-name $userName --serial-number $serialNumber
            }
            if ($LastExitCode -ne 0) { Write-Host "Falha ao desativar os dispositivos MFA do usuário $userName." -ForegroundColor Red }
        } else {Write-Host "Não existem dispositivos MFA associados ao usuário do IAM $userName"}
    }
    # Remove-IamUserMfaAll -userName $userName


    function Remove-IamUserKeyAccessesAll {
        <# Verifica as chaves de acesso do usuário, as remove se existirem e apaga o arquivo local se existir #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [string]$keyAccessPath,
            [string]$keyAccessFile
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem chaves de acesso para o usuário do IAM $userName"
        $condition = aws iam list-access-keys --user-name $userName --query "AccessKeyMetadata[].AccessKeyId" --output text

        if (-not [string]::IsNullOrWhiteSpace($condition)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando as chaves de acesso do usuário do IAM $userName em uma lista"
            $keyAccessIds = $condition -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo as chaves de acesso do usuário do IAM $userName"
            foreach ($keyAccessId in $keyAccessIds) {
                aws iam delete-access-key --user-name $userName --access-key-id $keyAccessId
            }
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover as chaves de acesso do usuário $userName." -ForegroundColor Red }

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Verificando se existe o arquivo de chave de acesso $keyAccessFile"
            if (Test-Path "$keyAccessPath\$keyAccessFile" -PathType Leaf) {
                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Removendo o arquivo de chave de acesso $keyAccessFile"
                Remove-Item "$keyAccessPath\$keyAccessFile"
            } else {Write-Host "Não existe o arquivo de chave de acesso $keyAccessFile"}
        } else {Write-Host "Não existem chaves de acesso para o usuário do IAM $userName"}
    }
    # Remove-IamUserKeyAccessesAll -userName $userName -keyAccessPath $iamUserKeyAccessConfig.keyAccessPath -keyAccessFile $iamUserKeyAccessConfig.keyAccessFile


    function Remove-IamLoginProfile {
        <# Verifica o perfil de login do usuário e o remove se existir #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o perfil de login do usuário do IAM $userName"
        aws iam get-login-profile --user-name $userName 2>$null | Out-Null
        if ($LastExitCode -eq 0) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo o perfil de login do usuário do IAM $userName"
            aws iam delete-login-profile --user-name $userName
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover o perfil de login do usuário $userName." -ForegroundColor Red }
        } else {Write-Host "Não existe perfil de login para o usuário do IAM $userName"}
    }
    # Remove-IamLoginProfile -userName $userName


    function Remove-IamUser {
        <# Remove definitivamente o usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo o usuário do IAM $userName"
        aws iam delete-user --user-name $userName
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover o usuário do IAM $userName." -ForegroundColor Red }
    }
    # Remove-IamUser -userName $userName




# IAM Group:
    function Test-IamGroupExists {
        <# Verifica se existe um grupo no IAM com o nome especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o grupo do IAM $groupName"
        $groupName = aws iam list-groups --query "Groups[?GroupName=='$groupName'].GroupName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência do grupo do IAM $groupName." -ForegroundColor Red }
        return $groupName
    }
    # $groupFound = Test-IamGroupExists -groupName $iamGroupConfig.groupName


    function Show-IamGroupName {
        <# Exibe o nome do grupo IAM especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe um grupo do IAM $groupName"
        $groupName = aws iam list-groups --query "Groups[?GroupName=='$groupName'].GroupName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir o grupo do IAM $groupName." -ForegroundColor Red }
        return $groupName
    }
    # Show-IamGroupName -groupName $iamGroupConfig.groupName


    function Show-IamGroupsAll {
        <# Lista o GroupName de todos os grupos IAM criados #>
        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todos os grupos do IAM criados"
        $groups = aws iam list-groups --query "Groups[].GroupName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar os grupos do IAM." -ForegroundColor Red }
        return $groups
    }
    # Show-IamGroupsAll


    function New-IamGroup {
        <# Cria um novo grupo no IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Criando o grupo do IAM $groupName"
        aws iam create-group --group-name $groupName --output json
        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o grupo do IAM $groupName." -ForegroundColor Red }
    }
    # New-IamGroup -groupName $iamGroupConfig.groupName


    function Get-IamGroupName {
        <# Extrai o nome de um grupo IAM específico #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o grupo do IAM $groupName"
        aws iam list-groups --query "Groups[?GroupName=='$groupName'].GroupName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o grupo do IAM $groupName." -ForegroundColor Red }
    }
    # Get-IamGroupName -groupName $iamGroupConfig.groupName


    function Remove-IamGroupUsersAll {
            <# Verifica os usuários do grupo e os remove #>
            param (
                [Parameter(Mandatory=$true)][string]$groupName
            )

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Verificando se existem usuários do IAM no grupo $groupName"
            $condition = aws iam get-group --group-name $groupName --query "Users[].UserName" --output text
            if (($condition).Count -gt 0) {
                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Separando os usuários do grupo $groupName em uma lista"
                $users = $condition -split "\s+"

                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Removendo os usuários do grupo $groupName"
                foreach ($user in $users) {
                    aws iam remove-user-from-group --group-name $groupName --user-name $user
                }
                if ($LastExitCode -ne 0) { Write-Host "Falha ao remover os usuários do grupo $groupName." -ForegroundColor Red }
            } else {Write-Host "Não existem usuários do IAM no grupo $groupName"}
        }
        # Remove-IamGroupUsersAll -groupName $iamGroupConfig.groupName


    function Disconnect-IamGroupPoliciesAll {
            <# Verifica as managed e inline policies do grupo e as remove #>
            param (
                [Parameter(Mandatory=$true)][string]$groupName
            )

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Verificando se existem managed policies no grupo $groupName"
            $condition = aws iam list-attached-group-policies --group-name $groupName --query "AttachedPolicies[].PolicyName" --output text
            
            if (($condition).Count -gt 0) {
                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Separando as managed policies do grupo $groupName em uma lista"
                $policies = $condition -split "\s+"

                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Removendo as managed policies do grupo $groupName"
                foreach ($policyName in $policies) {
                    $policyArn = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].[Arn]" --output text
                    aws iam detach-group-policy --group-name $groupName --policy-arn $policyArn      
                }
                if ($LastExitCode -ne 0) { Write-Host "Falha ao desanexar as managed policies do grupo $groupName." -ForegroundColor Red }
            } else {Write-Host "Não existem managed policies no grupo $groupName"}

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Verificando se existem inline policies no grupo $groupName"
            $conditionInline = aws iam list-group-policies --group-name $groupName --query "PolicyNames[]" --output text

            if (-not [string]::IsNullOrWhiteSpace($conditionInline)) {
                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Separando as inline policies do grupo $groupName em uma lista"
                $inlinePolicies = $conditionInline -split "\s+"

                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Removendo as inline policies do grupo $groupName"
                foreach ($policyName in $inlinePolicies) {
                    aws iam delete-group-policy --group-name $groupName --policy-name $policyName
                }
                if ($LastExitCode -ne 0) { Write-Host "Falha ao remover as inline policies do grupo $groupName." -ForegroundColor Red }
            } else {Write-Host "Não existem inline policies no grupo $groupName"}
        }
        # Disconnect-IamGroupPoliciesAll -groupName $iamGroupConfig.groupName


    function Remove-IamGroup {
        <# Remove definitivamente o grupo do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo o grupo $groupName"
        aws iam delete-group --group-name $groupName
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover o grupo do IAM $groupName." -ForegroundColor Red }
    }
    # Remove-IamGroup -groupName $iamGroupConfig.groupName




# IAM Role:
    function Test-IamRoleExists {
        <# Verifica se existe uma role no IAM com o nome especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe a role do IAM $roleName"
        $roleName = aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência da role do IAM $roleName." -ForegroundColor Red }
        return $roleName
    }
    # $roleFound = Test-IamRoleExists -roleName $iamRoleConfig.roleName


    function Show-IamRoleName {
        <# Exibe o nome da role IAM especificada #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe uma role do IAM $roleName"
        $roleName = aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir a role do IAM $roleName." -ForegroundColor Red }
        return $roleName
    }
    # Show-IamRoleName -roleName $iamRoleConfig.roleName


    function Show-IamRolesAll {
        <# Lista o RoleName de todas as roles IAM criadas #>
        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todas as roles do IAM criadas"
        $roles = aws iam list-roles --query "Roles[].RoleName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar as roles do IAM." -ForegroundColor Red }
        return $roles
    }
    # Show-IamRolesAll


    function New-IamRole {
        <# Cria uma nova role no IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName,
            [string]$trustPolicyFile, [string]$trustPolicyDocument,
            [string]$roleDescription, [string]$tagKey, [string]$tagValue
        )

        if ($trustPolicyFile) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Criando a role do IAM $roleName via arquivo $trustPolicyFile"
            aws iam create-role --role-name $roleName --assume-role-policy-document file://$trustPolicyFile --description $roleDescription --tags "Key=$tagKey,Value=$tagValue" --output json --no-cli-pager
            if ($LastExitCode -ne 0) { Write-Host "Falha ao criar a role do IAM $roleName." -ForegroundColor Red }
        } elseif ($trustPolicyDocument) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Criando a role do IAM $roleName via string"
            aws iam create-role --role-name $roleName --assume-role-policy-document $trustPolicyDocument --description $roleDescription --tags "Key=$tagKey,Value=$tagValue" --output json --no-cli-pager
            if ($LastExitCode -ne 0) { Write-Host "Falha ao criar a role do IAM $roleName." -ForegroundColor Red }
        } else {throw "É necessário informar 'trustPolicyFile' ou 'trustPolicyDocument'."}
    }
    # New-IamRole -roleName $iamRoleConfig.roleName -roleDescription $iamRoleConfig.roleDescription -trustPolicyFile $iamRoleConfig.trustPolicyFile -trustPolicyDocument $iamRoleConfig.trustPolicyDocument -tagKey $iamRoleConfig.tagKey -tagValue $iamRoleConfig.tagValue


    function Get-IamRoleName {
        <# Extrai o nome de uma role IAM específica #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando a role do IAM $roleName"
        aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter a role do IAM $roleName." -ForegroundColor Red }
    }
    # Get-IamRoleName -roleName $iamRoleConfig.roleName

    function Disconnect-IamRoleInstanceProfilesAll {
        <# Verifica se a role está vinculada a algum instance profile e a remove #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se a role $roleName está vinculada a algum instance profile"
        $condition = aws iam list-instance-profiles-for-role --role-name $roleName --query "InstanceProfiles[].InstanceProfileName" --output text

        if (-not [string]::IsNullOrWhiteSpace($condition)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando os instance profiles da role $roleName em uma lista"
            $instProfiles = $condition -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo a role $roleName dos instance profiles"
            foreach ($instProfName in $instProfiles) {
                aws iam remove-role-from-instance-profile --instance-profile-name $instProfName --role-name $roleName
            }
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a role $roleName dos instance profiles." -ForegroundColor Red }
        } else {Write-Host "A role $roleName não está vinculada a nenhum instance profile"}
    }
    # Disconnect-IamRoleInstanceProfilesAll -roleName $iamRoleConfig.roleName


    function Disconnect-IamRolePoliciesAll {
        <# Verifica as managed e inline policies da role e as remove #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem managed policies na role $roleName"
        $condition = aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[].PolicyName" --output text
        
        if (($condition).Count -gt 0) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando as managed policies da role $roleName em uma lista"
            $policies = $condition -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo as managed policies da role $roleName"
            foreach ($policyName in $policies) {
                $policyArn = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].[Arn]" --output text
                aws iam detach-role-policy --role-name $roleName --policy-arn $policyArn   
            }
            if ($LastExitCode -ne 0) { Write-Host "Falha ao desanexar as managed policies da role $roleName." -ForegroundColor Red }
        } else {Write-Host "Não existem managed policies na role $roleName"}

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem inline policies na role $roleName"
        $conditionInline = aws iam list-role-policies --role-name $roleName --query "PolicyNames[]" --output text

        if (-not [string]::IsNullOrWhiteSpace($conditionInline)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando as inline policies da role $roleName em uma lista"
            $inlinePolicies = $conditionInline -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo as inline policies da role $roleName"
            foreach ($policyName in $inlinePolicies) {
                aws iam delete-role-policy --role-name $roleName --policy-name $policyName
            }
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover as inline policies da role $roleName." -ForegroundColor Red }
        } else {Write-Host "Não existem inline policies na role $roleName"}
    }
    # Disconnect-IamRolePoliciesAll -roleName $iamRoleConfig.roleName


    function Remove-IamRole {
        <# Remove definitivamente a role do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo a role $roleName"
        aws iam delete-role --role-name $roleName
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a role $roleName." -ForegroundColor Red }
    }
    # Remove-IamRole -roleName $iamRoleConfig.roleName


    function Get-IamRoleArn {
        <# Extrai a ARN de uma role do IAM específica #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Extraindo a ARN da role $roleName"
        $roleArn = aws iam list-roles --query "Roles[?RoleName=='$roleName'].[Arn]" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter a ARN da role $roleName." -ForegroundColor Red }
        return $roleArn
    }
    # Get-IamRoleArn -roleName $iamRoleConfig.roleName




# IAM Instance Profile:
    function Test-InstanceProfileExists {
        <# Verifica se existe um instance profile com o nome especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o instance profile $instProfName"
        $instProfName = aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instProfName'].InstanceProfileName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência instance profile $instProfName." -ForegroundColor Red }
        return $instProfName
    }
    # $instProfFound = Test-InstanceProfileExists -instProfName $config.instProfName


    function Show-InstanceProfileName {
        <# Exibe o nome do instance profile especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe um instance profile $instProfName"
        $instProfName = aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instProfName'].InstanceProfileName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir o instance profile $instProfName." -ForegroundColor Red }
        return $instProfName
    }
    # Show-InstanceProfileName -instProfName $config.instProfName


    function Show-InstanceProfilesAll {
        <# Lista o InstanceProfileName de todos os instance profiles criados #>
        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todos os instance profiles criados"
        $instProfs = aws iam list-instance-profiles --query "InstanceProfiles[].InstanceProfileName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar os instance profiles." -ForegroundColor Red }
        return $instProfs
    }
    # Show-InstanceProfilesAll


    function New-InstanceProfile {
        <# Cria um novo instance profile no IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName,
            [string]$tagKey, [string]$tagValue
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Criando o instance profile $instProfName"
        aws iam create-instance-profile --instance-profile-name $instProfName --tags "Key=$tagKey,Value=$tagValue" --output json --no-cli-pager
        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o instance profile $instProfName." -ForegroundColor Red }
    }
    # New-InstanceProfile -instProfName $config.instProfName -tagKey $config.tagKey -tagValue $config.tagValue


    function Get-InstanceProfileName {
        <# Extrai o nome de um instance profile específico #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o instance profile $instProfName"
        aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instProfName'].InstanceProfileName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o nome do instance profile $instProfName." -ForegroundColor Red }
    }
    # Get-InstanceProfileName -instProfName $config.instProfName


    function Disconnect-InstanceProfileRole {
        <# Verifica a role do perfil de instância e a remove #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem roles no instance profile $instProfName"
        $condition = aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instProfName'].Roles[].RoleName" --output text

        if (-not [string]::IsNullOrWhiteSpace($condition)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando as roles do instance profile $instProfName em uma lista"
            $roles = $condition -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo as roles do instance profile $instProfName"
            foreach ($roleName in $roles) {
                aws iam remove-role-from-instance-profile --instance-profile-name $instProfName --role-name $roleName
            }
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover as roles do instance profile $instProfName." -ForegroundColor Red }
        } else {Write-Host "Não existem roles no instance profile $instProfName"}
    }
    # Disconnect-InstanceProfileRolesAll -instProfName $config.instProfName


    function Remove-InstanceProfile {
        <# Remove definitivamente o instance profile do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo o instance profile $instProfName"
        aws iam delete-instance-profile --instance-profile-name $instProfName
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover o instance profile $instProfName." -ForegroundColor Red }      
    }
    # Remove-InstanceProfile -instProfName $config.instProfName


    function Get-InstanceProfileArn {
        <# Extrai a ARN do instance profile #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Extraindo a ARN do instance profile"
        $instProfArn = aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instProfName'].Arn" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter a ARN do instance profile $instProfName." -ForegroundColor Red }
        return $instProfArn
    }
    # $instProfArn = Get-InstanceProfileArn -instProfName $config.instProfName



    
# IAM Policy:
    function Test-IamPolicyExists {
        <# Verifica se existe uma policy no IAM com o nome especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe a policy do IAM $policyName"
        $policyName = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência da policy do IAM $policyName." -ForegroundColor Red }
        return $policyName
    }
    # $policyFound = Test-IamPolicyExists -policyName $iamPolicyConfig.policyName


    function Show-IamPolicyName {
        <# Exibe o nome da policy IAM especificada #>
        param (
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe uma policy do IAM $policyName"
        $policyName = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir a policy do IAM $policyName." -ForegroundColor Red }
        return $policyName
    }
    # Show-IamPolicyName -policyName $iamPolicyConfig.policyName


    function Show-IamPoliciesAll {
        <# Lista o PolicyName de todas as policies IAM criadas pelo cliente #>
        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todas as policies do IAM criadas"
        $policies = aws iam list-policies --scope Local --query "Policies[].PolicyName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar as policies do IAM." -ForegroundColor Red }
        return $policies
    }
    # Show-IamPoliciesAll


    function New-IamPolicy {
        <# Cria uma nova policy no IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$policyName,
            [string]$policyDescription, [string]$policyFile, [string]$policyDocument, [string]$tagKey, [string]$tagValue
        )

        if ($policyFile) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Criando a policy do IAM $policyName via arquivo"
            aws iam create-policy --policy-name $policyName --description $policyDescription --policy-document file://$policyFile --tags "Key=$tagKey,Value=$tagValue" --output json --no-cli-pager
            if ($LastExitCode -ne 0) { Write-Host "Falha ao criar a policy do IAM $policyName." -ForegroundColor Red }
        } elseif ($policyDocument) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Criando a policy do IAM $policyName via string"
            aws iam create-policy --policy-name $policyName --description $policyDescription --policy-document $policyDocument --tags "Key=$tagKey,Value=$tagValue" --output json --no-cli-pager
            if ($LastExitCode -ne 0) { Write-Host "Falha ao criar a policy do IAM $policyName." -ForegroundColor Red }
        } else {throw "É necessário informar 'policyFile' ou 'policyDocument'."}
    }
    # New-IamPolicy -policyName $iamPolicyConfig.policyName -policyDescription $iamPolicyConfig.policyDescription -policyFile $iamPolicyConfig.policyFile -policyDocument $iamPolicyConfig.policyDocument -tagKey $iamPolicyConfig.tagKey -tagValue $iamPolicyConfig.tagValue


    function Get-IamPolicyName {
        <# Extrai o nome de uma policy IAM específica #>
        param (
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando a policy do IAM $policyName"
        aws iam list-policies --query "Policies[?PolicyName=='$policyName'].PolicyName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter a policy do IAM $policyName." -ForegroundColor Red }
    }
    # Get-IamPolicyName -policyName $iamPolicyConfig.policyName


    function Get-IamPolicyArn {
        <# Extrai o ARN de uma policy do IAM específica #>
        param (
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Extraindo o ARN da policy $policyName"
        $policyArn = aws iam list-policies --query "Policies[?PolicyName=='$policyName'].[Arn]" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o ARN da policy $policyName." -ForegroundColor Red }
        return $policyArn
    }
    # Get-IamPolicyArn -policyName $iamPolicyConfig.policyName
    
    
    function Disconnect-IamPolicyUsers {
        <# Verifica os usuários que possuem a managed policy anexada e a remove de cada um deles #>
        param (
            [Parameter(Mandatory=$true)][string]$policyName,
            [Parameter(Mandatory=$true)][string]$policyArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem usuários com a policy $policyName anexada"
        $condition = aws iam list-entities-for-policy --policy-arn $policyArn --entity-filter User --query "PolicyUsers[].UserName" --output text
        if (-not [string]::IsNullOrWhiteSpace($condition)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando os usuários com a policy $policyName em uma lista"
            $users = $condition -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo a policy $policyName dos usuários"
            foreach ($userName in $users) {
                aws iam detach-user-policy --user-name $userName --policy-arn $policyArn
                if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a policy $policyName do usuário $userName." -ForegroundColor Red }
            }
        } else {Write-Host "Não existem usuários com a policy $policyName anexada"}
    }
    # Disconnect-IamPolicyUsers -policyName $iamPolicyConfig.policyName -policyArn $policyArn


    function Disconnect-IamPolicyGroups {
        <# Verifica os grupos que possuem a managed policy anexada e a remove de cada um deles #>
        param (
            [Parameter(Mandatory=$true)][string]$policyName,
            [Parameter(Mandatory=$true)][string]$policyArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem grupos com a policy $policyName anexada"
        $condition = aws iam list-entities-for-policy --policy-arn $policyArn --entity-filter Group --query "PolicyGroups[].GroupName" --output text
        if (-not [string]::IsNullOrWhiteSpace($condition)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando os grupos com a policy $policyName em uma lista"
            $groups = $condition -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo a policy $policyName dos grupos"
            foreach ($groupName in $groups) {
                aws iam detach-group-policy --group-name $groupName --policy-arn $policyArn
                if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a policy $policyName do grupo $groupName." -ForegroundColor Red }
            }
        } else {Write-Host "Não existem grupos com a policy $policyName anexada"}
    }
    # Disconnect-IamPolicyGroups -policyName $iamPolicyConfig.policyName -policyArn $policyArn


    function Disconnect-IamPolicyRoles {
        <# Verifica as roles que possuem a managed policy anexada e a remove de cada uma delas #>
        param (
            [Parameter(Mandatory=$true)][string]$policyName,
            [Parameter(Mandatory=$true)][string]$policyArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem roles com a policy $policyName anexada"
        $condition = aws iam list-entities-for-policy --policy-arn $policyArn --entity-filter Role --query "PolicyRoles[].RoleName" --output text
        if (-not [string]::IsNullOrWhiteSpace($condition)) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Separando as roles com a policy $policyName em uma lista"
            $roles = $condition -split "\s+"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo a policy $policyName das roles"
            foreach ($roleName in $roles) {
                aws iam detach-role-policy --role-name $roleName --policy-arn $policyArn
                if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a policy $policyName da role $roleName." -ForegroundColor Red }
            }
        } else {Write-Host "Não existem roles com a policy $policyName anexada"}
    }
    # Disconnect-IamPolicyRoles -policyName $iamPolicyConfig.policyName -policyArn $policyArn


    function Remove-IamPolicy {
        <# Remove definitivamente a policy do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$policyName,
            [Parameter(Mandatory=$true)][string]$policyArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo a policy $policyName"
        aws iam delete-policy --policy-arn $policyArn
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a policy $policyName." -ForegroundColor Red }
    }
    # Remove-IamPolicy -policyName $iamPolicyConfig.policyName -policyArn $policyArn




# IAM MFA Device:
    function Test-IamMfaDeviceExists {
        <# Verifica se existe um dispositivo MFA com o nome especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$deviceName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe um dispositivo MFA com o nome $deviceName"
        $condition = aws iam list-virtual-mfa-devices --query "VirtualMFADevices[?contains(SerialNumber, '$deviceName')]" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência do dispositivo MFA $deviceName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamMfaDeviceExists -deviceName $iamMfaDeviceConfig.deviceName


    function Show-IamMfaDeviceName {
        <# Exibe o nome do dispositivo MFA especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$deviceName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe um dispositivo MFA com o nome $deviceName"
        $mfaDevice = aws iam list-virtual-mfa-devices --query "VirtualMFADevices[?contains(SerialNumber, '$deviceName')]" --output text
        $name = $mfaDevice -replace '^.*mfa/', ''
        Write-Host $name
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir o dispositivo MFA $deviceName." -ForegroundColor Red }
    }
    # Show-IamMfaDeviceName -deviceName $iamMfaDeviceConfig.deviceName


    function Show-IamMfaDevicesAll {
        <# Lista o DeviceName de todos os dispositivos MFA criados #>

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todos os dispositivos MFA criados"
        $mfaDevices = aws iam list-virtual-mfa-devices --query "VirtualMFADevices[].SerialNumber" | ConvertFrom-Json
        foreach ($serial in $mfaDevices) {
            $name = $serial -replace '^.*mfa/', ''
            Write-Host $name
        }
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar os dispositivos MFA criados." -ForegroundColor Red }
    }
    # Show-IamMfaDevicesAll


    function New-IamMfaDevice {
        <# Cria um dispositivo MFA virtual e salva o QRCode em arquivo #>
        param (
            [Parameter(Mandatory=$true)][string]$deviceName,
            [Parameter(Mandatory=$true)][string]$mfaPath,
            [Parameter(Mandatory=$true)][string]$mfaFile,
            [string]$tagKey, [string]$tagValue
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Criando um dispositivo MFA virtual $deviceName"
        aws iam create-virtual-mfa-device --virtual-mfa-device-name $deviceName --outfile "$mfaPath\$mfaFile" --bootstrap-method QRCodePNG --tags "Key=$tagKey,Value=$tagValue" --no-cli-pager
        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o dispositivo MFA $deviceName." -ForegroundColor Red }
    }
    # New-IamMfaDevice -deviceName $iamMfaDeviceConfig.deviceName -mfaPath $iamMfaDeviceConfig.mfaPath -mfaFile $iamMfaDeviceConfig.mfaFile -tagKey $iamMfaDeviceConfig.tagKey -tagValue $iamMfaDeviceConfig.tagValue

 
    function Get-IamMfaDeviceName {
        <# Extrai o nome de um dispositivo MFA específico #>
        param (
            [Parameter(Mandatory=$true)][string]$deviceName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o nome do dispositivo MFA $deviceName"
        $mfaDevice = aws iam list-virtual-mfa-devices --query "VirtualMFADevices[?contains(SerialNumber, '$deviceName')].SerialNumber" --output text
        $name = $mfaDevice -replace '^.*mfa/', ''
        Write-Host $name
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o nome do dispositivo MFA $deviceName." -ForegroundColor Red }
    }
    # Get-IamMfaDeviceName -deviceName $iamMfaDeviceConfig.deviceName


    function Get-IamMfaDeviceArn {
        <# Extrai o ARN de um dispositivo MFA específico #>
        param (
            [Parameter(Mandatory=$true)][string]$deviceName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Extraindo o ARN do dispositivo MFA $deviceName"
        $deviceArn = aws iam list-virtual-mfa-devices --query "VirtualMFADevices[?contains(SerialNumber, '$deviceName')].SerialNumber[]" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o ARN do dispositivo MFA $deviceName." -ForegroundColor Red }
        return $deviceArn
    }
    # $deviceArn = Get-IamMfaDeviceArn -deviceName $iamMfaDeviceConfig.deviceName


    function Disconnect-IamMfaUser {
        <# Verifica o dispositivo MFA do usuário e o remove #>
        param (
            [Parameter(Mandatory=$true)][string]$deviceName,
            [Parameter(Mandatory=$true)][string]$deviceArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe algum usuário associado ao dispositivo MFA $deviceName"
        $device = aws iam list-virtual-mfa-devices --query "VirtualMFADevices[?SerialNumber=='$deviceArn']" | ConvertFrom-Json
        if ($device.Count -gt 0 -and $device[0].User) {
            $associatedUser = $device[0].User.UserName

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Desanexando o dispositivo MFA $deviceName associado ao usuário do IAM $associatedUser"
            aws iam deactivate-mfa-device --user-name $associatedUser --serial-number $deviceArn
            if ($LastExitCode -ne 0) {Write-Host "Falha ao desanexar o dispositivo MFA $deviceName do usuário $associatedUser." -ForegroundColor Red}
        } else {Write-Host "O dispositivo MFA não está associado a nenhum usuário."}
    }
    # Disconnect-IamMfaUser -deviceName $iamMfaDeviceConfig.deviceName -deviceArn $deviceArn


    function Remove-IamMfaDevice {
        <# Remove definitivamente o dispositivo de MFA e apaga o arquivo local de QRCode #>
        param (
            [Parameter(Mandatory=$true)][string]$deviceName,
            [Parameter(Mandatory=$true)][string]$deviceArn,
            [Parameter(Mandatory=$true)][string]$mfaPath,
            [Parameter(Mandatory=$true)][string]$mfaFile
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo o dispositivo MFA $deviceName"
        aws iam delete-virtual-mfa-device --serial-number $deviceArn
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover o dispositivo MFA $deviceSerial." -ForegroundColor Red }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o arquivo de QRCode do MFA $mfaFile"
        if (Test-Path "$mfaPath\$mfaFile" -PathType Leaf) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo o arquivo de QRCode do MFA $mfaFile"
            Remove-Item "$mfaPath\$mfaFile"
        } else {Write-Host "Não existe o arquivo de QRCode do MFA $mfaFile"}
    }
    # Remove-IamMfaDevice -deviceName $iamMfaDeviceConfig.deviceName -deviceArn $deviceArn -mfaPath $iamMfaDeviceConfig.mfaPath -mfaFile $iamMfaDeviceConfig.mfaFile




# IAM User MFA:
    function Test-IamUserAndMfaDeviceExists {
        <# Verifica se o usuário e o dispositivo MFA existem simultaneamente na AWS #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$deviceName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o usuário do IAM $userName e o dispositivo MFA $deviceName"
        $condition = (aws iam list-users --query "Users[?UserName=='$userName'].UserName" --output text).Count -gt 0 -and (aws iam list-virtual-mfa-devices --query "VirtualMFADevices[?contains(SerialNumber, '$deviceName')]" --output text).Count -gt 0
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência do usuário do IAM $userName e do dispositivo MFA $deviceName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamUserAndMfaDeviceExists -userName $iamMfaDeviceConfig.userName -deviceName $iamMfaDeviceConfig.deviceName


    function Test-IamUserMfaAttached {
        <# Verifica se o usuário específico possui o dispositivo MFA associado #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$deviceName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o MFA $deviceName associado ao usuário do IAM $userName"
        $condition = aws iam list-mfa-devices --user-name $userName --query "MFADevices[?contains(SerialNumber, '$deviceName')].UserName[]" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar o dispositivo MFA $deviceName do usuário $userName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamUserMfaAttached -userName $iamMfaDeviceConfig.userName -deviceName $iamMfaDeviceConfig.deviceName


    function Show-IamUserMfa {
        <# Exibe o dispositivo MFA específico associado ao usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$deviceName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe o dispositivo MFA $deviceName associado ao usuário do IAM $userName"
        $mfaDevice = aws iam list-mfa-devices --user-name $userName --query "MFADevices[?contains(SerialNumber, '$deviceName')].SerialNumber[]" --output text
        $mfaDevice = $mfaDevice -replace '^.*mfa/', ''
        Write-Host $mfaDevice
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir o dispositivo MFA $deviceName do usuário $userName." -ForegroundColor Red }
    }
    # Show-IamUserMfa -userName $iamMfaDeviceConfig.userName -deviceName $iamMfaDeviceConfig.deviceName


    function Show-IamUserMfaDevicesAll {
        <# Lista todos os dispositivos MFA associados ao usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todos os dispositivos MFA associados ao usuário do IAM $userName"
        $mfaDevice = aws iam list-mfa-devices --user-name $userName --query "MFADevices[].SerialNumber" --output text
        $mfaDevice = $mfaDevice -replace '^.*mfa/', ''
        Write-Host $mfaDevice
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar os dispositivos MFA do usuário $userName." -ForegroundColor Red }
    }
    # Show-IamUserMfaDevicesAll -userName $iamMfaDeviceConfig.userName


    function Enable-IamUserMfaDevice {
        <# Ativa o dispositivo MFA para o usuário do IAM, solicitando os dois códigos interativamente #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$deviceName
        )

        $resposta = Read-Host "O MFA já foi configurado no dispositivo? (y/n) "
        if ($resposta.ToLower() -eq 'y') {
            $code1 = Read-Host "Digite o primeiro código de autenticação fornecido pelo dispositivo"
            $code2 = Read-Host "Digite o segundo código de autenticação fornecido pelo dispositivo"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Obtendo o ID da conta do perfil CLI em uso"
            $accountId = aws sts get-caller-identity --query "Account" --output text
            $deviceArn = "arn:aws:iam::${accountId}:mfa/${deviceName}"

            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Ativando o MFA para o usuário do IAM $userName"
            aws iam enable-mfa-device --user-name $userName --serial-number $deviceArn --authentication-code1 $code1 --authentication-code2 $code2
            if ($LastExitCode -ne 0) { Write-Host "Falha ao ativar o dispositivo MFA $deviceName para o usuário $userName." -ForegroundColor Red }
        } else {Write-Host "O MFA precisa ser configurado em um dispositivo antes de ser ativado"}
    }
    # Enable-IamUserMfaDevice -userName $iamMfaDeviceConfig.userName -deviceName $iamMfaDeviceConfig.deviceName

    
    function Get-IamUserMfa {
        <# Lista o dispositivo MFA específico associado ao usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$deviceName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o dispositivo MFA $deviceName associado ao usuário do IAM $userName"
        $mfaDevice = aws iam list-mfa-devices --user-name $userName --query "MFADevices[?contains(SerialNumber, '$deviceName')].SerialNumber[]" --output text
        $mfaDevice = $mfaDevice -replace '^.*mfa/', ''
        Write-Host $mfaDevice
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter a data de ativação do MFA do usuário $userName." -ForegroundColor Red }
    }




# IAM User Key Accesss:
    function Test-IamUserKeyAccessExists {
        <# Verifica se existe chave de acesso para o usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe chave de acesso para o usuário do IAM $userName"
        $condition = aws iam list-access-keys --user-name $userName --query "AccessKeyMetadata[].AccessKeyId" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a chave de acesso do usuário $userName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamUserKeyAccessExists -userName $iamUserKeyAccessConfig.userName


    function Show-IamUserKeyAccessId {
        <# Exibe a(s) chave(s) de acesso existente(s) do usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe uma chave de acesso criada para o usuário do IAM $userName"
        aws iam list-access-keys --user-name $userName --query "AccessKeyMetadata[].AccessKeyId" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir a chave de acesso do usuário $userName." -ForegroundColor Red }
    }
    # Show-IamUserKeyAccessId -userName $iamUserKeyAccessConfig.userName


    function Show-IamUserKeyAccessesAll {
        <# Lista todas as chaves de acesso do usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todas as chaves de acesso do usuário do IAM $userName"
        aws iam list-access-keys --user-name $userName --query "AccessKeyMetadata[].AccessKeyId" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar as chaves de acesso do usuário $userName." -ForegroundColor Red }
    }
    # Show-IamUserKeyAccessesAll -userName $iamUserKeyAccessConfig.userName


    function New-IamUserKeyAccess {
        <# Cria uma chave de acesso para o usuário do IAM e salva em arquivo JSON #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$keyAccessPath,
            [Parameter(Mandatory=$true)][string]$keyAccessFile
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Criando uma chave de acesso para o usuário do IAM $userName"
        aws iam create-access-key --user-name $userName > "$keyAccessPath\$keyAccessFile"
        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar a chave de acesso para o usuário $userName." -ForegroundColor Red }
    }
    # New-IamUserKeyAccess -userName $iamUserKeyAccessConfig.userName -keyAccessPath $iamUserKeyAccessConfig.keyAccessPath -keyAccessFile $iamUserKeyAccessConfig.keyAccessFile


    function Get-IamUserKeyAccessId {
        <# Extrai o ID da primeira chave de acesso existente do usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Extraindo o ID da primeira chave de acesso do usuário do IAM $userName"
        $keyAccessId = aws iam list-access-keys --user-name $userName --query "AccessKeyMetadata[0].AccessKeyId" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o ID da chave de acesso do usuário $userName." -ForegroundColor Red }
        return $keyAccessId
    }
    # $keyAccessId = Get-IamUserKeyAccessId -userName $iamUserKeyAccessConfig.userName


    function Remove-IamUserKeyAccess {
        <# Remove a chave de acesso da AWS e o arquivo local correspondente #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$keyAccessId,
            [Parameter(Mandatory=$true)][string]$keyAccessPath,
            [Parameter(Mandatory=$true)][string]$keyAccessFile
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo a chave de acesso do usuário do IAM $userName"
        aws iam delete-access-key --user-name $userName --access-key-id $keyAccessId
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a chave de acesso do usuário $userName." -ForegroundColor Red }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o arquivo de chave de acesso $keyAccessFile"
        if (Test-Path "$keyAccessPath\$keyAccessFile" -PathType Leaf) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo o arquivo de chave de acesso $keyAccessFile"
            Remove-Item "$keyAccessPath\$keyAccessFile"
        } else {Write-Host "Não existe o arquivo de chave de acesso $keyAccessFile"}
    }
    # Remove-IamUserKeyAccess -userName $iamUserKeyAccessConfig.userName -keyAccessId $keyAccessId -keyAccessPath $iamUserKeyAccessConfig.keyAccessPath -keyAccessFile $iamUserKeyAccessConfig.keyAccessFile




# IAM User Group:
    function Test-IamGroupAndUserExists {
        <# Verifica se o grupo e o usuário existem simultaneamente na AWS #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o grupo $groupName e o usuário $userName"
        $condition = (aws iam list-groups --query "Groups[?GroupName=='$groupName'].GroupName" --output text).Count -gt 0 -and (aws iam list-users --query "Users[?UserName=='$userName'].UserName" --output text).Count -gt 0
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência do grupo $groupName e do usuário $userName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamGroupAndUserExists -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName


    function Test-IamGroupUserAttached {
        <# Verifica se um usuário específico está inserido no grupo do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se o usuário $userName está no grupo $groupName"
        $condition = aws iam get-group --group-name $groupName --query "Users[?UserName=='$userName'].UserName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar o usuário $userName no grupo $groupName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamGroupUserAttached -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName


    function Show-IamGroupUser {
        <# Exibe um usuário específico inserido no grupo do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe o usuário $userName no grupo $groupName"
        aws iam get-group --group-name $groupName --query "Users[?UserName=='$userName'].UserName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir o usuário $userName no grupo $groupName." -ForegroundColor Red }
    }
    # Show-IamGroupUser -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName


    function Show-IamGroupUsersAll {
        <# Lista todos os usuários inseridos no grupo do IAM especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todos os usuários do grupo $groupName"
        aws iam get-group --group-name $groupName --query "Users[].UserName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar os usuários do grupo $groupName." -ForegroundColor Red }
    }
    # Show-IamGroupUsersAll -groupName $iamGroupConfig.groupName


    function Add-IamGroupUser {
        <# Adiciona um usuário específico ao grupo do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Adicionando o usuário $userName ao grupo $groupName"
        aws iam add-user-to-group --group-name $groupName --user-name $userName
        if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar o usuário $userName ao grupo $groupName." -ForegroundColor Red }
    }
    # Add-IamGroupUser -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName


    function Get-IamGroupUser {
        <# Lista um usuário específico inserido no grupo do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o usuário $userName do grupo $groupName"
        aws iam get-group --group-name $groupName --query "Users[?UserName=='$userName'].UserName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o usuário $userName do grupo $groupName." -ForegroundColor Red }
    }
    # Get-IamGroupUser -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName


    function Remove-IamGroupUser {
        <# Remove um usuário específico do grupo do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo o usuário $userName do grupo $groupName"
        aws iam remove-user-from-group --group-name $groupName --user-name $userName
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover o usuário $userName do grupo $groupName." -ForegroundColor Red }
    }
    # Remove-IamGroupUser -groupName $iamGroupConfig.groupName -userName $iamUserConfig.userName




# IAM Instance Profile Role:
    function Test-IamInstProfAndRoleExists {
        <# Verifica se o instance profile e a role existem simultaneamente na AWS #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName,
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o instance profile $instProfName e a role $roleName"
        $condition = (aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instProfName'].InstanceProfileName" --output text).Count -gt 0 -and (aws iam list-roles --query "Roles[?RoleName=='$roleName'].RoleName" --output text).Count -gt 0
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência do instance profile $instProfName e da role $roleName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamInstProfAndRoleExists -instProfName $instanceProfileConfig.instProfName -roleName $iamRoleConfig.roleName


    function Test-IamInstProfRoleAttached {
        <# Verifica se uma role específica está anexada ao instance profile do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName,
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe a role $roleName no instance profile $instProfName"
        $condition = aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instProfName'] | [].Roles[?RoleName=='$roleName'].RoleName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a role $roleName no instance profile $instProfName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamInstProfRoleAttached -instProfName $instanceProfileConfig.instProfName -roleName $iamRoleConfig.roleName


    function Show-IamInstProfRole {
        <# Exibe uma role específica anexada ao instance profile do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName,
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe a role $roleName no instance profile $instProfName"
        aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instProfName'] | [].Roles[?RoleName=='$roleName'].RoleName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir a role $roleName no instance profile $instProfName." -ForegroundColor Red }
    }
    # Show-IamInstProfRole -instProfName $instanceProfileConfig.instProfName -roleName $iamRoleConfig.roleName


    function Show-IamInstProfRolesAll {
        <# Lista todas as roles anexadas ao instance profile do IAM especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todas as roles do instance profile $instProfName"
        aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instProfName'].Roles[].RoleName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar as roles do instance profile $instProfName." -ForegroundColor Red }
    }
    # Show-IamInstProfRolesAll -instProfName $instanceProfileConfig.instProfName


    function Add-RoleToInstanceProfile {
        <# Adiciona (anexa) uma role específica ao instance profile do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName,
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Adicionando a role $roleName ao instance profile $instProfName"
        aws iam add-role-to-instance-profile --instance-profile-name $instProfName --role-name $roleName
        if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar a role $roleName ao instance profile $instProfName." -ForegroundColor Red }
    }
    # Add-RoleToInstanceProfile -instProfName $instanceProfileConfig.instProfName -roleName $iamRoleConfig.roleName


    function Get-IamInstProfRole {
        <# Lista uma role específica anexada ao instance profile do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName,
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando a role $roleName do instance profile $instProfName"
        aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instProfName'] | [].Roles[?RoleName=='$roleName'].RoleName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter a role $roleName do instance profile $instProfName." -ForegroundColor Red }
    }
    # Get-IamInstProfRole -instProfName $instanceProfileConfig.instProfName -roleName $iamRoleConfig.roleName


    function Remove-IamInstanceProfileRole {
        <# Remove uma role de um perfil de instância (Instance Profile) do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$instProfName,
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo a role $roleName do perfil de instância $instProfName"
        aws iam remove-role-from-instance-profile --instance-profile-name $instProfName --role-name $roleName
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a role $roleName do perfil de instância $instProfName." -ForegroundColor Red }
    }
    # Remove-IamInstanceProfileRole -instProfName $instanceProfileConfig.instProfName -roleName $iamRoleConfig.roleName




# IAM User Policy:
    function Test-IamUserPolicyAttached {
        <# Verifica se existe uma policy (managed ou inline) específica anexada ao usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe a policy $policyName no usuário $userName (managed ou inline)"
        $condition = (aws iam list-attached-user-policies --user-name $userName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text).Count -gt 0 -or (aws iam list-user-policies --user-name $userName --query "PolicyNames[?@=='$policyName']" --output text).Count -gt 0
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a policy $policyName no usuário $userName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamUserPolicyAttached -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName


    function Show-IamUserPolicy {
        <# Exibe a policy (managed ou inline) específica do usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe a policy $policyName no usuário $userName"
        aws iam list-attached-user-policies --user-name $userName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
        aws iam list-user-policies --user-name $userName --query "PolicyNames[?@=='$policyName']" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir a policy $policyName no usuário $userName." -ForegroundColor Red }
    }
    # Show-IamUserPolicy -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName


    function Show-IamUserPoliciesAll {
        <# Lista todas as policies (managed e inline) do usuário do IAM especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$userName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todas as policies do usuário $userName"
        aws iam list-attached-user-policies --user-name $userName --query "AttachedPolicies[].PolicyName" --output text
        aws iam list-user-policies --user-name $userName --query "PolicyNames[]" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar as policies do usuário $userName." -ForegroundColor Red }
    }
    # Show-IamUserPoliciesAll -userName $iamUserConfig.userName


    function Add-IamUserPolicy {
        <# Adiciona uma policy ao usuário: managed (via ARN) se existir, senão cria inline via arquivo ou string #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$policyName,
            [string]$policyFile,
            [string]$policyDocument
        )

        $managedCondition = Test-IamPolicyExists -policyName $policyName
        if (($managedCondition).Count -gt 0) {
            $policyArn = Get-IamPolicyArn -policyName $policyName
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Adicionando a managed policy $policyName ao usuário $userName"
            aws iam attach-user-policy --user-name $userName --policy-arn $policyArn
            if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar a managed policy $policyName ao usuário $userName." -ForegroundColor Red }
        } elseif ($policyFile) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Managed policy $policyName não encontrada. Adicionando como inline policy ao usuário $userName, via arquivo"
            aws iam put-user-policy --user-name $userName --policy-name $policyName --policy-document file://$policyFile
            if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar a inline policy $policyName ao usuário $userName." -ForegroundColor Red }
        } elseif ($policyDocument) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Managed policy $policyName não encontrada. Adicionando como inline policy ao usuário $userName, via string"
            aws iam put-user-policy --user-name $userName --policy-name $policyName --policy-document $policyDocument
            if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar a inline policy $policyName ao usuário $userName." -ForegroundColor Red }
        } else {Write-Host "Managed policy $policyName não encontrada. Informe 'policyFile' ou 'policyDocument' para criar uma inline policy." -ForegroundColor Red}
    }
    # Add-IamUserPolicy -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName -policyFile $iamPolicyConfig.policyFile -policyDocument $iamPolicyConfig.policyDocument


    function Get-IamUserPolicy {
        <# Lista a policy (managed ou inline) específica do usuário do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando a policy $policyName do usuário $userName"
        aws iam list-attached-user-policies --user-name $userName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
        aws iam list-user-policies --user-name $userName --query "PolicyNames[?@=='$policyName']" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter a policy $policyName do usuário $userName." -ForegroundColor Red }
    }
    # Get-IamUserPolicy -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName


    function Remove-IamUserPolicy {
        <# Remove a policy do usuário: detach se for managed, delete se for inline #>
        param (
            [Parameter(Mandatory=$true)][string]$userName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        $managedCondition = aws iam list-attached-user-policies --user-name $userName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
        if (($managedCondition).Count -gt 0) {
            $policyArn = Get-IamPolicyArn -policyName $policyName
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo a managed policy $policyName do usuário $userName"
            aws iam detach-user-policy --user-name $userName --policy-arn $policyArn
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a managed policy $policyName do usuário $userName." -ForegroundColor Red }
        } else {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo a inline policy $policyName do usuário $userName"
            aws iam delete-user-policy --user-name $userName --policy-name $policyName
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a inline policy $policyName do usuário $userName." -ForegroundColor Red }
        }
    }
    # Remove-IamUserPolicy -userName $iamUserConfig.userName -policyName $iamPolicyConfig.policyName




# IAM Group Policy:
    function Test-IamGroupPolicyAttached {
        <# Verifica se existe uma policy (managed ou inline) específica anexada ao grupo do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe a policy $policyName no grupo $groupName (managed ou inline)"
        $condition = (aws iam list-attached-group-policies --group-name $groupName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text).Count -gt 0 -or (aws iam list-group-policies --group-name $groupName --query "PolicyNames[?@=='$policyName']" --output text).Count -gt 0
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a policy $policyName no grupo $groupName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamGroupPolicyAttached -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName


    function Show-IamGroupPolicy {
        <# Exibe a policy (managed ou inline) específica do grupo do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe a policy $policyName no grupo $groupName"
        aws iam list-attached-group-policies --group-name $groupName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
        aws iam list-group-policies --group-name $groupName --query "PolicyNames[?@=='$policyName']" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir a policy $policyName no grupo $groupName." -ForegroundColor Red }
    }
    # Show-IamGroupPolicy -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName


    function Show-IamGroupPoliciesAll {
        <# Lista todas as policies (managed e inline) do grupo do IAM especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todas as policies do grupo $groupName"
        aws iam list-attached-group-policies --group-name $groupName --query "AttachedPolicies[].PolicyName" --output text
        aws iam list-group-policies --group-name $groupName --query "PolicyNames[]" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar as policies do grupo $groupName." -ForegroundColor Red }
    }
    # Show-IamGroupPoliciesAll -groupName $iamGroupConfig.groupName


    function Add-IamGroupPolicy {
        <# Adiciona uma policy ao grupo: managed (via ARN) se existir, senão cria inline via arquivo ou string #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$policyName,
            [string]$policyFile,
            [string]$policyDocument
        )

        $managedCondition = Test-IamPolicyExists -policyName $policyName
        if (($managedCondition).Count -gt 0) {
            $policyArn = Get-IamPolicyArn -policyName $policyName
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Adicionando a managed policy $policyName ao grupo $groupName"
            aws iam attach-group-policy --group-name $groupName --policy-arn $policyArn
            if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar a managed policy $policyName ao grupo $groupName." -ForegroundColor Red }
        } elseif ($policyFile) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Managed policy $policyName não encontrada. Adicionando como inline policy ao grupo $groupName, via arquivo"
            aws iam put-group-policy --group-name $groupName --policy-name $policyName --policy-document file://$policyFile
            if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar a inline policy $policyName ao grupo $groupName." -ForegroundColor Red }
        } elseif ($policyDocument) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Managed policy $policyName não encontrada. Adicionando como inline policy ao grupo $groupName, via string"
            aws iam put-group-policy --group-name $groupName --policy-name $policyName --policy-document $policyDocument
            if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar a inline policy $policyName ao grupo $groupName." -ForegroundColor Red }
        } else {Write-Host "Managed policy $policyName não encontrada. Informe 'policyFile' ou 'policyDocument' para criar uma inline policy." -ForegroundColor Red}
    }
    # Add-IamGroupPolicy -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName -policyFile $iamPolicyConfig.policyFile -policyDocument $iamPolicyConfig.policyDocument


    function Get-IamGroupPolicy {
        <# Lista a policy (managed ou inline) específica do grupo do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando a policy $policyName do grupo $groupName"
        aws iam list-attached-group-policies --group-name $groupName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
        aws iam list-group-policies --group-name $groupName --query "PolicyNames[?@=='$policyName']" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter a policy $policyName do grupo $groupName." -ForegroundColor Red }
    }
    # Get-IamGroupPolicy -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName


    function Remove-IamGroupPolicy {
        <# Remove a policy do grupo: detach se for managed, delete se for inline #>
        param (
            [Parameter(Mandatory=$true)][string]$groupName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        $managedCondition = aws iam list-attached-group-policies --group-name $groupName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
        if (($managedCondition).Count -gt 0) {
            $policyArn = Get-IamPolicyArn -policyName $policyName
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo a managed policy $policyName do grupo $groupName"
            aws iam detach-group-policy --group-name $groupName --policy-arn $policyArn
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a managed policy $policyName do grupo $groupName." -ForegroundColor Red }
        } else {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo a inline policy $policyName do grupo $groupName"
            aws iam delete-group-policy --group-name $groupName --policy-name $policyName
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a inline policy $policyName do grupo $groupName." -ForegroundColor Red }
        }
    }
    # Remove-IamGroupPolicy -groupName $iamGroupConfig.groupName -policyName $iamPolicyConfig.policyName




# IAM Role Policy:
    function Test-IamRolePolicyAttached {
        <# Verifica se existe uma policy (managed ou inline) específica anexada à role do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe a policy $policyName na role $roleName (managed ou inline)"
        $condition = (aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text).Count -gt 0 -or (aws iam list-role-policies --role-name $roleName --query "PolicyNames[?@=='$policyName']" --output text).Count -gt 0
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a policy $policyName na role $roleName." -ForegroundColor Red }
        return $condition
    }
    # $condition = Test-IamRolePolicyAttached -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName


    function Show-IamRolePolicy {
        <# Exibe a policy (managed ou inline) específica da role do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe a policy $policyName na role $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
        aws iam list-role-policies --role-name $roleName --query "PolicyNames[?@=='$policyName']" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir a policy $policyName na role $roleName." -ForegroundColor Red }
    }
    # Show-IamRolePolicy -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName


    function Show-IamRolePoliciesAll {
        <# Lista todas as policies (managed e inline) da role do IAM especificada #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todas as policies da role $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[].PolicyName" --output text
        aws iam list-role-policies --role-name $roleName --query "PolicyNames[]" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar as policies da role $roleName." -ForegroundColor Red }
    }
    # Show-IamRolePoliciesAll -roleName $iamRoleConfig.roleName


    function Add-IamRolePolicy {
        <# Adiciona uma policy à role: managed (via ARN) se existir, senão cria inline via arquivo ou string #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName,
            [Parameter(Mandatory=$true)][string]$policyName,
            [string]$policyFile,
            [string]$policyDocument
        )

        $managedCondition = Test-IamPolicyExists -policyName $policyName
        if (($managedCondition).Count -gt 0) {
            $policyArn = Get-IamPolicyArn -policyName $policyName
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Adicionando a managed policy $policyName à role $roleName"
            aws iam attach-role-policy --role-name $roleName --policy-arn $policyArn
            if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar a managed policy $policyName à role $roleName." -ForegroundColor Red }
        } elseif ($policyFile) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Managed policy $policyName não encontrada. Adicionando como inline policy à role $roleName, via arquivo"
            aws iam put-role-policy --role-name $roleName --policy-name $policyName --policy-document file://$policyFile
            if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar a inline policy $policyName à role $roleName." -ForegroundColor Red }
        } elseif ($policyDocument) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Managed policy $policyName não encontrada. Adicionando como inline policy à role $roleName, via string"
            aws iam put-role-policy --role-name $roleName --policy-name $policyName --policy-document $policyDocument
            if ($LastExitCode -ne 0) { Write-Host "Falha ao adicionar a inline policy $policyName à role $roleName." -ForegroundColor Red }
        } else {Write-Host "Managed policy $policyName não encontrada. Informe 'policyFile' ou 'policyDocument' para criar uma inline policy." -ForegroundColor Red}
    }
    # Add-IamRolePolicy -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName -policyFile $iamPolicyConfig.policyFile -policyDocument $iamPolicyConfig.policyDocument


    function Get-IamRolePolicy {
        <# Lista a policy (managed ou inline) específica da role do IAM #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando a policy $policyName da role $roleName"
        aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
        aws iam list-role-policies --role-name $roleName --query "PolicyNames[?@=='$policyName']" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter a policy $policyName da role $roleName." -ForegroundColor Red }
    }
    # Get-IamRolePolicy -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName


    function Remove-IamRolePolicy {
        <# Remove a policy da role: detach se for managed, delete se for inline #>
        param (
            [Parameter(Mandatory=$true)][string]$roleName,
            [Parameter(Mandatory=$true)][string]$policyName
        )

        $managedCondition = aws iam list-attached-role-policies --role-name $roleName --query "AttachedPolicies[?PolicyName=='$policyName'].PolicyName" --output text
        if (($managedCondition).Count -gt 0) {
            $policyArn = Get-IamPolicyArn -policyName $policyName
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo a managed policy $policyName da role $roleName"
            aws iam detach-role-policy --role-name $roleName --policy-arn $policyArn
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a managed policy $policyName da role $roleName." -ForegroundColor Red }
        } else {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo a inline policy $policyName da role $roleName"
            aws iam delete-role-policy --role-name $roleName --policy-name $policyName
            if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a inline policy $policyName da role $roleName." -ForegroundColor Red }
        }
    }
    # Remove-IamRolePolicy -roleName $iamRoleConfig.roleName -policyName $iamPolicyConfig.policyName


    












