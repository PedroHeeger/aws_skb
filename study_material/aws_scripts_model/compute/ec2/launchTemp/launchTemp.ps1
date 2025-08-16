#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "LAUNCH TEMPLATE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
# $launchTempType = "Type1"          # launchTemp type 1 (User Data, Instance Profile e SG)
$launchTempType = "Type2"            # launchTemp type 2 (User Data, VPC, AZ, SG, Tag Name Instance)
$launchTempName = "launchTempTest1"
$versionNumber = ""
# $versionNumber = 1
$versionDescription = "My version "
$amiId = "ami-0c7217cdde317cfec"    # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
$instanceType = "t2.micro"
$keyPair = "keyPairUniversal"
$userDataPath = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/httpd"
$userDataFile = "udFileDeb.sh"
$deviceName = "/dev/xvda"
$volumeSize = 8
$volumeType = "gp2"

$instanceProfileName = "ecsInstanceRole"
# $instanceProfileName = "instanceProfileTest"
# $vpcName = "vpcTest1"
$vpcName = "default"
$az1 = "us-east-1a"
$sgName = "default"
$tagNameInstance = "ec2Test"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    function LaunchTemplateType1 {
        param ([string]$launchTempName, [string]$versionDescription, [int]$versionNumber, [string]$amiId, [string]$instanceType, [string]$keyPair, [string]$udFileBase64, [string]$deviceName, [int]$volumeSize, [string]$volumeType, [string]$instanceProfileName, [string]$sgName, [string]$commandVersion)
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o ID do security group"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo a ARN do instance profile"
        $instanceProfileArn = aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instanceProfileName'].Arn" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o launch template (modelo de implantação tipo 1) $launchTempName na versão $versionNumber"
        aws ec2 $commandVersion --launch-template-name $launchTempName --version-description $versionDescription --launch-template-data "{
            `"ImageId`": `"$amiId`",
            `"InstanceType`": `"$instanceType`",
            `"KeyName`": `"$keyPair`",
            `"UserData`": `"$udFileBase64`",
            `"SecurityGroupIds`": [`"$sgId`"],
            `"IamInstanceProfile`": {
                `"Arn`": `"$instanceProfileArn`"
            },
            `"BlockDeviceMappings`": [
                {
                    `"DeviceName`": `"$deviceName`",
                    `"Ebs`": {
                        `"VolumeSize`": $volumeSize,
                        `"VolumeType`": `"$volumeType`"
                    }
                }
            ]
        }" --no-cli-pager
    }
    

    function LaunchTemplateType2 {
        param ([string]$launchTempName, [string]$versionDescription, [int]$versionNumber, [string]$amiId, [string]$instanceType, [string]$keyPair, [string]$udFileBase64, [string]$deviceName, [int]$volumeSize, [string]$volumeType, [string]$vpcName, [string]$az1, [string]$sgName, [string]$tagNameInstance, [string]$commandVersion)

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se a VPC é a padrão ou não"
        if ($vpcName -eq "default") {$key = "isDefault"; $vpcNameControl = "true"
        } else {$key = "tag:Name"; $vpcNameControl = $vpcName}
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo os IDs dos elementos de rede"
        $vpcId = aws ec2 describe-vpcs --filters "Name=$key,Values=$vpcNameControl" --query "Vpcs[].VpcId" --output text
        $subnetId1 = aws ec2 describe-subnets --filters "Name=availability-zone,Values=$az1" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o launch template (modelo de implantação tipo 2) $launchTempName na versão $versionNumber"
        aws ec2 $commandVersion --launch-template-name $launchTempName --version-description $versionDescription --launch-template-data "{
            `"ImageId`": `"$amiId`",
            `"InstanceType`": `"$instanceType`",
            `"KeyName`": `"$keyPair`",
            `"UserData`": `"$udFileBase64`",
            `"TagSpecifications`": [
              {`"ResourceType`": `"instance`",
                `"Tags`": [
                  {
                    `"Key`": `"Name`",
                    `"Value`": `"$tagNameInstance`"
                  }
                ]
              }
            ],
            `"BlockDeviceMappings`": [
              {
                `"DeviceName`": `"$deviceName`",
                `"Ebs`": {
                  `"VolumeSize`": $volumeSize,
                  `"VolumeType`": `"$volumeType`"
                }
              }
            ],
            `"NetworkInterfaces`": [
              {
                `"AssociatePublicIpAddress`": true,
                `"DeviceIndex`": 0,
                `"SubnetId`": `"$subnetId1`",
                `"Groups`": [`"$sgId`"]
              }
            ]
          }" --no-cli-pager
    }


    function CreateLaunchTemplate {
        param ([string]$launchTempType, [string]$launchTempName, [string]$versionDescription, [int]$versionNumber, [string]$amiId, [string]$instanceType, [string]$keyPair, [string]$userDataPath, [string]$userDataFile, [string]$deviceName, [int]$volumeSize, [string]$volumeType, [string]$instanceProfileName, [string]$vpcName, [string]$az, [string]$sgName, [string]$tagNameInstance, [string]$commandVersion)
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os modelos de implantação existentes e sua versão padrão"
        aws ec2 describe-launch-templates --query 'LaunchTemplates[].[LaunchTemplateName,DefaultVersionNumber]' --output text

        if ($commandVersion -eq "create-launch-template-version") {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as versões do modelo de implantação $launchTempName"
            aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[].[LaunchTemplateName,VersionNumber]" --output text
        }

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Definindo a descrição da versão"
        $versionDescription = "$versionDescription$versionNumber"
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Codificando o arquivo user data em Base64"
        $udFileBase64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes((Get-Content -Raw -Path "$userDataPath/$userDataFile")))

        if ($launchTempType -eq "Type1") {    
            LaunchTemplateType1 -launchTempName $launchTempName -versionDescription $versionDescription -versionNumber $versionNumber -amiId $amiId -instanceType $instanceType -keyPair $keyPair -udFileBase64 $udFileBase64 -deviceName $deviceName -volumeSize $volumeSize -volumeType $volumeType -instanceProfileName $instanceProfileName -sgName $sgName -commandVersion $commandVersion
        } elseif ($launchTempType -eq "Type2") {
            LaunchTemplateType2 -launchTempName $launchTempName -versionDescription $versionDescription -versionNumber $versionNumber -amiId $amiId -instanceType $instanceType -keyPair $keyPair -udFileBase64 $udFileBase64 -deviceName $deviceName -volumeSize $volumeSize -volumeType $volumeType -vpcName $vpcName -az $az1 -sgName $sgName -tagNameInstance $tagNameInstance -commandVersion $commandVersion
        }
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o modelo de implantação $launchTempName na versão $versionNumber"       
        aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[?to_string(VersionNumber)=='$versionNumber'].[LaunchTemplateName,VersionNumber]" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Definindo a versão $versionNumber como a padrão do modelo de implantação $launchTempName"       
        aws ec2 modify-launch-template --launch-template-name $launchTempName --default-version $versionNumber
    }



    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o modelo de implantação $launchTempName"
    $condition = aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o modelo de implantação $launchTempName"
        aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        $resposta = Read-Host "Quer implementar uma nova versão? (y/n) "
        if ($resposta.ToLower() -eq 'y') {
            if ($versionNumber -eq "") {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Extraindo a última versão do modelo de implantação $launchTempName"
                $latestVersion = aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LatestVersionNumber" --output text
                $versionNumber = [int]$latestVersion + 1
            } else {Write-Output "Utilizando a versão definida nas variáveis. Certifique dessa ser a próxima versão na contagem da AWS."}
            
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Iniciando a construção do modelo de implantação $launchTempName"
            CreateLaunchTemplate -launchTempType $launchTempType -launchTempName $launchTempName -versionDescription $versionDescription -versionNumber $versionNumber -amiId $amiId -instanceType $instanceType -keyPair $keyPair -userDataPath $userDataPath -userDataFile $userDataFile -deviceName $deviceName -volumeSize $volumeSize -volumeType $volumeType -instanceProfileName $instanceProfileName -vpcName $vpcName -az $az1 -sgName $sgName -tagNameInstance $tagNameInstance -commandVersion "create-launch-template-version"
        } else {Write-Output "Nenhuma versão do modelo de implantação $launchTempName foi implantada"}
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Definindo a versão como primeira do modelo de implantação $launchTempName"
        $versionNumber = 1

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Iniciando a construção do modelo de implantação $launchTempName"
        CreateLaunchTemplate -launchTempType $launchTempType -launchTempName $launchTempName -versionDescription $versionDescription -versionNumber $versionNumber -amiId $amiId -instanceType $instanceType -keyPair $keyPair -userDataPath $userDataPath -userDataFile $userDataFile -deviceName $deviceName -volumeSize $volumeSize -volumeType $volumeType -instanceProfileName $instanceProfileName -vpcName $vpcName -az $az1 -sgName $sgName -tagNameInstance $tagNameInstance -commandVersion "create-launch-template"
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "LAUNCH TEMPLATE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$launchTempName = "launchTempTest1"
$versionNumber = 2

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o modelo de implantação $launchTempName"
    $condition = aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text    
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os modelos de implantação existentes e sua versão padrão"
        aws ec2 describe-launch-templates --query 'LaunchTemplates[].[LaunchTemplateName,DefaultVersionNumber]' --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o modelo de implantação $launchTempName na versão $versionNumber"
        $condition = aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[?to_string(VersionNumber)=='$versionNumber'].[LaunchTemplateName]" --output text
        if (($condition).Count -gt 0) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Listando todas as versões do modelo de implantação $launchTempName"
            aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[].[LaunchTemplateName,VersionNumber]" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Extraindo a versão padrão do modelo de implantação $launchTempName"
            $defaultVersion = aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].DefaultVersionNumber" --output text

            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se a versão escolhida é a versão padrão do modelo de implantação $launchTempName"
            if ($versionNumber -eq $defaultVersion) {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Removendo o modelo de implantação $launchTempName por completo"
                aws ec2 delete-launch-template --launch-template-name $launchTempName

                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Listando todos os modelos de implantação existentes e sua versão padrão"
                aws ec2 describe-launch-templates --query 'LaunchTemplates[].[LaunchTemplateName,DefaultVersionNumber]' --output text
            } else {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Removendo o modelo de implantação $launchTempName na versão $versionNumber"
                aws ec2 delete-launch-template-versions --launch-template-name $launchTempName --versions $versionNumber

                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Listando todas as versões do modelo de implantação $launchTempName"
                aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[].[LaunchTemplateName,VersionNumber]" --output text
            }
        } else {Write-Output "Não existe o modelo de implantação $launchTempName na versão $versionNumber"}
    } else {Write-Output "Não existe o modelo de implantação $launchTempName"}
} else {Write-Host "Código não executado"}