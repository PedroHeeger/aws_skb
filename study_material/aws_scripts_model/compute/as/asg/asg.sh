#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-AUTO SCALING"
echo "AUTO SCALING GROUP CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
asgType="Type1"       # Criado a partir do launchTemp type 1 (User Data, Instance Profile e SG)
# asgType="Type2"       # Criado a partir do launchTemp type 2 (User Data, VPC, AZ, SG, Tag Name Instance)
# asgType="Type3"       # Criado a partir do launchConfig (User Data e SG)
lbName="ALB"
# lbName="CLB"

asgName="asgTest1"
launchConfigName="launchConfigTest1"
launchTempName="launchTempTest1"
versionNumber=2
minSize=1
maxSize=2
desiredCapacity=1
defaultCooldown=300
healthCheckType="EC2"
healthCheckGracePeriod=300

az1="us-east-1a"
az2="us-east-1b"
tagNameInstance="ec2Test"
tgName="tgTest1"
clbName="clbTest1"
albName="albTest1"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [[ "${resposta,,}" == "y" ]]; then
    AutoScalingGroupType1() {asgName=$1 launchTempName=$2 versionNumber=$3 minSize=$4 maxSize=$5 desiredCapacity=$6 defaultCooldown=$7 healthCheckType=$8 healthCheckGracePeriod=$9 az1=${10} az2=${11} tagNameInstance=${12} lbCommand=${13} lbName=${14}

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo os IDs dos elementos de rede"
        vpcId=$(aws ec2 describe-vpcs --filters "Name=isDefault,Values=true" --query "Vpcs[].VpcId" --output text)
        subnetId1=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=$az1" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text)
        subnetId2=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=$az2" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o comando para provisão do auto scaling group $asgName"
        command="aws autoscaling create-auto-scaling-group --auto-scaling-group-name $asgName --launch-template LaunchTemplateName=$launchTempName,Version=$versionNumber --min-size $minSize --max-size $maxSize --desired-capacity $desiredCapacity --default-cooldown $defaultCooldown --health-check-type $healthCheckType --health-check-grace-period $healthCheckGracePeriod --vpc-zone-identifier \"$subnetId1,$subnetId2\" --tags Key=Name,Value=$tagNameInstance,PropagateAtLaunch=true"
        lbCommand="$lbCommand $lbName"
        command="$command $lbCommand"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o auto scaling group $asgName"
        eval $command

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Habilitando a coleta de métricas do auto scaling group de nome $asgName"
        aws autoscaling enable-metrics-collection --auto-scaling-group-name $asgName --metrics "GroupMinSize" "GroupMaxSize" "GroupDesiredCapacity" "GroupInServiceInstances" "GroupPendingInstances" "GroupStandbyInstances" "GroupTerminatingInstances" "GroupTotalInstances" --granularity "1Minute"
    }

    AutoScalingGroupType2() {asgName=$1 launchTempName=$2 versionNumber=$3 minSize=$4 maxSize=$5 desiredCapacity=$6 defaultCooldown=$7 healthCheckType=$8 healthCheckGracePeriod=$9
        lbCommand=${10} lbName=${11}

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o comando para provisão do auto scaling group $asgName"
        command="aws autoscaling create-auto-scaling-group --auto-scaling-group-name $asgName --launch-template LaunchTemplateName=$launchTempName,Version=$versionNumber --min-size $minSize --max-size $maxSize --desired-capacity $desiredCapacity --default-cooldown $defaultCooldown --health-check-type $healthCheckType --health-check-grace-period $healthCheckGracePeriod"
        lbCommand="$lbCommand $lbName"
        command="$command $lbCommand"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o auto scaling group $asgName"
        eval $command

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Habilitando a coleta de métricas do auto scaling group de nome $asgName"
        aws autoscaling enable-metrics-collection --auto-scaling-group-name $asgName --metrics "GroupMinSize" "GroupMaxSize" "GroupDesiredCapacity" "GroupInServiceInstances" "GroupPendingInstances" "GroupStandbyInstances" "GroupTerminatingInstances" "GroupTotalInstances" --granularity "1Minute"
    }

    AutoScalingGroupType3() {asgName=$1 launchConfigName=$2 minSize=$3 maxSize=$4 desiredCapacity=$5 defaultCooldown=$6 healthCheckType=$7 healthCheckGracePeriod=$8 az1=${9} az2=${10} tagNameInstance=${11} lbCommand=${12} lbName=${13}

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Extraindo os IDs dos elementos de rede"
        vpcId=$(aws ec2 describe-vpcs --filters "Name=isDefault,Values=true" --query "Vpcs[].VpcId" --output text)
        subnetId1=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=$az1" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text)
        subnetId2=$(aws ec2 describe-subnets --filters "Name=availability-zone,Values=$az2" "Name=vpc-id,Values=$vpcId" --query "Subnets[].SubnetId" --output text)

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o comando para provisão do auto scaling group $asgName"
        command="aws autoscaling create-auto-scaling-group --auto-scaling-group-name $asgName --launch-configuration-name $launchConfigName --min-size $minSize --max-size $maxSize --desired-capacity $desiredCapacity --default-cooldown $defaultCooldown --health-check-type $healthCheckType --health-check-grace-period $healthCheckGracePeriod --vpc-zone-identifier \"$subnetId1,$subnetId2\" --tags Key=Name,Value=$tagNameInstance,PropagateAtLaunch=true"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o auto scaling group $asgName"
        eval $command

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Habilitando a coleta de métricas do auto scaling group de nome $asgName"
        aws autoscaling enable-metrics-collection --auto-scaling-group-name $asgName --metrics "GroupMinSize" "GroupMaxSize" "GroupDesiredCapacity" "GroupInServiceInstances" "GroupPendingInstances" "GroupStandbyInstances" "GroupTerminatingInstances" "GroupTotalInstances" --granularity "1Minute"
    }

    ManageAutoScalingGroup() {asgType=$1 asgName=$2 launchTempName=$3 versionNumber=$4 launchConfigName=$5 minSize=$6 maxSize=$7 desiredCapacity=$8 defaultCooldown=$9 healthCheckType=$10 healthCheckGracePeriod=${11} az1=${12} az2=${13} tagNameInstance=${14} lbCommand=${15} lbName=${16}

        if [[ "$asgType" == "Type1" ]]; then
            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Verificando se existe o modelo de implantação $launchTempName"
            condition=$(aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text)
            if [[ "$condition" == "$launchTempName" ]]; then
                AutoScalingGroupType1 "$asgName" "$launchTempName" "$versionNumber" "$minSize" "$maxSize" "$desiredCapacity" "$defaultCooldown" "$healthCheckType" "$healthCheckGracePeriod" "$az1" "$az2" "$tagNameInstance" "$lbCommand" "$lbName"
            else
                echo "Não existe o modelo de implantação $launchTempName"
            fi
        elif [[ "$asgType" == "Type2" ]]; then
            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Verificando se existe o modelo de implantação $launchTempName"
            condition=$(aws ec2 describe-launch-templates --query "LaunchTemplates[?LaunchTemplateName=='$launchTempName'].LaunchTemplateName" --output text)
            if [[ "$condition" == "$launchTempName" ]]; then
                AutoScalingGroupType2 "$asgName" "$launchTempName" "$versionNumber" "$minSize" "$maxSize" "$desiredCapacity" "$defaultCooldown" "$healthCheckType" "$healthCheckGracePeriod" "$lbCommand" "$lbName"
            else
                echo "Não existe o modelo de implantação $launchTempName"
            fi
        elif [[ "$asgType" == "Type3" ]]; then
            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Verificando se existe a configuração de inicialização $launchConfigName"
            condition=$(aws autoscaling describe-launch-configurations --query "LaunchConfigurations[?LaunchConfigurationName=='$launchConfigName'].LaunchConfigurationName" --output text)
            if [[ $(echo "$condition" | wc -l) -gt 0 ]]; then
                AutoScalingGroupType3 "$asgName" "$launchConfigName" "$minSize" "$maxSize" "$desiredCapacity" "$defaultCooldown" "$healthCheckType" "$healthCheckGracePeriod" "$az1" "$az2" "$tagNameInstance" "$lbCommand" "$lbName"
            else
                echo "Não existe a configuração de inicialização $launchConfigName"
            fi   
        else
            echo "Tipo do Auto Scaling Group não definido"
        fi
    }




    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o auto scaling group ativo $asgName"
    condition=$(aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName' && (Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null)].AutoScalingGroupName" --output text)
    if [[ $(echo "$condition" | wc -l) -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe o auto scaling group ativo $asgName"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName' && (Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null)].AutoScalingGroupName" --output text
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os auto scaling groups existentes ativos"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null].AutoScalingGroupName" --output text

        if [[ "$lbName" == "ALB" ]]; then
            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Verificando se existe o load balancer $albName"
            condition=$(aws elbv2 describe-load-balancers --query "LoadBalancers[?LoadBalancerName=='$albName'].LoadBalancerName" --output text)
            if [[ $(echo "$condition" | wc -l) -gt 0 ]]; then
                echo "-----//-----//-----//-----//-----//-----//-----"
                echo "Extraindo o ARN do target group $tgName"
                tgArn=$(aws elbv2 describe-target-groups --query "TargetGroups[?TargetGroupName=='$tgName'].TargetGroupArn" --output text)
                lbCommand="--target-group-arns $tgArn"

                ManageAutoScalingGroup "$asgType" "$asgName" "$launchTempName" "$versionNumber" "$launchConfigName" "$minSize" "$maxSize" "$desiredCapacity" "$defaultCooldown" "$healthCheckType" "$healthCheckGracePeriod" "$az1" "$az2" "$tagNameInstance" "$lbCommand" "$lbName"
            else
                echo "Não existe o load balancer $albName"
            fi
        elif [[ "$lbName" == "CLB" ]]; then
            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Verificando se existe o classic load balancer $clbName"
            condition=$(aws elb describe-load-balancers --query "LoadBalancerDescriptions[?LoadBalancerName=='$clbName'].LoadBalancerName" --output text)
            if [[ $(echo "$condition" | wc -l) -gt 0 ]]; then
                lbCommand="--load-balancer-names $clbName"

                ManageAutoScalingGroup "$asgType" "$asgName" "$launchTempName" "$versionNumber" "$launchConfigName" "$minSize" "$maxSize" "$desiredCapacity" "$defaultCooldown" "$healthCheckType" "$healthCheckGracePeriod" "$az1" "$az2" "$tagNameInstance" "$lbCommand" "$lbName"
            else
                echo "Não existe o classic load balancer $clbName"
            fi
        fi

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o auto scaling group ativo $asgName"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName' && (Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null)].AutoScalingGroupName" --output text
    fi
else
    echo "Código não será executado."
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS EC2-AUTO SCALING"
echo "AUTO SCALING GROUP EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
asgName="asgTest1"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [[ "${resposta,,}" == "y" ]]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o auto scaling group ativo $asgName"
    condition=$(aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?AutoScalingGroupName=='$asgName' && Status!='Delete in progress' && Status!='Terminating'].AutoScalingGroupName" --output text)
    if [[ $(echo "$condition" | wc -l) -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os grupos de auto scaling existentes ativos"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null].AutoScalingGroupName" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo o auto scaling group $asgName"
        aws autoscaling delete-auto-scaling-group --auto-scaling-group-name "$asgName" --force-delete

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando todos os grupos de auto scaling existentes ativos"
        aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[?Status=='InService' || Status=='Pending' || Status=='Updating' || Status==null].AutoScalingGroupName" --output text
    else
        echo "Não existe o auto scaling group $asgName"
    fi
else
    echo "Código não executado"
fi