#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2"
echo "DOUBLE INSTANCE CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
tagNameInstance="ec2Test"
instanceA="1"
instanceB="2"
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
device_name="/dev/sda1"
volumeSize=8
volumeType="gp2"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe as instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
    condition=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[?(Tags[?Key=='Name' && (Value=='${tagNameInstance}${instanceA}' || Value=='${tagNameInstance}${instanceB}')])].[Tags[?Key=='Name'].Value | [0]]" --output text)
    if [ $(echo "$condition" | wc -w) -gt 0 ]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe as instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceA}'].Value" --output text
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceB}'].Value" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o IP público das instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        instanceIpA=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text)
        instanceIpB=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text)
        echo "$instanceIpA"
        echo "$instanceIpB"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo o Id das instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        instanceIdA=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstanceA" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)
        instanceIdB=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstanceB" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância ${tagNameInstance}${instanceA}"
        echo "ssh -i \"$keyPairPath/$keyPairName.pem\" $so@$instanceIpA"
        echo "aws ssm start-session --target $instanceIdA"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância ${tagNameInstance}${instanceB}"
        echo "ssh -i \"$keyPairPath/$keyPairName.pem\" $so@$instanceIpB"
        echo "aws ssm start-session --target $instanceIdB"
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo os Ids do grupo de segurança e das sub-redes padrões"
        sgId=$(aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text)
        subnetId=$(aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$az'].SubnetId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando a instância ${tagNameInstance}${instanceA}"
        instanceIdA=$(aws ec2 run-instances --image-id $imageId --instance-type $instanceType --key-name $keyPairName --security-group-ids $sgId --subnet-id $subnetId --count 1 --user-data "file://$userDataPath/$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${tagNameInstance}${instanceA}}]" --block-device-mappings "[{\"DeviceName\":\"$deviceName\",\"Ebs\":{\"VolumeSize\":$volumeSize,\"VolumeType\":\"$volumeType\"}}]" --no-cli-pager --query "Instances[0].InstanceId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando a instância ${tagNameInstance}${instanceB}"
        instanceIdB=$(aws ec2 run-instances --image-id $imageId --instance-type $instanceType --key-name $keyPairName --security-group-ids $sgId --subnet-id $subnetId --count 1 --user-data "file://$userDataPath/$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${tagNameInstance}${instanceB}}]" --block-device-mappings "[{\"DeviceName\":\"$deviceName\",\"Ebs\":{\"VolumeSize\":$volumeSize,\"VolumeType\":\"$volumeType\"}}]" --no-cli-pager --query "Instances[0].InstanceId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Aguardando as instâncias criadas entrarem em execução"
        instanceStateA=""
        instanceStateB=""
        while [[ $instanceStateA != "running" || $instanceStateB != "running" ]]; do
            sleep 20  
            instanceStateA=$(aws ec2 describe-instances --instance-ids $instanceIdA --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager)
            echo "Estado atual da instância ${tagNameInstance}${instanceA}: $instanceStateA"
            instanceStateB=$(aws ec2 describe-instances --instance-ids $instanceIdB --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager)
            echo "Estado atual da instância ${tagNameInstance}${instanceB}: $instanceStateB"
        done

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o IP público das instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        instanceIpA=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text)
        instanceIpB=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text)
        echo "$instanceIpA"
        echo "$instanceIpB"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo o Id das instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        instanceIdA=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstanceA" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)
        instanceIdB=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstanceB" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância ${tagNameInstance}${instanceA}"
        echo "ssh -i \"$keyPairPath/$keyPairName.pem\" $so@$instanceIpA"
        echo "aws ssm start-session --target $instanceIdA"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância ${tagNameInstance}${instanceB}"
        echo "ssh -i \"$keyPairPath/$keyPairName.pem\" $so@$instanceIpB"
        echo "aws ssm start-session --target $instanceIdB"
    fi
else
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2"
echo "DOUBLE INSTANCE EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
tagNameInstance="ec2Test"
instanceA="1"
instanceB="2"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe as instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
    condition=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[?(Tags[?Key=='Name' && (Value=='${tagNameInstance}${instanceA}' || Value=='${tagNameInstance}${instanceB}')])].[Tags[?Key=='Name'].Value | [0]]" --output text)

    if [ $(echo "$condition" | wc -l) -gt 0 ]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo o Id das instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        instanceIdA=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)
        instanceIdB=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo as instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 terminate-instances --instance-ids $instanceIdA $instanceIdB --no-dry-run --no-cli-pager

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Aguardando a instância ser removida"
        instanceStateA=""
        instanceStateB=""
        while [[ "$instanceStateA" != "terminated" || "$instanceStateB" != "terminated" ]]; do
            sleep 20  
            instanceStateA=$(aws ec2 describe-instances --instance-ids "$instanceIdA" --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager)
            echo "Estado atual da instância ${tagNameInstance}${instanceA}: $instanceStateA"
            instanceStateB=$(aws ec2 describe-instances --instance-ids "$instanceIdB" --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager)
            echo "Estado atual da instância ${tagNameInstance}${instanceB}: $instanceStateB"
        done

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
    else
        echo "Não existe instâncias ativas ${tagNameInstance}${instanceA} ou ${tagNameInstance}${instanceB}"
    fi
else
    echo "Código não executado"
fi