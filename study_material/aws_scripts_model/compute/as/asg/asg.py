import boto3
from botocore.exceptions import ClientError

print("***********************************************")
print("SERVIÇO: AWS EC2-AUTO SCALING")
print("AUTO SCALING GROUP CREATION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
asg_type = "Type1"  # Criado a partir do launchTemp type 1 (User Data, Instance Profile e SG)
# asg_type = "Type2"  # Criado a partir do launchTemp type 2 (User Data, VPC, AZ, SG, Tag Name Instance)
# asg_type = "Type3"  # Criado a partir do launchConfig (User Data e SG)
lb_name = "ALB"  # Nome para ALB (Application Load Balancer)
# lb_name = "CLB"  # Nome para CLB (Classic Load Balancer)

asg_name = "asgTest1"
launch_config_name = "launchConfigTest1"
launch_temp_name = "launchTempTest1"
version_number = 2
min_size = 1
max_size = 2
desired_capacity = 1
default_cooldown = 300
health_check_type = "EC2"
health_check_grace_period = 300

az1 = "us-east-1a"
az2 = "us-east-1b"
tag_name_instance = "ec2Test"
tg_name = "tgTest1"
clb_name = "clbTest1"
alb_name = "albTest1"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ").lower()
if resposta == 'y':
    def auto_scaling_group_type1(asg_name, launch_temp_name, version_number, min_size, max_size, desired_capacity, default_cooldown, health_check_type, health_check_grace_period, az1, az2, tag_name_instance, lb_command):

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Extraindo os IDs dos elementos de rede")
        ec2_client = boto3.client('ec2')
        vpc_id = ec2_client.describe_vpcs(Filters=[{'Name': 'isDefault', 'Values': ['true']}])['Vpcs'][0]['VpcId']
        subnet_id1 = ec2_client.describe_subnets(Filters=[{'Name': 'availability-zone', 'Values': [az1]}, {'Name': 'vpc-id', 'Values': [vpc_id]}])['Subnets'][0]['SubnetId']
        subnet_id2 = ec2_client.describe_subnets(Filters=[{'Name': 'availability-zone', 'Values': [az2]}, {'Name': 'vpc-id', 'Values': [vpc_id]}])['Subnets'][0]['SubnetId']
           
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando o auto scaling group {asg_name}")
        autoscaling_client = boto3.client('autoscaling')
        autoscaling_client.create_auto_scaling_group(
            AutoScalingGroupName=asg_name,
            LaunchTemplate={'LaunchTemplateName': launch_temp_name, 'Version': str(version_number)},
            MinSize=min_size,
            MaxSize=max_size,
            DesiredCapacity=desired_capacity,
            DefaultCooldown=default_cooldown,
            HealthCheckType=health_check_type,
            HealthCheckGracePeriod=health_check_grace_period,
            VPCZoneIdentifier=f"{subnet_id1},{subnet_id2}",
            Tags=[{'Key': 'Name', 'Value': tag_name_instance, 'PropagateAtLaunch': True}],
            **lb_command
        )
        
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Habilitando a coleta de métricas do auto scaling group de nome {asg_name}")
        autoscaling_client.enable_metrics_collection(
            AutoScalingGroupName=asg_name,
            Metrics=["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"],
            Granularity="1Minute"
        )


    def auto_scaling_group_type2(asg_name, launch_temp_name, version_number, min_size, max_size, desired_capacity, default_cooldown, health_check_type, health_check_grace_period, lb_command):       
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando o auto scaling group {asg_name}")
        autoscaling_client = boto3.client('autoscaling')
        autoscaling_client.create_auto_scaling_group(
            AutoScalingGroupName=asg_name,
            LaunchTemplate={'LaunchTemplateName': launch_temp_name, 'Version': str(version_number)},
            MinSize=min_size,
            MaxSize=max_size,
            DesiredCapacity=desired_capacity,
            DefaultCooldown=default_cooldown,
            HealthCheckType=health_check_type,
            HealthCheckGracePeriod=health_check_grace_period,
            **lb_command
        )

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Habilitando a coleta de métricas do auto scaling group de nome {asg_name}")
        autoscaling_client.enable_metrics_collection(
            AutoScalingGroupName=asg_name,
            Metrics=["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"],
            Granularity="1Minute"
        )


    def auto_scaling_group_type3(asg_name, launch_config_name, min_size, max_size, desired_capacity, default_cooldown, health_check_type, health_check_grace_period, az1, az2, tag_name_instance, lb_command):
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Extraindo os IDs dos elementos de rede")
        ec2_client = boto3.client('ec2')
        vpc_id = ec2_client.describe_vpcs(Filters=[{'Name': 'isDefault', 'Values': ['true']}])['Vpcs'][0]['VpcId']
        subnet_id1 = ec2_client.describe_subnets(Filters=[{'Name': 'availability-zone', 'Values': [az1]}, {'Name': 'vpc-id', 'Values': [vpc_id]}])['Subnets'][0]['SubnetId']
        subnet_id2 = ec2_client.describe_subnets(Filters=[{'Name': 'availability-zone', 'Values': [az2]}, {'Name': 'vpc-id', 'Values': [vpc_id]}])['Subnets'][0]['SubnetId']
               
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando o auto scaling group {asg_name}")
        autoscaling_client = boto3.client('autoscaling')
        autoscaling_client.create_auto_scaling_group(
            AutoScalingGroupName=asg_name,
            LaunchConfigurationName=launch_config_name,
            MinSize=min_size,
            MaxSize=max_size,
            DesiredCapacity=desired_capacity,
            DefaultCooldown=default_cooldown,
            HealthCheckType=health_check_type,
            HealthCheckGracePeriod=health_check_grace_period,
            VPCZoneIdentifier=f"{subnet_id1},{subnet_id2}",
            Tags=[{'Key': 'Name', 'Value': tag_name_instance, 'PropagateAtLaunch': True}],
            **lb_command
        )

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Habilitando a coleta de métricas do auto scaling group de nome {asg_name}")
        autoscaling_client.enable_metrics_collection(
            AutoScalingGroupName=asg_name,
            Metrics=["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"],
            Granularity="1Minute"
        )


    def manage_auto_scaling_group(asg_type, asg_name, launch_temp_name, launch_config_name, version_number, min_size, max_size, desired_capacity, default_cooldown, health_check_type, health_check_grace_period, az1, az2, tag_name_instance, lb_command):

        ec2_client = boto3.client('ec2')
        autoscaling_client = boto3.client('autoscaling')
        if asg_type == "Type1":
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Verificando se existe o modelo de implantação {launch_temp_name}")
            response = ec2_client.describe_launch_templates(
                Filters=[{'Name': 'launch-template-name', 'Values': [launch_temp_name]}]
            )
            if response['LaunchTemplates']:
                auto_scaling_group_type1(asg_name, launch_temp_name, version_number, min_size, max_size, desired_capacity, default_cooldown, health_check_type, health_check_grace_period, az1, az2, tag_name_instance, lb_command)
            else:
                print(f"Não existe o modelo de implantação {launch_temp_name}")

        elif asg_type == "Type2":
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Verificando se existe o modelo de implantação {launch_temp_name}")
            response = ec2_client.describe_launch_templates(
                Filters=[{'Name': 'launch-template-name', 'Values': [launch_temp_name]}]
            )
            if response['LaunchTemplates']:
                auto_scaling_group_type2(asg_name, launch_temp_name, version_number, min_size, max_size, desired_capacity, default_cooldown, health_check_type, health_check_grace_period, lb_command)
            else:
                print(f"Não existe o modelo de implantação {launch_temp_name}")

        elif asg_type == "Type3":
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Verificando se existe a configuração de inicialização {launch_config_name}")
            response = autoscaling_client.describe_launch_configurations(
                LaunchConfigurationNames=[launch_config_name]
            )
            if response['LaunchConfigurations']:
                auto_scaling_group_type3(asg_name, launch_config_name, min_size, max_size, desired_capacity, default_cooldown, health_check_type, health_check_grace_period, az1, az2, tag_name_instance, lb_command)
            else:
                print(f"Não existe a configuração de inicialização {launch_config_name}")




    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o auto scaling group ativo {asg_name}")
    autoscaling_client = boto3.client('autoscaling')
    response = autoscaling_client.describe_auto_scaling_groups(
        AutoScalingGroupNames=[asg_name]
    )
    condition = response['AutoScalingGroups']
    filtered_condition = [
        asg for asg in condition
        if 'Status' not in asg or asg['Status'] in ['InService', 'Pending', 'Updating']
    ]

    if len(filtered_condition) > 0:
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Já existe o auto scaling group ativo {asg_name}")
        response = autoscaling_client.describe_auto_scaling_groups(
            AutoScalingGroupNames=[asg_name]
        )
        all_active_groups = response['AutoScalingGroups']
        active_groups = [
            asg for asg in all_active_groups
            if 'Status' not in asg or asg['Status'] in ['InService', 'Pending', 'Updating']
        ]
        for asg in active_groups:
            print(asg["AutoScalingGroupName"])
    else:
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando todos os auto scaling groups existentes ativos")
        response = autoscaling_client.describe_auto_scaling_groups()
        all_active_groups = response['AutoScalingGroups']
        active_groups = [
            asg for asg in all_active_groups
            if 'Status' not in asg or asg['Status'] in ['InService', 'Pending', 'Updating']
        ]
        for asg in active_groups:
            print(asg["AutoScalingGroupName"])

        if lb_name == "ALB":
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Verificando se existe o load balancer {alb_name}")
            elb_client = boto3.client('elbv2')
            response = elb_client.describe_load_balancers(
                Names=[alb_name]
            )
            condition = response['LoadBalancers']
            
            if len(condition) > 0:
                print("-----//-----//-----//-----//-----//-----//-----")
                print(f"Extraindo o ARN do target group {tg_name}")
                response = elb_client.describe_target_groups(
                    Names=[tg_name]
                )
                tg_arn = response['TargetGroups'][0]['TargetGroupArn']
                lb_command = {"TargetGroupARNs": [tg_arn]}

                manage_auto_scaling_group(asg_type=asg_type, asg_name=asg_name, launch_temp_name=launch_temp_name, version_number=version_number, launch_config_name=launch_config_name, min_size=min_size, max_size=max_size, desired_capacity=desired_capacity, default_cooldown=default_cooldown, health_check_type=health_check_type, health_check_grace_period=health_check_grace_period, az1=az1, az2=az2, tag_name_instance=tag_name_instance, lb_command=lb_command)
            else:
                print(f"Não existe o load balancer {alb_name}")
        
        elif lb_name == "CLB":
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Verificando se existe o classic load balancer {clb_name}")
            try:
                elb_old_client = boto3.client('elb')
                response = elb_old_client.describe_load_balancers(LoadBalancerNames=[clb_name])['LoadBalancerDescriptions']
                lb_found = len(response) > 0 and 'LoadBalancerName' in response[0]
            except ClientError as e:
                lb_found = False

            if lb_found:
                lb_command = {"LoadBalancerNames": [clb_name]}
                
                manage_auto_scaling_group(asg_type=asg_type, asg_name=asg_name, launch_temp_name=launch_temp_name, version_number=version_number, launch_config_name=launch_config_name,min_size=min_size, max_size=max_size, desired_capacity=desired_capacity, default_cooldown=default_cooldown, health_check_type=health_check_type, health_check_grace_period=health_check_grace_period, az1=az1, az2=az2, tag_name_instance=tag_name_instance, lb_command=lb_command)
            else:
                print(f"Não existe o classic load balancer {clb_name}")
        
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Listando o auto scaling group ativo {asg_name}")
        response = autoscaling_client.describe_auto_scaling_groups(
            AutoScalingGroupNames=[asg_name]
        )
        all_active_groups = response['AutoScalingGroups']
        active_groups = [
            asg for asg in all_active_groups
            if 'Status' not in asg or asg['Status'] in ['InService', 'Pending', 'Updating']
        ]
        for asg in active_groups:
            print(asg["AutoScalingGroupName"])
else:
    print("Operação cancelada.")




#!/usr/bin/env python3

import boto3

print("***********************************************")
print("SERVIÇO: AWS EC2-AUTO SCALING")
print("AUTO SCALING GROUP EXCLUSION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
asg_name = "asgTest1"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ").strip().lower()
if resposta == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o auto scaling group ativo {asg_name}")
    autoscaling_client = boto3.client('autoscaling')
    response = autoscaling_client.describe_auto_scaling_groups(
        AutoScalingGroupNames=[asg_name]
    )
    condition = response['AutoScalingGroups']
    filtered_condition = [
        asg['AutoScalingGroupName'] for asg in condition
        if 'Status' not in asg or asg['Status'] not in ['Delete in progress', 'Terminating']
    ]

    if len(filtered_condition) > 0:
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando todos os auto scaling groups existentes ativos")
        response = autoscaling_client.describe_auto_scaling_groups()
        all_active_groups = response['AutoScalingGroups']
        active_groups = [
            asg for asg in all_active_groups
            if 'Status' not in asg or asg['Status'] in ['InService', 'Pending', 'Updating']
        ]
        for asg in active_groups:
            print(asg["AutoScalingGroupName"])

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo o auto scaling group {asg_name}")
        autoscaling_client.delete_auto_scaling_group(
            AutoScalingGroupName=asg_name,
            ForceDelete=True
        )

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando todos os auto scaling groups existentes ativos")
        response = autoscaling_client.describe_auto_scaling_groups()
        all_active_groups = response['AutoScalingGroups']
        active_groups = [
            asg for asg in all_active_groups
            if 'Status' not in asg or asg['Status'] in ['InService', 'Pending', 'Updating']
        ]
        for asg in active_groups:
            print(asg["AutoScalingGroupName"])
    else:
        print(f"Não existe o auto scaling group {asg_name}")
else:
    print("Código não executado")