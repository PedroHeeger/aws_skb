#!/usr/bin/env bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2"
echo "INSTANCE CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
tagNameInstance="ec2Test1"
sgName="default"
az="us-east-1a"
imageId="ami-0c7217cdde317cfec"    # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
so="ubuntu"
# so="ec2-user"
instanceType="t2.micro"
keyPairPath="G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/.default/secrets/awsKeyPair/universal"
keyPairName="keyPairUniversal"
userDataPath="G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/0linuxTools_git"
userDataFile="udFileDeb.sh"
# deviceName="/dev/xvda" 
deviceName="/dev/sda1" 
volumeSize=8
volumeType="gp2"
# instanceProfileName="instanceProfileTest"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [[ $resposta == [yY] ]]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe uma instância ativa $tagNameInstance"
    condition=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text | wc -l)
    if [[ "$condition" -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe uma instância ativa $tagNameInstance"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='$tagNameInstance'].Value" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o IP público da instância ativa $tagNameInstance"
        instanceIp=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text)
        echo "$instanceIp"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo o Id da instância ativa $tagNameInstance"
        instanceId=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Exibindo o comando para acesso remoto via SSH ou AWS SSM"
        echo "ssh -i \"$keyPairPath/$keyPairName.pem\" $so@$instanceIp"
        echo "aws ssm start-session --target $instanceId"
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo o Id dos elementos de rede"
        sgId=$(aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text)
        subnetId=$(aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$az'].SubnetId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando a instância $tagNameInstance"
        instanceId=$(aws ec2 run-instances --image-id $imageId --instance-type $instanceType --key-name $keyPairName --security-group-ids $sgId --subnet-id $subnetId --count 1 --user-data "file://$userDataPath/$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tagNameInstance}]" --block-device-mappings "[{\"DeviceName\":\"$deviceName\",\"Ebs\":{\"VolumeSize\":$volumeSize,\"VolumeType\":\"$volumeType\"}}" ] --no-cli-pager --query "Instances[0].InstanceId" --output text)

        # echo "-----//-----//-----//-----//-----//-----//-----"
        # echo "Criando a instância $tagNameInstance"
        # instanceId=$(aws ec2 run-instances --image-id $imageId --instance-type $instanceType --key-name $keyPairName --security-group-ids $sgId --subnet-id $subnetId --count 1 --user-data "file://$userDataPath/$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tagNameInstance}]" --block-device-mappings "[{\"DeviceName\":\"$deviceName\",\"Ebs\":{\"VolumeSize\":$volumeSize,\"VolumeType\":\"$volumeType\"}}" ] --iam-instance-profile Name=$instanceProfileName --no-cli-pager --query "Instances[0].InstanceId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Aguardando a instância criada entrar em execução"
        instanceState=""
        while [[ $instanceState != "running" ]]; do
            sleep 20  
            instanceState=$(aws ec2 describe-instances --instance-ids $instanceId --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager)
            echo "Estado atual da instância: $instanceState"
        done

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o IP público da instância ativa $tagNameInstance"
        instanceIp=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text)
        echo "$instanceIp"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Exibindo o comando para acesso remoto via SSH ou AWS SSM"
        echo "ssh -i \"$keyPairPath/$keyPairName.pem\" $so@$instanceIp"
        echo "aws ssm start-session --target $instanceId"
    fi
else 
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2"
echo "INSTANCE EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
tagNameInstance="ec2Test1"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [[ "$resposta" == "y" || "$resposta" == "Y" ]]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe uma instância ativa $tagNameInstance"
    condition=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text | wc -l)
    if [[ "$condition" -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
        
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo o Id da instância $tagNameInstance"
        instanceId=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo a instância $tagNameInstance"
        aws ec2 terminate-instances --instance-ids "$instanceId" --no-dry-run --no-cli-pager

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Aguardando a instância ser removida"
        instanceState=""
        while [[ "$instanceState" != "terminated" ]]; do
            sleep 20  
            instanceState=$(aws ec2 describe-instances --instance-ids "$instanceId" --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager)
            echo "Estado atual da instância: $instanceState"
        done
        
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
    else
        echo "Não existe uma instância ativa $tagNameInstance"
    fi
else
    echo "Código não executado"
fi