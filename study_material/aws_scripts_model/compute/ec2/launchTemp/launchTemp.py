# #!/usr/bin/env python

import base64
import boto3

print("***********************************************")
print("SERVIÇO: AWS EC2")
print("LAUNCH TEMPLATE CREATION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
# launch_temp_type = "Type1"           # launchTemp type 1 (User Data, Instance Profile e SG)
launch_temp_type = "Type2"             # launchTemp type 2 (User Data, VPC, AZ, SG, Tag Name Instance)
launch_temp_name = "launchTempTest1"
# version_number = ""
version_number = 1
version_description = "My version "
ami_id = "ami-0c7217cdde317cfec"  # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-12-07
instance_type = "t2.micro"
key_pair = "keyPairUniversal"
user_data_path = "G:/Meu Drive/4_PROJ/aws_skb/study_material/aws_scripts_model/compute/ec2/userData/httpd"
user_data_file = "udFileDeb.sh"
device_name = "/dev/xvda"
volume_size = 8
volume_type = "gp2"

instance_profile_name = "ecsInstanceRole"
# instance_profile_name = "instanceProfileTest"
# vpc_name = "vpcTest1"
vpc_name = "default"
az1 = "us-east-1a"
sg_name = "default"
tag_name_instance = "ec2Test"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ").lower()
if resposta == 'y':
    ec2_client = boto3.client('ec2')

    def launch_template_type1(launch_temp_name, version_description, version_number, ami_id, instance_type, key_pair,
                              user_data_base64, device_name, volume_size, volume_type, instance_profile_name, sg_name,
                              command_version):
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Extraindo o ID do security group")
        sg_id = ec2_client.describe_security_groups(
            Filters=[{'Name': 'group-name', 'Values': [sg_name]}]
        )['SecurityGroups'][0]['GroupId']

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Extraindo a ARN do instance profile")
        instance_profiles = boto3.client('iam').list_instance_profiles()['InstanceProfiles']
        instance_profile_arn = next((profile['Arn'] for profile in instance_profiles if profile['InstanceProfileName'] == instance_profile_name), None)

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando o launch template (modelo de implantação tipo 1) {launch_temp_name} na versão {version_number}")
        ec2_command = getattr(ec2_client, command_version)
        ec2_command(
            LaunchTemplateName=launch_temp_name,
            VersionDescription=version_description,
            LaunchTemplateData={
                'ImageId': ami_id,
                'InstanceType': instance_type,
                'KeyName': key_pair,
                'UserData': user_data_base64,
                'SecurityGroupIds': [sg_id],
                'IamInstanceProfile': {'Arn': instance_profile_arn},
                'BlockDeviceMappings': [{
                    'DeviceName': device_name,
                    'Ebs': {
                        'VolumeSize': volume_size,
                        'VolumeType': volume_type
                    }
                }]
            }
        )

    def launch_template_type2(launch_temp_name, version_description, version_number, ami_id, instance_type, key_pair,
                              user_data_base64, device_name, volume_size, volume_type, vpc_name, az1, sg_name,
                              tag_name_instance, command_version):
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Verificando se a VPC é a padrão ou não")
        vpc_filter_key = "isDefault" if vpc_name == "default" else "tag:Name"
        vpc_filter_value = "true" if vpc_name == "default" else vpc_name

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Extraindo os IDs dos elementos de rede")
        vpc_id = ec2_client.describe_vpcs(
            Filters=[{'Name': vpc_filter_key, 'Values': [vpc_filter_value]}]
        )['Vpcs'][0]['VpcId']
        
        subnet_id1 = ec2_client.describe_subnets(
            Filters=[
                {'Name': 'availability-zone', 'Values': [az1]},
                {'Name': 'vpc-id', 'Values': [vpc_id]}
            ]
        )['Subnets'][0]['SubnetId']

        sg_id = ec2_client.describe_security_groups(
            Filters=[{'Name': 'group-name', 'Values': [sg_name]}]
        )['SecurityGroups'][0]['GroupId']

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando o launch template (modelo de implantação tipo 2) {launch_temp_name} na versão {version_number}")
        ec2_command = getattr(ec2_client, command_version)
        ec2_command(
            LaunchTemplateName=launch_temp_name,
            VersionDescription=version_description,
            LaunchTemplateData={
                'ImageId': ami_id,
                'InstanceType': instance_type,
                'KeyName': key_pair,
                'UserData': user_data_base64,
                'TagSpecifications': [{
                    'ResourceType': 'instance',
                    'Tags': [{'Key': 'Name', 'Value': tag_name_instance}]
                }],
                'BlockDeviceMappings': [{
                    'DeviceName': device_name,
                    'Ebs': {
                        'VolumeSize': volume_size,
                        'VolumeType': volume_type
                    }
                }],
                'NetworkInterfaces': [{
                    'AssociatePublicIpAddress': True,
                    'DeviceIndex': 0,
                    'SubnetId': subnet_id1,
                    'Groups': [sg_id]
                }]
            }
        )


    def create_launch_template(launch_temp_type, launch_temp_name, version_description, version_number, ami_id,
                               instance_type, key_pair, user_data_path, user_data_file, device_name, volume_size,
                               volume_type, instance_profile_name, vpc_name, az1, sg_name, tag_name_instance,
                               command_version):
        
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando todos os modelos de implantação existentes e sua versão padrão")
        launch_templates = ec2_client.describe_launch_templates()
        for template in launch_templates['LaunchTemplates']:
            print(template['LaunchTemplateName'], template.get('DefaultVersionNumber', 'N/A'))

        if command_version == "create_launch_template_version":
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Listando todas as versões do modelo de implantação {launch_temp_name}")
            template_versions = ec2_client.describe_launch_template_versions(LaunchTemplateName=launch_temp_name)
            for version in template_versions['LaunchTemplateVersions']:
                print(version['LaunchTemplateName'], version['VersionNumber'])

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Definindo a descrição da versão")
        version_description = f"{version_description}{version_number}"

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Codificando o arquivo user data em Base64")
        with open(f"{user_data_path}/{user_data_file}", 'r') as f:
            user_data_base64 = base64.b64encode(f.read().encode('utf-8')).decode('utf-8')

        if launch_temp_type == "Type1":
            launch_template_type1(launch_temp_name, version_description, version_number, ami_id, instance_type, key_pair,
                                  user_data_base64, device_name, volume_size, volume_type, instance_profile_name, sg_name,
                                  command_version)
        elif launch_temp_type == "Type2":
            launch_template_type2(launch_temp_name, version_description, version_number, ami_id, instance_type, key_pair,
                                  user_data_base64, device_name, volume_size, volume_type, vpc_name, az1, sg_name,
                                  tag_name_instance, command_version)

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Listando o modelo de implantação {launch_temp_name} na versão {version_number}")
        template_version = ec2_client.describe_launch_template_versions(
            LaunchTemplateName=launch_temp_name,
            Versions=[str(version_number)]
        )
        for version in template_version['LaunchTemplateVersions']:
            print(version['LaunchTemplateName'], version['VersionNumber']) 

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Definindo a versão {version_number} como a padrão do modelo de implantação {launch_temp_name}")
        ec2_client.modify_launch_template(
            LaunchTemplateName=launch_temp_name,
            DefaultVersion=str(version_number)
        )  




    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o modelo de implantação {launch_temp_name}")
    templates = ec2_client.describe_launch_templates(
        Filters=[{'Name': 'launch-template-name', 'Values': [launch_temp_name]}]
    )['LaunchTemplates']

    if templates:
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Já existe o modelo de implantação {launch_temp_name}")
        response = ec2_client.describe_launch_templates(
            Filters=[{'Name': 'launch-template-name', 'Values': [launch_temp_name]}]
        )
        print(response['LaunchTemplates'][0]['LaunchTemplateName'])


        print("-----//-----//-----//-----//-----//-----//-----")
        resposta = input("Quer implementar uma nova versão? (y/n) ").lower()
        if resposta == 'y':
            if not version_number:
                print("-----//-----//-----//-----//-----//-----//-----")
                print(f"Extraindo a última versão do modelo de implantação {launch_temp_name}")
                response = ec2_client.describe_launch_templates(
                    Filters=[{'Name': 'launch-template-name', 'Values': [launch_temp_name]}]
                )
                
                latest_version = response['LaunchTemplates'][0]['LatestVersionNumber']
                version_number = int(latest_version) + 1
            else:
                print("Utilizando a versão definida nas variáveis. Certifique-se de que esta seja a próxima versão na contagem da AWS.")

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Iniciando a construção do modelo de implantação {launch_temp_name}")
            create_launch_template(launch_temp_type, launch_temp_name, version_description, version_number, ami_id,
                                instance_type, key_pair, user_data_path, user_data_file, device_name, volume_size,
                                volume_type, instance_profile_name, vpc_name, az1, sg_name, tag_name_instance,
                                "create_launch_template_version")
        else:
            print(f"Nenhuma versão do modelo de implantação {launch_temp_name} foi implantada")
    else:
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Definindo a versão como primeira do modelo de implantação {launch_temp_name}")
        version_number = 1

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Iniciando a construção do modelo de implantação {launch_temp_name}")
        create_launch_template(launch_temp_type, launch_temp_name, version_description, version_number, ami_id,
                               instance_type, key_pair, user_data_path, user_data_file, device_name, volume_size,
                               volume_type, instance_profile_name, vpc_name, az1, sg_name, tag_name_instance,
                               "create_launch_template")
else:
    print("Código não executado.")




#!/usr/bin/env python

import boto3

print("***********************************************")
print("SERVIÇO: AWS EC2")
print("LAUNCH TEMPLATE EXCLUSION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
launch_template_name = "launchTempTest1"
version_number = 1

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ").lower()
if resposta == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o modelo de implantação {launch_template_name}")
    ec2_client = boto3.client('ec2')
    response = ec2_client.describe_launch_templates(
        Filters=[
            {
                'Name': 'launch-template-name',
                'Values': [launch_template_name]
            }
        ]
    )

    if len(response['LaunchTemplates']) > 0:
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando todos os modelos de implantação existentes e sua versão padrão")
        response = ec2_client.describe_launch_templates()
        for template in response['LaunchTemplates']:
            print(f"{template['LaunchTemplateName']} - {template['DefaultVersionNumber']}")

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Verificando se existe o modelo de implantação {launch_template_name} na versão {version_number}")
        try: 
            response = ec2_client.describe_launch_template_versions(
                LaunchTemplateName=launch_template_name,
                Versions=[str(version_number)]
            )
        except ec2_client.exceptions.ClientError as e:
            response = []

        if isinstance(response, dict) and 'LaunchTemplateVersions' in response and len(response['LaunchTemplateVersions']) > 0:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Listando todas as versões do modelo de implantação {launch_template_name}")
            response = ec2_client.describe_launch_template_versions(
                LaunchTemplateName=launch_template_name
            )
            for template_version in response['LaunchTemplateVersions']:
                print(f"{template_version['LaunchTemplateName']} - {template_version['VersionNumber']}")

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Extraindo a versão padrão do modelo de implantação {launch_template_name}")
            response = ec2_client.describe_launch_templates(
                Filters=[
                    {
                        'Name': 'launch-template-name',
                        'Values': [launch_template_name]
                    }
                ]
            )
            default_version = response['LaunchTemplates'][0]['DefaultVersionNumber']

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Verificando se a versão escolhida é a versão padrão do modelo de implantação {launch_template_name}")
            if version_number == default_version:
                print("-----//-----//-----//-----//-----//-----//-----")
                print(f"Removendo o modelo de implantação {launch_template_name} por completo")
                ec2_client.delete_launch_template(LaunchTemplateName=launch_template_name)

                print("-----//-----//-----//-----//-----//-----//-----")
                print("Listando todos os modelos de implantação existentes e sua versão padrão")
                response = ec2_client.describe_launch_templates()
                for template in response['LaunchTemplates']:
                    print(f"{template['LaunchTemplateName']} - {template['DefaultVersionNumber']}")
            else:
                print("-----//-----//-----//-----//-----//-----//-----")
                print(f"Removendo o modelo de implantação {launch_template_name} na versão {version_number}")
                ec2_client.delete_launch_template_versions(
                    LaunchTemplateName=launch_template_name,
                    Versions=[str(version_number)]
                )

                print("-----//-----//-----//-----//-----//-----//-----")
                print(f"Listando todas as versões do modelo de implantação {launch_template_name}")
                response = ec2_client.describe_launch_template_versions(
                    LaunchTemplateName=launch_template_name
                )
                for template_version in response['LaunchTemplateVersions']:
                    print(f"{template_version['LaunchTemplateName']} - {template_version['VersionNumber']}")
        else:
            print(f"Não existe o modelo de implantação {launch_template_name} na versão {version_number}")
    else:
        print(f"Não existe o modelo de implantação {launch_template_name}")
else:
    print("Código não executado")