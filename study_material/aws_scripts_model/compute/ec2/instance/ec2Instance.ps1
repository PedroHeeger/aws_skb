#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "INSTANCE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameInstance = "ec2Test2"
$sgName = "default"
# $az = "us-east-1a"
$az = "us-east-1a"
$imageId = "ami-0c7217cdde317cfec"    # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
$so = "ubuntu"
# $so = "ec2-user"
$instanceType = "t2.micro"
$keyPairPath = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/.default/secrets/awsKeyPair/universal"
$keyPairName = "keyPairUniversal"
# $userDataPath = "G:/Meu Drive/4_PROJ/scripts/aws/compute/ec2/userData/0linuxTools_git/"
$userDataPath = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/httpd"
$userDataFile = "udFileDeb.sh"
# $deviceName = "/dev/xvda" 
$deviceName = "/dev/sda1" 
$volumeSize = 8
$volumeType = "gp2"
# $instanceProfileName = "instanceProfileTest"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe uma instância ativa $tagNameInstance"
    $condition = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe uma instância ativa $tagNameInstance"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='$tagNameInstance'].Value" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o IP público da instância ativa $tagNameInstance"
        $instanceIp = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        Write-Output $instanceIp

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id da instância ativa $tagNameInstance"
        $instanceId = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via SSH ou AWS SSM"
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" $so@$instanceIp"
        Write-Output "aws ssm start-session --target $instanceId"
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id dos elementos de rede"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text
        $subnetId = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$az'].SubnetId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a instância $tagNameInstance"
        $instanceId = aws ec2 run-instances --image-id $imageId --instance-type $instanceType --key-name $keyPairName --security-group-ids $sgId --subnet-id $subnetId --count 1 --user-data "file://$userDataPath\$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tagNameInstance}]" --block-device-mappings "[{`"DeviceName`":`"$deviceName`",`"Ebs`":{`"VolumeSize`":$volumeSize,`"VolumeType`":`"$volumeType`"}}]" --no-cli-pager --query "Instances[0].InstanceId" --output text

        # Write-Output "-----//-----//-----//-----//-----//-----//-----"
        # Write-Output "Criando a instância $tagNameInstance"
        # $instanceId = aws ec2 run-instances --image-id $imageId --instance-type $instanceType --key-name $keyPairName --security-group-ids $sgId --subnet-id $subnetId --count 1 --user-data "file://$userDataPath\$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$tagNameInstance}]" --block-device-mappings "[{`"DeviceName`":`"$deviceName`",`"Ebs`":{`"VolumeSize`":$volumeSize,`"VolumeType`":`"$volumeType`"}}]" --iam-instance-profile Name=$instanceProfileName --no-cli-pager --query "Instances[0].InstanceId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Aguardando a instância criada entrar em execução"
        $instanceState = ""
        while ($instanceState -ne "running") {
            Start-Sleep -Seconds 20  
            $instanceState = aws ec2 describe-instances --instance-ids $instanceId --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager
            Write-Output "Estado atual da instância: $instanceState"
        }
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o IP público da instância ativa $tagNameInstance"
        $instanceIp = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        Write-Output $instanceIp

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via SSH ou AWS SSM"
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" $so@$instanceIp"
        Write-Output "aws ssm start-session --target $instanceId"
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "INSTANCE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameInstance = "ec2Test2"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe uma instância ativa $tagNameInstance"
    $condition = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id da instância $tagNameInstance"
        $instanceId = aws ec2 describe-instances --filters "Name=tag:Name,Values=$tagNameInstance" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo a instância $tagNameInstance"
        aws ec2 terminate-instances --instance-ids $instanceId --no-dry-run --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Aguardando a instância ser removida"
        $instanceState = ""
        while ($instanceState -ne "terminated") {
            Start-Sleep -Seconds 20  
            $instanceState = aws ec2 describe-instances --instance-ids $instanceId --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager
            Write-Output "Estado atual da instância: $instanceState"
        }
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
    } else {Write-Output "Não existe uma instância ativa $tagNameInstance"}
} else {Write-Host "Código não executado"}