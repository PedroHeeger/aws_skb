#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2-AUTO SCALING"
Write-Output "LAUNCH CONFIGURATION CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$launchConfigName = "launchConfigTest1"
$amiId = "ami-0c7217cdde317cfec"    # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
$instanceType = "t2.micro"
$keyPair = "keyPairUniversal"
$userDataPath = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/httpd"
$userDataFile = "udFileDeb.sh"
$sgName = "default"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a configuração de inicialização de nome $launchConfigName"
    $condition = aws autoscaling describe-launch-configurations --query "LaunchConfigurations[?LaunchConfigurationName=='$launchConfigName'].LaunchConfigurationName" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe a configuração de inicialização de nome $launchConfigName"
        aws autoscaling describe-launch-configurations --query "LaunchConfigurations[?LaunchConfigurationName=='$launchConfigName'].LaunchConfigurationName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as configurações de inicialiação"
        aws autoscaling describe-launch-configurations --query "LaunchConfigurations[].LaunchConfigurationName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id do grupo de segurança padrão"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando um launch configuration (configuração de inicialização) de nome $launchConfigName"
        aws autoscaling create-launch-configuration --launch-configuration-name $launchConfigName --image-id $amiId --instance-type $instanceType --key-name $keyPair --user-data "file://$userDataPath\$userDataFile" --security-groups $sgId

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando a configuração de inicialização de nome $launchConfigName"
        aws autoscaling describe-launch-configurations --query "LaunchConfigurations[?LaunchConfigurationName=='$launchConfigName'].LaunchConfigurationName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2-AUTO SCALING"
Write-Output "LAUNCH CONFIGURATION EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$launchConfigName = "launchConfigTest1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe a configuração de inicialização de nome $launchConfigName"
    $condition = aws autoscaling describe-launch-configurations --query "LaunchConfigurations[?LaunchConfigurationName=='$launchConfigName'].LaunchConfigurationName" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as configurações de inicialiação"
        aws autoscaling describe-launch-configurations --query "LaunchConfigurations[].LaunchConfigurationName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo a launch configuration (configuração de inicialização) de nome $launchConfigName"
        aws autoscaling delete-launch-configuration --launch-configuration-name $launchConfigName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todas as configurações de inicialiação"
        aws autoscaling describe-launch-configurations --query "LaunchConfigurations[].LaunchConfigurationName" --output text
    } else {Write-Output "Não existe a configuração de inicialização de nome $launchConfigName"}
} else {Write-Host "Código não executado"}