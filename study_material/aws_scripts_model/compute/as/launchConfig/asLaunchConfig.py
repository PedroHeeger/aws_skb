#!/usr/bin/env python

import boto3

print("***********************************************")
print("SERVIÇO: AWS EC2-AUTO SCALING")
print("LAUNCH CONFIGURATION CREATION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
launch_config_name = "launchConfigTest1"
ami_id = "ami-0c7217cdde317cfec"  # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
instance_type = "t2.micro"
key_pair = "keyPairUniversal"
user_data_path = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/httpd"
user_data_file = "udFileDeb.sh"
sg_name = "default"

print("-----//-----//-----//-----//-----//-----//-----")
response = input("Deseja executar o código? (y/n) ")
if response.lower() == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe a configuração de inicialização de nome {launch_config_name}")
    autoscaling_client = boto3.client('autoscaling')
    ec2_client = boto3.client('ec2')

    try:
        response = autoscaling_client.describe_launch_configurations(
            LaunchConfigurationNames=[launch_config_name]
        )

        if response['LaunchConfigurations']:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Já existe a configuração de inicialização de nome {launch_config_name}")
            print(response['LaunchConfigurations'][0]['LaunchConfigurationName'])
        else:
            print("-----//-----//-----//-----//-----//-----//-----")
            print("Listando todas as configurações de inicialiação")
            response = autoscaling_client.describe_launch_configurations()
            for launch_config in response['LaunchConfigurations']:
                print(launch_config['LaunchConfigurationName'])

            print("-----//-----//-----//-----//-----//-----//-----")
            print("Extraindo o Id do grupo de segurança padrão")
            # vpc_id = ec2_client.describe_vpcs()['Vpcs'][0]['VpcId']
            sg_id = ec2_client.describe_security_groups(
                Filters=[
                    # {'Name': 'vpc-id', 'Values': [vpc_id]},
                    {'Name': 'group-name', 'Values': [sg_name]}
                ]
            )['SecurityGroups'][0]['GroupId']

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Criando um launch configuration (configuração de inicialização) de nome {launch_config_name}")
            autoscaling_client.create_launch_configuration(
                LaunchConfigurationName=launch_config_name,
                ImageId=ami_id,
                InstanceType=instance_type,
                KeyName=key_pair,
                UserData=open(f"{user_data_path}/{user_data_file}", "r").read(),
                SecurityGroups=[sg_id]
            )

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Listando a configuração de inicialização de nome {launch_config_name}")
            response = autoscaling_client.describe_launch_configurations(
                LaunchConfigurationNames=[launch_config_name]
            )
            print(response['LaunchConfigurations'][0]['LaunchConfigurationName'])

    except Exception as e:
        print(f"Erro: {e}")
else:
    print("Código não executado")




#!/usr/bin/env python
    
import boto3

print("***********************************************")
print("SERVIÇO: AWS EC2-AUTO SCALING")
print("LAUNCH CONFIGURATION EXCLUSION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
launch_config_name = "launchConfigTest1"

print("-----//-----//-----//-----//-----//-----//-----")
response = input("Deseja executar o código? (y/n) ")
if response.lower() == 'y':
    try:
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Verificando se existe a configuração de inicialização de nome {launch_config_name}")
        autoscaling_client = boto3.client('autoscaling')
        response = autoscaling_client.describe_launch_configurations(
            LaunchConfigurationNames=[launch_config_name]
        )

        if response['LaunchConfigurations']:
            print("-----//-----//-----//-----//-----//-----//-----")
            print("Listando todas as configurações de inicialiação")
            response = autoscaling_client.describe_launch_configurations()
            for launch_config in response['LaunchConfigurations']:
                print(launch_config['LaunchConfigurationName'])

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo a launch configuration (configuração de inicialização) de nome {launch_config_name}")
            autoscaling_client.delete_launch_configuration(
                LaunchConfigurationName=launch_config_name
            )

            print("-----//-----//-----//-----//-----//-----//-----")
            print("Listando todas as configurações de inicialiação")
            response = autoscaling_client.describe_launch_configurations()
            for launch_config in response['LaunchConfigurations']:
                print(launch_config['LaunchConfigurationName'])

        else:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Não existe a configuração de inicialização de nome {launch_config_name}")
    except Exception as e:
        print(f"Erro: {e}")
else:
    print("Código não executado")