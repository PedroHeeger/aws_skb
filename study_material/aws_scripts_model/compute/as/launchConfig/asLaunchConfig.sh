#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-AUTO SCALING"
echo "LAUNCH CONFIGURATION CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
launchConfigName="launchConfigTest1"
amiId="ami-0c7217cdde317cfec"
instanceType="t2.micro"
keyPair="keyPairUniversal"
userDataPath="G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/httpd"
userDataFile="udFileDeb.sh"
sgName="default"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe a configuração de inicialização de nome $launchConfigName"
    condition=$(aws autoscaling describe-launch-configurations --query "LaunchConfigurations[?LaunchConfigurationName=='$launchConfigName'].LaunchConfigurationName" --output text | wc -l)
    if [[ "$condition" -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe a configuração de inicialização de nome $launchConfigName"
        aws autoscaling describe-launch-configurations --query "LaunchConfigurations[?LaunchConfigurationName=='$launchConfigName'].LaunchConfigurationName" --output text
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todas as configurações de inicialiação"
        aws autoscaling describe-launch-configurations --query "LaunchConfigurations[].LaunchConfigurationName" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo o Id do grupo de segurança padrão"
        sgId=$(aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text)
    
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando um launch configuration (configuração de inicialização) de nome $launchConfigName"
        aws autoscaling create-launch-configuration --launch-configuration-name $launchConfigName --image-id $amiId --instance-type $instanceType --key-name $keyPair --user-data "file://$userDataPath/$userDataFile" --security-groups $sgId

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando a configuração de inicialização de nome $launchConfigName"
        aws autoscaling describe-launch-configurations --query "LaunchConfigurations[?LaunchConfigurationName=='$launchConfigName'].LaunchConfigurationName" --output text
    fi
else
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-AUTO SCALING"
echo "LAUNCH CONFIGURATION EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
launchConfigName="launchConfigTest1"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$(echo "$resposta" | tr '[:upper:]' '[:lower:]')" == "y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe a configuração de inicialização de nome $launchConfigName"
    condition=$(aws autoscaling describe-launch-configurations --query "LaunchConfigurations[?LaunchConfigurationName=='$launchConfigName'].LaunchConfigurationName" --output text | wc -l)
    if [[ "$condition" -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todas as configurações de inicialiação"
        aws autoscaling describe-launch-configurations --query "LaunchConfigurations[].LaunchConfigurationName" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo a launch configuration (configuração de inicialização) de nome $launchConfigName"
        aws autoscaling delete-launch-configuration --launch-configuration-name $launchConfigName

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todas as configurações de inicialiação"
        aws autoscaling describe-launch-configurations --query "LaunchConfigurations[].LaunchConfigurationName" --output text
    else
        echo "Não existe a configuração de inicialização de nome $launchConfigName"
    fi
else
    echo "Código não executado"
fi