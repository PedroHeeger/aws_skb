#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2"
echo "LAUNCH TEMPLATE CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
# launchTempType="Type1"          # launchTemp type 1 (User Data, Instance Profile e SG)
launchTempType="Type2"            # launchTemp type 2 (User Data, VPC, AZ, SG, Tag Name Instance)
launchTempName="launchTempTest1"
versionNumber=""
# versionNumber=6
versionDescription="My version "
amiId="ami-0c7217cdde317cfec"    # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
instanceType="t2.micro"
keyPair="keyPairUniversal"
userDataPath="G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/httpd"
userDataFile="udFileDeb.sh"
deviceName="/dev/xvda"
volumeSize=8
volumeType="gp2"

instanceProfileName="instanceProfileTest"
# vpcName="vpcTest1"
vpcName="default"
az1="us-east-1a"
sgName="default"
tagNameInstance="ec2Test"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [[ "${resposta,,}" == "y" ]]; then
    LaunchTemplateType1() {
        local launchTempName=$1 versionDescription=$2 versionNumber=$3 amiId=$4 instanceType=$5 keyPair=$6 udFileBase64=$7 deviceName=$8 volumeSize=$9 volumeType=${10} instanceProfileName=${11} sgName=${12} commandVersion=${13}

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo o ID do security group"
        sgId=$(aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo a ARN do instance profile"
        instanceProfileArn=$(aws iam list-instance-profiles --query "InstanceProfiles[?InstanceProfileName=='$instanceProfileName'].Arn" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o launch template (modelo de implantação tipo 1) $launchTempName na versão $versionNumber"
        aws ec2 $commandVersion --launch-template-name "$launchTempName" --version-description "$versionDescription" --launch-template-data "{
            \"ImageId\": \"$amiId\",
            \"InstanceType\": \"$instanceType\",
            \"KeyName\": \"$keyPair\",
            \"UserData\": \"$udFileBase64\",
            \"SecurityGroupIds\": [\"$sgId\"],
            \"IamInstanceProfile\": {
                \"Arn\": \"$instanceProfileArn\"
            },
            \"BlockDeviceMappings\": [
                {
                    \"DeviceName\": \"$deviceName\",
                    \"Ebs\": {
                        \"VolumeSize\": $volumeSize,
                        \"VolumeType\": \"$volumeType\"
                    }
                }
            ]
        }" --no-cli-pager
    }


    LaunchTemplateType2() {
        local launchTempName=$1 versionDescription=$2 versionNumber=$3 amiId=$4 instanceType=$5 keyPair=$6 udFileBase64=$7 deviceName=$8 volumeSize=$9 volumeType=${10} vpcName=${11} az1=${12} sgName=${13} tagNameInstance=${14} commandVersion=${15}

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Verificando se a VPC é a padrão ou não"
        if [[ "$vpcName" == "default" ]]; then
            key="isDefault"
            vpcNameControl="true"
        else
            key="tag:Name"
            vpcNameControl="$vpcName"
        fi

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo os IDs dos elementos de rede"
        vpcId=$(aws ec2 describe-vpcs --filters "Name=$key,Values=$vpcNameControl" --query "Vpcs[].VpcId" --output text)
        subnetId1=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=$az1" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text)
        sgId=$(aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o launch template (modelo de implantação tipo 2) $launchTempName na versão $versionNumber"
        aws ec2 $commandVersion --launch-template-name "$launchTempName" --version-description "$versionDescription" --launch-template-data "{
            \"ImageId\": \"$amiId\",
            \"InstanceType\": \"$instanceType\",
            \"KeyName\": \"$keyPair\",
            \"UserData\": \"$udFileBase64\",
            \"TagSpecifications\": [
              {\"ResourceType\": \"instance\",
                \"Tags\": [
                  {
                    \"Key\": \"Name\",
                    \"Value\": \"$tagNameInstance\"
                  }
                ]
              }
            ],
            \"BlockDeviceMappings\": [
              {
                \"DeviceName\": \"$deviceName\",
                \"Ebs\": {
                  \"VolumeSize\": $volumeSize,
                  \"VolumeType\": \"$volumeType\"
                }
              }
            ],
            \"NetworkInterfaces\": [
              {
                \"AssociatePublicIpAddress\": true,
                \"DeviceIndex\": 0,
                \"SubnetId\": \"$subnetId1\",
                \"Groups\": [\"$sgId\"]
              }
            ]
        }" --no-cli-pager
    }


    CreateLaunchTemplate() {
        local launchTempType=$1 launchTempName=$2 versionDescription=$3 versionNumber=$4 amiId=$5 instanceType=$6 keyPair=$7 userDataPath=$8 userDataFile=$9 deviceName=${10} volumeSize=${11} volumeType=${12} instanceProfileName=${13} vpcName=${14} az=${15} sgName=${16} tagNameInstance=${17} commandVersion=${18}

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os modelos de implantação existentes e sua versão padrão"
        aws ec2 describe-launch-templates --query 'LaunchTemplates[].[LaunchTemplateName,DefaultVersionNumber]' --output text

        if [[ "$commandVersion" == "create-launch-template-version" ]]; then
            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Listando todas as versões do modelo de implantação $launchTempName"
            aws ec2 describe-launch-template-versions --launch-template-name "$launchTempName" --query "LaunchTemplateVersions[].[LaunchTemplateName,VersionNumber]" --output text
        fi

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Definindo a descrição da versão"
        versionDescription="$versionDescription$versionNumber"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Codificando o arquivo user data em Base64"
        udFileBase64=$(base64 -w 0 "$userDataPath/$userDataFile")

        if [[ "$launchTempType" == "Type1" ]]; then
            LaunchTemplateType1 "$launchTempName" "$versionDescription" "$versionNumber" "$amiId" "$instanceType" "$keyPair" "$udFileBase64" "$deviceName" "$volumeSize" "$volumeType" "$instanceProfileName" "$sgName" "$commandVersion"
        elif [[ "$launchTempType" == "Type2" ]]; then
            LaunchTemplateType2 "$launchTempName" "$versionDescription" "$versionNumber" "$amiId" "$instanceType" "$keyPair" "$udFileBase64" "$deviceName" "$volumeSize" "$volumeType" "$vpcName" "$az1" "$sgName" "$tagNameInstance" "$commandVersion"
        fi

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o modelo de implantação $launchTempName na versão $versionNumber"
        aws ec2 describe-launch-template-versions --launch-template-name "$launchTempName" --query "LaunchTemplateVersions[?to_string(VersionNumber)=='$versionNumber'].[LaunchTemplateName,VersionNumber]" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Definindo a versão $versionNumber como a padrão do modelo de implantação $launchTempName"
        aws ec2 modify-launch-template --launch-template-name "$launchTempName" --default-version "$versionNumber"
    }




    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o modelo de implantação $launchTempName"
    condition=$(aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text)
    if [[ -n "$condition" ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe o modelo de implantação $launchTempName"
        aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        read -p "Quer implementar uma nova versão? (y/n) " resposta
        if [[ "${resposta,,}" == "y" ]]; then
            if [ -z "$versionNumber" ]; then
                echo "-----//-----//-----//-----//-----//-----//-----"
                echo "Extraindo a última versão do modelo de implantação $launchTempName"
                latestVersion=$(aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LatestVersionNumber" --output text)
                versionNumber=$((latestVersion + 1))
            else
                echo "Utilizando a versão definida nas variáveis. Certifique-se de que essa seja a próxima versão na contagem da AWS."
            fi

            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Iniciando a construção do modelo de implantação $launchTempName"
            CreateLaunchTemplate "$launchTempType" "$launchTempName" "$versionDescription" "$versionNumber" "$amiId" "$instanceType" "$keyPair" "$userDataPath" "$userDataFile" "$deviceName" "$volumeSize" "$volumeType" "$instanceProfileName" "$vpcName" "$aZ1" "$sgName" "$tagNameInstance" "create-launch-template-version"
        else
            echo "Nenhuma versão do modelo de implantação $launchTempName foi implantada"
        fi
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Definindo a versão como primeira do modelo de implantação $launchTempName"
        versionNumber=1

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Iniciando a construção do modelo de implantação $launchTempName"
        CreateLaunchTemplate "$launchTempType" "$launchTempName" "$versionDescription" "$versionNumber" "$amiId" "$instanceType" "$keyPair" "$userDataPath" "$userDataFile" "$deviceName" "$volumeSize" "$volumeType" "$instanceProfileName" "$vpcName" "$aZ1" "$sgName" "$tagNameInstance" "create-launch-template"
    fi
else
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2"
echo "LAUNCH TEMPLATE EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
launchTempName="launchTempTest1"
versionNumber=1

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "${resposta,,}" == 'y' ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o modelo de implantação $launchTempName"
    condition=$(aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text | wc -l)
    if [[ "$condition" -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os modelos de implantação existentes e sua versão padrão"
        aws ec2 describe-launch-templates --query 'LaunchTemplates[].[LaunchTemplateName,DefaultVersionNumber]' --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Verificando se existe o modelo de implantação $launchTempName na versão $versionNumber"
        $condition = $(aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[?to_string(VersionNumber)=='$versionNumber'].[LaunchTemplateName,VersionNumber]" --output text | wc -l)
        if [[ "$condition" -gt 0 ]]; then
            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Listando todas as versões do modelo de implantação $launchTempName"
            aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[].[LaunchTemplateName,VersionNumber]" --output text

            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Extraindo a versão padrão do modelo de implantação $launchTempName"
            defaultVersion=$(aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].DefaultVersionNumber" --output text)

            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Verificando se a versão escolhida é a versão padrão do modelo de implantação $launchTempName"
            if [ "$versionNumber" -eq "$defaultVersion" ]; then
                echo "-----//-----//-----//-----//-----//-----//-----"
                echo "Removendo o modelo de implantação $launchTempName por completo"
                aws ec2 delete-launch-template --launch-template-name $launchTempName

                echo "-----//-----//-----//-----//-----//-----//-----"
                echo "Listando todos os modelos de implantação existentes e sua versão padrão"
                aws ec2 describe-launch-templates --query 'LaunchTemplates[].[LaunchTemplateName,DefaultVersionNumber]' --output text
            else
                echo "-----//-----//-----//-----//-----//-----//-----"
                echo "Removendo o modelo de implantação $launchTempName na versão $versionNumber"
                aws ec2 delete-launch-template-versions --launch-template-name $launchTempName --versions $versionNumber

                echo "-----//-----//-----//-----//-----//-----//-----"
                echo "Listando todas as versões do modelo de implantação $launchTempName"
                aws ec2 describe-launch-template-versions --launch-template-name $launchTempName --query "LaunchTemplateVersions[].[LaunchTemplateName,VersionNumber]" --output text
        else
            echo "Não existe o modelo de implantação $launchTempName na versão $versionNumber"
        fi
    else
        echo "Não existe o modelo de implantação $launchTempName"
    fi
else
    echo "Código não executado"
fi