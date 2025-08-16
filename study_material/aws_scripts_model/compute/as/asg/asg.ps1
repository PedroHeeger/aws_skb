#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2-AUTO SCALING"
Write-Output "AUTO SCALING GROUP CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$asgType = "Type1"       # Criado a partir do launchTemp type 1 (User Data, Instance Profile e SG)
# $asgType = "Type2"       # Criado a partir do launchTemp type 2 (User Data, VPC, AZ, SG, Tag Name Instance)
# $asgType = "Type3"       # Criado a partir do launchConfig (User Data e SG)
$lbName = "ALB"
# $lbName = "CLB"

$asgName = "asgTest1"
$launchConfigName = "launchConfigTest1"
$launchTempName = "launchTempTest1"
$versionNumber = 1
$minSize = 1
$maxSize = 2
$desiredCapacity = 1
$defaultCooldown = 300
$healthCheckType = "EC2"
$healthCheckGracePeriod = 300

$az1 = "us-east-1a"
$az2 = "us-east-1b"
$tagNameInstance = "ec2Test"
$tgName = "tgTest1"
$clbName = "clbTest1"
$albName = "albTest1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    function AutoScalingGroupType1 {
        param ([string]$asgName, [string]$launchTempName, [string]$versionNumber, [int]$minSize, [int]$maxSize, [int]$desiredCapacity, [int]$defaultCooldown, [string]$healthCheckType, [int]$healthCheckGracePeriod, [string]$az1, [string]$az2,  [string]$tagNameInstance, [string]$lbCommand, [string]$lbName)
      
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo os IDs dos elementos de rede"
        $vpcId = aws ec2 describe-vpcs --filters "Name=isDefault,Values=true" --query "Vpcs[].VpcId" --output text
        $subnetId1 = aws ec2 describe-subnets --filters "Name=availability-zone,Values=$az1" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text
        $subnetId2 = aws ec2 describe-subnets --filters "Name=availability-zone,Values=$az2" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o comando para provisão do auto scaling group $asgName"
        $command = "aws autoscaling create-auto-scaling-group --auto-scaling-group-name $asgName --launch-template `"LaunchTemplateName=$launchTempName,Version=$versionNumber`" --min-size $minSize --max-size $maxSize --desired-capacity $desiredCapacity --default-cooldown $defaultCooldown --health-check-type $healthCheckType --health-check-grace-period $healthCheckGracePeriod --vpc-zone-identifier `"$subnetId1,$subnetId2`" --tags `"Key=Name,Value=$tagNameInstance,PropagateAtLaunch=true`" "
        $lbCommand = "$lbCommand $lbName"
        $command += $lbCommand

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o auto scaling group $asgName"
        Invoke-Expression $command

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Habilitando a coleta de métricas do auto scaling group de nome $asgName"
        aws autoscaling enable-metrics-collection --auto-scaling-group-name $asgName --metrics "GroupMinSize" "GroupMaxSize" "GroupDesiredCapacity" "GroupInServiceInstances" "GroupPendingInstances" "GroupStandbyInstances" "GroupTerminatingInstances" "GroupTotalInstances" --granularity "1Minute"
    }
    

    function AutoScalingGroupType2 {
        param ([string]$asgName, [string]$launchTempName, [string]$versionNumber, [int]$minSize, [int]$maxSize, [int]$desiredCapacity, [int]$defaultCooldown, [string]$healthCheckType, [int]$healthCheckGracePeriod, [string]$lbCommand, [string]$lbName)
            
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o comando para provisão do auto scaling group $asgName"
         $command = "aws autoscaling create-auto-scaling-group --auto-scaling-group-name $asgName --launch-template `"LaunchTemplateName=$launchTempName,Version=$versionNumber`" --min-size $minSize --max-size $maxSize --desired-capacity $desiredCapacity --default-cooldown $defaultCooldown --health-check-type $healthCheckType --health-check-grace-period $healthCheckGracePeriod "
        $lbCommand = "$lbCommand $lbName"
        $command += $lbCommand

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o auto scaling group $asgName"
        Invoke-Expression $command

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Habilitando a coleta de métricas do auto scaling group de nome $asgName"
        aws autoscaling enable-metrics-collection --auto-scaling-group-name $asgName --metrics "GroupMinSize" "GroupMaxSize" "GroupDesiredCapacity" "GroupInServiceInstances" "GroupPendingInstances" "GroupStandbyInstances" "GroupTerminatingInstances" "GroupTotalInstances" --granularity "1Minute"
    }

    function AutoScalingGroupType3 {
        param ([string]$asgName, [string]$launchConfigName, [int]$minSize, [int]$maxSize, [int]$desiredCapacity, [int]$defaultCooldown, [string]$healthCheckType, [int]$healthCheckGracePeriod, [string]$az1, [string]$az2,  [string]$tagNameInstance, [string]$lbCommand, [string]$lbName)
       
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Extraindo os IDs dos elementos de rede"
        $vpcId = aws ec2 describe-vpcs --filters "Name=isDefault,Values=true" --query "Vpcs[].VpcId" --output text
        $subnetId1 = aws ec2 describe-subnets --filters "Name=availability-zone,Values=$az1" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text
        $subnetId2 = aws ec2 describe-subnets --filters "Name=availability-zone,Values=$az2" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o comando para provisão do auto scaling group $asgName"
        $command = "aws autoscaling create-auto-scaling-group --auto-scaling-group-name $asgName --launch-configuration-name $launchConfigName --min-size $minSize --max-size $maxSize --desired-capacity $desiredCapacity --default-cooldown $defaultCooldown --health-check-type $healthCheckType --health-check-grace-period $healthCheckGracePeriod --vpc-zone-identifier `"$subnetId1,$subnetId2`" --tags `"Key=Name,Value=$tagNameInstance,PropagateAtLaunch=true`" "

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o auto scaling group $asgName"
        Invoke-Expression $command

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Habilitando a coleta de métricas do auto scaling group de nome $asgName"
        aws autoscaling enable-metrics-collection --auto-scaling-group-name $asgName --metrics "GroupMinSize" "GroupMaxSize" "GroupDesiredCapacity" "GroupInServiceInstances" "GroupPendingInstances" "GroupStandbyInstances" "GroupTerminatingInstances" "GroupTotalInstances" --granularity "1Minute"
    }

    
    function ManageAutoScalingGroup {
        param ([string]$asgType, [string]$asgName, [string]$launchTempName, [int]$versionNumber, [string]$launchConfigName, [int]$minSize, [int]$maxSize, [int]$desiredCapacity, [int]$defaultCooldown, [string]$healthCheckType, [int]$healthCheckGracePeriod, [string]$az1, [string]$az2,  [string]$tagNameInstance, [string]$lbCommand, [string]$lbName)

        if ($asgType -eq "Type1") {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se existe o modelo de implantação $launchTempName"
            $condition = aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text   
            if (($condition).Count -gt 0) {   
                AutoScalingGroupType1 -asgName $asgName -launchTempName $launchTempName -versionNumber $versionNumber -minSize $minSize -maxSize $maxSize -desiredCapacity $desiredCapacity -defaultCooldown $defaultCooldown -healthCheckType $healthCheckType -healthCheckGracePeriod $healthCheckGracePeriod -az1 $az1 -az2 $az2 -tagNameInstance $tagNameInstance -lbCommand $lbCommand -lbName $lbName
            } else {Write-Output "Não existe o modelo de implantação $launchTempName"}
        } elseif ($asgType -eq "Type2") {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se existe o modelo de implantação $launchTempName"
            $condition = aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text   
            if (($condition).Count -gt 0) {   
                AutoScalingGroupType2 -asgName $asgName -launchTempName $launchTempName -versionNumber $versionNumber -minSize $minSize -maxSize $maxSize -desiredCapacity $desiredCapacity -defaultCooldown $defaultCooldown -healthCheckType $healthCheckType -healthCheckGracePeriod $healthCheckGracePeriod -lbCommand $lbCommand -lbName $lbName
            } else {Write-Output "Não existe o modelo de implantação $launchTempName"}
        } elseif ($asgType -eq "Type3") {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se existe a configuração de inicialização $launchConfigName"
            $condition = aws autoscaling describe-launch-configurations --query "LaunchConfigurations[?LaunchConfigurationName=='$launchConfigName'].LaunchConfigurationName" --output text
            if (($condition).Count -gt 0) {   
                AutoScalingGroupType3 -asgName $asgName -launchConfigName $launchConfigName -minSize $minSize -maxSize $maxSize -desiredCapacity $desiredCapacity -defaultCooldown $defaultCooldown -healthCheckType $healthCheckType -healthCheckGracePeriod $healthCheckGracePeriod -az1 $az1 -az2 $az2 -tagNameInstance $tagNameInstance -lbCommand $lbCommand -lbName $lbName
            } else {Write-Output "Não existe a configuração de inicialização $launchConfigName"}
        }
    }



    
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o auto scaling group ativo $asgName"
    $condition = aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName' && (Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null)].AutoScalingGroupName" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o auto scaling group ativo $asgName"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName' && (Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null)].AutoScalingGroupName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os auto scaling groups existentes ativos"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null].AutoScalingGroupName" --output text

        if ($lbName -eq "ALB") {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se existe o load balancer $albName"
            $condition = aws elbv2 describe-load-balancers --query "LoadBalancers[?LoadBalancerName=='$albName'].LoadBalancerName" --output text
            if (($condition).Count -gt 0) {
                Write-Output "-----//-----//-----//-----//-----//-----//-----"
                Write-Output "Extraindo o ARN do target group $tgName"
                $tgArn = aws elbv2 describe-target-groups --query "TargetGroups[?TargetGroupName=='$tgName'].TargetGroupArn" --output text
                $lbCommand = "--target-group-arns "

                ManageAutoScalingGroup -asgType $asgType -asgName $asgName -launchTempName $launchTempName -versionNumber $versionNumber -launchConfigName $launchConfigName -minSize $minSize -maxSize $maxSize -desiredCapacity $desiredCapacity -defaultCooldown $defaultCooldown -healthCheckType $healthCheckType -healthCheckGracePeriod $healthCheckGracePeriod -az1 $az1 -az2 $az2 -tagNameInstance $tagNameInstance -lbCommand $lbCommand -lbName $tgArn
            } else {Write-Output "Não existe o load balancer $albName"}
        } elseif ($lbName -eq "CLB") {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Verificando se existe o classic load balancer $clbName"
            $condition = aws elb describe-load-balancers --query "LoadBalancerDescriptions[?LoadBalancerName=='$clbName'].LoadBalancerName" --output text
            if (($condition).Count -gt 0) {
                $lbCommand = "--load-balancer-names "

                ManageAutoScalingGroup -asgType $asgType -asgName $asgName -launchTempName $launchTempName -versionNumber $versionNumber -launchConfigName $launchConfigName -minSize $minSize -maxSize $maxSize -desiredCapacity $desiredCapacity -defaultCooldown $defaultCooldown -healthCheckType $healthCheckType -healthCheckGracePeriod $healthCheckGracePeriod -az1 $az1 -az2 $az2 -tagNameInstance $tagNameInstance -lbCommand $lbCommand -lbName $clbName
            } else {Write-Output "Não existe o classic load balancer $clbName"}
        }

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o auto scaling group ativo $asgName"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName' && (Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null)].AutoScalingGroupName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2-AUTO SCALING"
Write-Output "AUTO SCALING GROUP EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$asgName = "asgTest1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o auto scaling group ativo $asgName"
    $condition = aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName' && Status!='Delete in progress' && Status!='Terminating'].AutoScalingGroupName" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os grupos de auto scaling existentes ativos"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null].AutoScalingGroupName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o auto scaling group $asgName"
        aws autoscaling delete-auto-scaling-group --auto-scaling-group-name $asgName --force-delete

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os grupos de auto scaling existentes ativos"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null].AutoScalingGroupName" --output text
    } else {Write-Output "Não existe o auto scaling group $asgName"}
} else {Write-Host "Código não executado"}