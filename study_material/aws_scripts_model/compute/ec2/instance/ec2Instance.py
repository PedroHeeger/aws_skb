#!/usr/bin/env python3

import boto3
import time
import os

print("***********************************************")
print("SERVIÇO: AWS EC2")
print("INSTANCE CREATION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
tag_name_instance = "ec2Test1"
sg_name = "default"
az = "us-east-1a"
image_id = "ami-0c7217cdde317cfec"  # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
so = "ubuntu"
# so = "ec2-user"
instance_type = "t2.micro"
key_pair_path = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/.default/secrets/awsKeyPair/universal"
key_pair_name = "keyPairUniversal"
user_data_path = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/0linuxTools_git"
user_data_file = "udFileDeb.sh"
# device_name = "/dev/xvda"
device_name = "/dev/sda1"
volume_size = 8
volume_type = "gp2"
# instance_profile_name = "instanceProfileTest"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ")
if resposta.lower() == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe uma instância ativa {tag_name_instance}")
    ec2_client = boto3.client('ec2')
    
    condition = ec2_client.describe_instances(
        Filters=[
            {'Name': 'tag:Name', 'Values': [tag_name_instance]},
            {'Name': 'instance-state-name', 'Values': ['running']}
        ]
    )
    
    if len(condition['Reservations']) > 0:
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Já existe uma instância ativa {tag_name_instance}")
        active_instance = condition['Reservations'][0]['Instances'][0]
        print(active_instance['Tags'][0]['Value'])

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Listando o IP público da instância ativa {tag_name_instance}")
        instance_ip = active_instance['NetworkInterfaces'][0]['Association']['PublicIp']
        print(instance_ip)

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Extraindo o Id da instância ativa {tag_name_instance}")
        instance_id = active_instance['InstanceId']
        
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Exibindo o comando para acesso remoto via SSH ou AWS SSM")
        print(f"ssh -i \"{key_pair_path}/{key_pair_name}.pem\" {so}@{instance_ip}")
        print(f"aws ssm start-session --target {instance_id}")
    else:
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de tag de todas as instâncias criadas ativas")
        all_active_instances = ec2_client.describe_instances(
            Filters=[{'Name': 'instance-state-name', 'Values': ['running']}]
        )
        for reservation in all_active_instances['Reservations']:
            for instance in reservation['Instances']:
                print(instance['Tags'][0]['Value'])

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Extraindo o Id dos elementos de rede")
        sg_id = ec2_client.describe_security_groups(
            Filters=[{'Name': 'group-name', 'Values': [sg_name]}]
        )['SecurityGroups'][0]['GroupId']
        
        subnet_id = ec2_client.describe_subnets(
            Filters=[{'Name': 'availabilityZone', 'Values': [az]}]
        )['Subnets'][0]['SubnetId']

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando a instância {tag_name_instance}")
        instance_response = ec2_client.run_instances(
            ImageId=image_id,
            InstanceType=instance_type,
            KeyName=key_pair_name,
            SecurityGroupIds=[sg_id],
            SubnetId=subnet_id,
            MinCount=1,
            MaxCount=1,
            UserData=open(os.path.join(user_data_path, user_data_file)).read(),
            TagSpecifications=[{
                'ResourceType': 'instance',
                'Tags': [{'Key': 'Name', 'Value': tag_name_instance}]
            }],
            BlockDeviceMappings=[{
                'DeviceName': device_name,
                'Ebs': {
                    'VolumeSize': volume_size,
                    'VolumeType': volume_type
                }
            }],
            # IamInstanceProfile={instance_profile_name}
        )
        instance_id = instance_response['Instances'][0]['InstanceId']

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Aguardando a instância criada entrar em execução")
        instance_state = ""
        while instance_state != "running":
            time.sleep(20)
            instance_state = ec2_client.describe_instances(
                InstanceIds=[instance_id]
            )['Reservations'][0]['Instances'][0]['State']['Name']
            print(f"Estado atual da instância: {instance_state}")

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de tag de todas as instâncias criadas ativas")
        all_active_instances = ec2_client.describe_instances(
            Filters=[{'Name': 'instance-state-name', 'Values': ['running']}]
        )
        for reservation in all_active_instances['Reservations']:
            for instance in reservation['Instances']:
                print(instance['Tags'][0]['Value'])

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Listando o IP público da instância ativa {tag_name_instance}")
        instance_ip = ec2_client.describe_instances(
            Filters=[{'Name': 'tag:Name', 'Values': [tag_name_instance]},
                     {'Name': 'instance-state-name', 'Values': ['running']}]
        )['Reservations'][0]['Instances'][0]['NetworkInterfaces'][0]['Association']['PublicIp']
        print(instance_ip)

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Exibindo o comando para acesso remoto via SSH ou AWS SSM")
        print(f"ssh -i \"{key_pair_path}/{key_pair_name}.pem\" {so}@{instance_ip}")
        print(f"aws ssm start-session --target {instance_id}")
else:
    print("Código não executado")




#!/usr/bin/env python3

import boto3
import time

print("***********************************************")
print("SERVIÇO: AWS EC2")
print("INSTANCE EXCLUSION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
tag_name_instance = "ec2Test1"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ")
if resposta.lower() == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe uma instância ativa {tag_name_instance}")
    ec2_client = boto3.client('ec2')
    
    condition = ec2_client.describe_instances(
        Filters=[
            {'Name': 'tag:Name', 'Values': [tag_name_instance]},
            {'Name': 'instance-state-name', 'Values': ['running']}
        ]
    )
    
    if len(condition['Reservations']) > 0:
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de tag de todas as instâncias criadas ativas")
        all_active_instances = ec2_client.describe_instances(
            Filters=[{'Name': 'instance-state-name', 'Values': ['running']}]
        )
        for reservation in all_active_instances['Reservations']:
            for instance in reservation['Instances']:
                print(instance['Tags'][0]['Value'])

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Extraindo o Id da instância {tag_name_instance}")
        instance_id = condition['Reservations'][0]['Instances'][0]['InstanceId']

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo a instância {tag_name_instance}")
        ec2_client.terminate_instances(InstanceIds=[instance_id], DryRun=False)

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Aguardando a instância ser removida")
        instance_state = ""
        while instance_state != "terminated":
            time.sleep(20)
            instance_state = ec2_client.describe_instances(
                InstanceIds=[instance_id]
            )['Reservations'][0]['Instances'][0]['State']['Name']
            print(f"Estado atual da instância: {instance_state}")
        
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de tag de todas as instâncias criadas ativas")
        all_active_instances = ec2_client.describe_instances(
            Filters=[{'Name': 'instance-state-name', 'Values': ['running']}]
        )
        for reservation in all_active_instances['Reservations']:
            for instance in reservation['Instances']:
                print(instance['Tags'][0]['Value'])
    else:
        print(f"Não existe uma instância ativa {tag_name_instance}")
else:
    print("Código não executado")