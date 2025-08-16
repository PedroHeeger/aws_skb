import boto3
import time

print("***********************************************")
print("SERVIÇO: AWS EC2")
print("DOUBLE INSTANCE CREATION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
tag_name_instance = "ec2Test"
instanceA = "1"
instanceB = "2"
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

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ")
if resposta.lower() == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe as instâncias ativas {tag_name_instance}{instanceA} e {tag_name_instance}{instanceB}")
    ec2 = boto3.client('ec2')
    
    filters = [
        {'Name': 'instance-state-name', 'Values': ['running']},
        {'Name': 'tag:Name', 'Values': [f'{tag_name_instance}{instanceA}', f'{tag_name_instance}{instanceB}']}
    ]

    condition = ec2.describe_instances(Filters=filters)
    instances = condition['Reservations']

    if len(instances) > 0:
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Já existe as instâncias ativas {tag_name_instance}{instanceA} e {tag_name_instance}{instanceB}")
        for reservation in instances:
            for instance in reservation['Instances']:
                for tag in instance['Tags']:
                    if tag['Key'] == 'Name':
                        print(tag['Value'])
        
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Listando o IP público das instâncias ativas {tag_name_instance}{instanceA} e {tag_name_instance}{instanceB}")
        for instance in instances:
            for i in instance['Instances']:
                public_ips = i['NetworkInterfaces'][0]['Association'].get('PublicIp', 'N/A')
                print(public_ips)

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Extraindo o Id das instâncias ativas {tag_name_instance}{instanceA} e {tag_name_instance}{instanceB}")
        instance_ids = [i['InstanceId'] for r in instances for i in r['Instances']]
        instance_idA = instance_ids[0]
        instance_idB = instance_ids[1]

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância {tag_name_instance}{instanceA}")
        print(f"ssh -i \"{key_pair_path}/{key_pair_name}.pem\" {so}@{public_ips}")
        print(f"aws ssm start-session --target {instance_idA}")

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância {tag_name_instance}{instanceB}")
        print(f"ssh -i \"{key_pair_path}/{key_pair_name}.pem\" {so}@{public_ips}")
        print(f"aws ssm start-session --target {instance_idB}")

    else:
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de tag de todas as instâncias criadas ativas")
        all_active_instances = ec2.describe_instances(
            Filters=[{'Name': 'instance-state-name', 'Values': ['running']}]
        )
        for reservation in all_active_instances['Reservations']:
            for instance in reservation['Instances']:
                print(instance['Tags'][0]['Value'])

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Extraindo o Id dos elementos de rede")
        security_group = ec2.describe_security_groups(
            Filters=[{'Name': 'group-name', 'Values': [sg_name]}]
        )
        sgId = security_group['SecurityGroups'][0]['GroupId']

        subnet = ec2.describe_subnets(
            Filters=[{'Name': 'availabilityZone', 'Values': [az]}]
        )
        subnetId = subnet['Subnets'][0]['SubnetId']

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando a instância {tag_name_instance}{instanceA}")
        instanceA_data = ec2.run_instances(
            ImageId=image_id,
            InstanceType=instance_type,
            KeyName=key_pair_name,
            SecurityGroupIds=[sgId],
            SubnetId=subnetId,
            UserData=open(user_data_path + user_data_file).read(),
            BlockDeviceMappings=[{
                'DeviceName': device_name,
                'Ebs': {'VolumeSize': volume_size, 'VolumeType': volume_type}
            }],
            TagSpecifications=[{'ResourceType': 'instance', 'Tags': [{'Key': 'Name', 'Value': f'{tag_name_instance}{instanceA}'}]}],
            MinCount=1,
            MaxCount=1
        )
        instance_idA = instanceA_data['Instances'][0]['InstanceId']

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando a instância {tag_name_instance}{instanceB}")
        instanceB_data = ec2.run_instances(
            ImageId=image_id,
            InstanceType=instance_type,
            KeyName=key_pair_name,
            SecurityGroupIds=[sgId],
            SubnetId=subnetId,
            UserData=open(user_data_path + user_data_file).read(),
            BlockDeviceMappings=[{
                'DeviceName': device_name,
                'Ebs': {'VolumeSize': volume_size, 'VolumeType': volume_type}
            }],
            TagSpecifications=[{'ResourceType': 'instance', 'Tags': [{'Key': 'Name', 'Value': f'{tag_name_instance}{instanceB}'}]}],
            MinCount=1,
            MaxCount=1
        )
        instance_idB = instanceB_data['Instances'][0]['InstanceId']

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Aguardando as instâncias criadas entrarem em execução")
        instanceStateA = ''
        instanceStateB = ''

        while instanceStateA != 'running' or instanceStateB != 'running':
            time.sleep(20)
            instanceStateA = ec2.describe_instances(InstanceIds=[instance_idA])['Reservations'][0]['Instances'][0]['State']['Name']
            print(f"Estado atual da instância {tag_name_instance}{instanceA}: {instanceStateA}")
            instanceStateB = ec2.describe_instances(InstanceIds=[instance_idB])['Reservations'][0]['Instances'][0]['State']['Name']
            print(f"Estado atual da instância {tag_name_instance}{instanceB}: {instanceStateB}")

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de tag de todas as instâncias criadas ativas")
        running_instances = ec2.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
        for r in running_instances['Reservations']:
            for i in r['Instances']:
                for tag in i['Tags']:
                    if tag['Key'] == 'Name':
                        print(tag['Value'])

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Listando o IP público das instâncias ativas {tag_name_instance}{instanceA} e {tag_name_instance}{instanceB}")
        publicIpA = ec2.describe_instances(InstanceIds=[instance_idA])['Reservations'][0]['Instances'][0]['NetworkInterfaces'][0]['Association']['PublicIp']
        publicIpB = ec2.describe_instances(InstanceIds=[instance_idB])['Reservations'][0]['Instances'][0]['NetworkInterfaces'][0]['Association']['PublicIp']
        print(publicIpA)
        print(publicIpB)

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância {tag_name_instance}{instanceA}")
        print(f"ssh -i \"{key_pair_path}/{key_pair_name}.pem\" {so}@{publicIpA}")
        print(f"aws ssm start-session --target {instance_idA}")

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Exibindo o comando para acesso remoto via SSH ou AWS SSM na instância {tag_name_instance}{instanceB}")
        print(f"ssh -i \"{key_pair_path}/{key_pair_name}.pem\" {so}@{publicIpB}")
        print(f"aws ssm start-session --target {instance_idB}")
else:
    print("Código não executado")




#!/usr/bin/env python3

import boto3
import time

print("***********************************************")
print("SERVIÇO: AWS EC2")
print("DOUBLE INSTANCE EXCLUSION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
tag_name_instance = "ec2Test"
instanceA = "1"
instanceB = "2"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n): ")
if resposta.lower() == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem instâncias ativas {tag_name_instance}{instanceA} e {tag_name_instance}{instanceB}")
    ec2_client = boto3.client('ec2')
    filters = [
        {'Name': 'instance-state-name', 'Values': ['running']},
        {'Name': 'tag:Name', 'Values': [f'{tag_name_instance}{instanceA}', f'{tag_name_instance}{instanceB}']}
    ]
    
    response = ec2_client.describe_instances(Filters=filters)
    condition = [instance['Tags'][0]['Value'] for reservation in response['Reservations'] for instance in reservation['Instances']]
    
    if len(condition) > 0:
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de tag de todas as instâncias criadas ativas")
        
        all_instances = ec2_client.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
        active_tags = [instance['Tags'][0]['Value'] for reservation in all_instances['Reservations'] for instance in reservation['Instances']]
        print("\n".join(active_tags))

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Extraindo o Id das instâncias ativas {tag_name_instance}{instanceA} e {tag_name_instance}{instanceB}")
        
        instance_idA = None
        instance_idB = None

        for reservation in response['Reservations']:
            for instance in reservation['Instances']:
                tag_name = [tag['Value'] for tag in instance['Tags'] if tag['Key'] == 'Name'][0]
                if tag_name == f"{tag_name_instance}{instanceA}":
                    instance_idA = instance['InstanceId']
                elif tag_name == f"{tag_name_instance}{instanceB}":
                    instance_idB = instance['InstanceId']
        
        print(f"InstanceIdA: {instance_idA}, InstanceIdB: {instance_idB}")

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo as instâncias {tag_name_instance}{instanceA} e {tag_name_instance}{instanceB}")
        ec2_client.terminate_instances(InstanceIds=[instance_idA, instance_idB])

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Aguardando as instâncias serem removidas")
        instanceStateA = ""
        instanceStateB = ""

        while instanceStateA != "terminated" or instanceStateB != "terminated":
            time.sleep(20)
            responseA = ec2_client.describe_instances(InstanceIds=[instance_idA])
            instanceStateA = responseA['Reservations'][0]['Instances'][0]['State']['Name']
            print(f"Estado atual da instância {tag_name_instance}{instanceA}: {instanceStateA}")

            responseB = ec2_client.describe_instances(InstanceIds=[instance_idB])
            instanceStateB = responseB['Reservations'][0]['Instances'][0]['State']['Name']
            print(f"Estado atual da instância {tag_name_instance}{instanceB}: {instanceStateB}")

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de tag de todas as instâncias criadas ativas")
        
        all_instances = ec2_client.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running']}])
        active_tags = [instance['Tags'][0]['Value'] for reservation in all_instances['Reservations'] for instance in reservation['Instances']]
        print("\n".join(active_tags))
    
    else:
        print(f"Não existem instâncias ativas {tag_name_instance}{instanceA} ou {tag_name_instance}{instanceB}")
else:
    print("Código não executado")