#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "DOUBLE INSTANCE CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameInstance = "ec2Test"
$instanceA = "1"
$instanceB = "2"
$sgName = "default"
$az = "us-east-1a"
$imageId = "ami-0c7217cdde317cfec"    # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
$so = "ubuntu"
# $so = "ec2-user"
$instanceType = "t2.micro"
$keyPairPath = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/.default/secrets/awsKeyPair/universal"
$keyPairName = "keyPairUniversal"
$userDataPath = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/0linuxTools_git"
$userDataFile = "udFileDeb.sh"
# $deviceName = "/dev/xvda" 
$deviceName = "/dev/sda1"
$volumeSize = 8
$volumeType = "gp2"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe as instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
    $condition = aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[?(Tags[?Key=='Name' && (Value=='${tagNameInstance}${instanceA}' || Value=='${tagNameInstance}${instanceB}')])].[Tags[?Key=='Name'].Value | [0]]" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe as instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceA}'].Value" --output text
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name' && Value=='${tagNameInstance}${instanceB}'].Value" --output text
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o IP público das instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        $instanceIpA = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        $instanceIpB = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        Write-Output $instanceIpA
        Write-Output $instanceIpB

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id das instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        $instanceIdA = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text
        $instanceIdB = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância ${tagNameInstance}${instanceA}"
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" $so@$instanceIpA"
        Write-Output "aws ssm start-session --target $instanceIdA"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância ${tagNameInstance}${instanceB}"
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" $so@$instanceIpB"
        Write-Output "aws ssm start-session --target $instanceIdB"
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id dos elementos de rede"
        $sgId = aws ec2 describe-security-groups --query "SecurityGroups[?GroupName=='$sgName'].GroupId" --output text
        $subnetId = aws ec2 describe-subnets --query "Subnets[?AvailabilityZone=='$az'].SubnetId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a instância ${tagNameInstance}${instanceA}"
        $instanceIdA = aws ec2 run-instances --image-id $imageId --instance-type $instanceType --key-name $keyPairName --security-group-ids $sgId --subnet-id $subnetId --count 1 --user-data "file://$userDataPath\$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${tagNameInstance}${instanceA}}]" --block-device-mappings "[{`"DeviceName`":`"$deviceName`",`"Ebs`":{`"VolumeSize`":$volumeSize,`"VolumeType`":`"$volumeType`"}}]" --no-cli-pager --query "Instances[0].InstanceId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando a instância ${tagNameInstance}${instanceB}"
        $instanceIdB = aws ec2 run-instances --image-id $imageId --instance-type $instanceType --key-name $keyPairName --security-group-ids $sgId --subnet-id $subnetId --count 1 --user-data "file://$userDataPath\$userDataFile" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${tagNameInstance}${instanceB}}]" --block-device-mappings "[{`"DeviceName`":`"$deviceName`",`"Ebs`":{`"VolumeSize`":$volumeSize,`"VolumeType`":`"$volumeType`"}}]" --no-cli-pager --query "Instances[0].InstanceId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Aguardando as instâncias criadas entrarem em execução"
        $instanceStateA = ""
        $instanceStateB = ""
        while ($instanceStateA -ne "running" -or $instanceStateB -ne "running") {
            Start-Sleep -Seconds 20  
            $instanceStateA = aws ec2 describe-instances --instance-ids $instanceIdA --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager
            Write-Output "Estado atual da instância ${tagNameInstance}${instanceA}: $instanceStateA"
            $instanceStateB = aws ec2 describe-instances --instance-ids $instanceIdB --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager
            Write-Output "Estado atual da instância ${tagNameInstance}${instanceB}: $instanceStateB"
        }

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o IP público das instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        $instanceIpA = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        $instanceIpB = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].NetworkInterfaces[].Association[].PublicIp" --output text
        Write-Output $instanceIpA
        Write-Output $instanceIpB

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id das instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        $instanceIdA = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text
        $instanceIdB = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].InstanceId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância ${tagNameInstance}${instanceA}"
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" $so@$instanceIpA"
        Write-Output "aws ssm start-session --target $instanceIdA"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância ${tagNameInstance}${instanceB}"
        Write-Output "ssh -i `"$keyPairPath\$keyPairName.pem`" $so@$instanceIpB"
        Write-Output "aws ssm start-session --target $instanceIdB"
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "DOUBLE INSTANCE EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$tagNameInstance = "ec2Test"
$instanceA = "1"
$instanceB = "2"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe as instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
    $condition = aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[?(Tags[?Key=='Name' && (Value=='${tagNameInstance}${instanceA}' || Value=='${tagNameInstance}${instance}2')])].[Tags[?Key=='Name'].Value | [0]]" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo o Id das instâncias ativas ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        $instanceIdA = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceA}" --query "Reservations[].Instances[].InstanceId" --output text
        $instanceIdB = aws ec2 describe-instances --filters "Name=tag:Name,Values=${tagNameInstance}${instanceB}" --query "Reservations[].Instances[].InstanceId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo as instâncias ${tagNameInstance}${instanceA} e ${tagNameInstance}${instanceB}"
        aws ec2 terminate-instances --instance-ids $instanceIdA $instanceIdB --no-dry-run --no-cli-pager

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Aguardando as instâncias serem removidas"
        $instanceStateA = ""
        $instanceStateB = ""
        while ($instanceStateA -ne "terminated" -or $instanceStateB -ne "terminated") {
            Start-Sleep -Seconds 20  
            $instanceStateA = aws ec2 describe-instances --instance-ids $instanceIdA --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager
            Write-Output "Estado atual da instância ${tagNameInstance}${instanceA}: $instanceStateA"
            $instanceStateB = aws ec2 describe-instances --instance-ids $instanceIdA --query "Reservations[].Instances[].State.Name" --output text --no-cli-pager
            Write-Output "Estado atual da instância ${tagNameInstance}${instanceB}: $instanceStateB"
        }
        
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de tag de todas as instâncias criadas ativas"
        aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].Tags[?Key=='Name'].Value" --output text
    } else {Write-Output "Não existem instâncias ativas ${tagNameInstance}${instanceA} ou ${tagNameInstance}${instanceB}"}
} else {Write-Host "Código não executado"}