#!/usr/bin/env powershell
import boto3
from botocore.exceptions import ClientError

# region IAM Client:
def create_iam_client(aws_profile, region):
    """Cria e retorna um cliente do boto3."""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Criando o cliente IAM com o profile '{aws_profile}' e região '{region}'")
    try: 
        session = boto3.Session(
            profile_name=aws_profile,
            region_name=region,
        )
        return session.client("iam")
    except Exception as e:
        print(f"Erro inesperado ao criar o cliente IAM: {e}")
# client = create_iam_client(aws_profile, region)

# endregion


# region IAM User:
def test_iam_user_exists(iam_client, user_name):
    """Verifica se existe um usuário no IAM com o nome especificado."""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o usuário do IAM {user_name}")
    try:
        iam_client.get_user(UserName=user_name)
        return user_name
    except ClientError as e:
        if e.response["Error"]["Code"] == "NoSuchEntity":
            return ""
        raise
# test_iam_user_exists(iam_client, iam_user_config["user_name"])


def show_iam_user_name(iam_client, user_name: str):
    """Exibe o nome do usuário IAM especificado"""
    
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe um usuário do IAM {user_name}")
    try:
        paginator = iam_client.get_paginator('list_users')
        for page in paginator.paginate():
            for user in page['Users']:
                if user['UserName'] == user_name:
                    print(user['UserName'])
    except ClientError as e:
        print(f"Erro ao buscar usuário no IAM: {e}")
# show_iam_user_name(user_name=iam_user_config["user_name"])


def show_iam_users_all(iam_client):
    """Lista o UserName de todos os usuários IAM criados"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Listando todos os usuários do IAM criados")
    try:
        paginator = iam_client.get_paginator('list_users')
        for page in paginator.paginate():
            for user in page['Users']:
                print(user['UserName'])   
    except ClientError as e:
        print(f"Erro ao listar todos os usuários do IAM: {e}")
# users_list = show_iam_users_all()


def new_iam_user(iam_client, user_name: str, tag_key: str, tag_value: str):
    """Cria um novo usuário no IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Criando o usuário do IAM {user_name}")
    try:
        iam_client.create_user(
            UserName=user_name,
            Tags=[{"Key": tag_key, "Value": tag_value}]
        )
    except ClientError as e:
        print(f"Erro ao criar o usuário do IAM {user_name}: {e}")
# new_iam_user(iam_client=iam_client, user_name=iam_user_config["user_name"], tag_key=iam_user_config["tag_key"], tag_value=iam_user_config["tag_value"])


def new_iam_login_profile(iam_client, user_name: str, user_password: str):
    """Cria um perfil de login (acesso ao console) para o usuário especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Criando um perfil de login do usuário do IAM {user_name}")
    try:
        iam_client.create_login_profile(
            UserName=user_name,
            Password=user_password,
            PasswordResetRequired=False  # Define se o usuário precisa trocar a senha no primeiro acesso
        )
    except ClientError as e:
        print(f"Erro ao criar perfil de login para o usuário {user_name}: {e}")
# new_iam_login_profile(iam_client=iam_client, user_name=iam_user_config["user_name"], user_password=iam_user_config["user_password"])


def get_iam_user_name(iam_client, user_name: str):
    """Extrai o nome de um usuário IAM específico"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando o usuário do IAM {user_name}")
    try:
        paginator = iam_client.get_paginator('list_users')
        for page in paginator.paginate():
            for user in page['Users']:
                if user['UserName'] == user_name:
                    print(user['UserName'])        
    except ClientError as e:
        print(f"Erro ao buscar o usuário do IAM {user_name}: {e}")
# get_iam_user_name(iam_client=iam_client, user_name=iam_user_config["user_name"])


def remove_iam_user_groups_all(iam_client, user_name: str):
    """Verifica os grupos do usuário e o remove de cada um deles"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando quais grupos o usuário do IAM {user_name} está inserido")
    try:
        response = iam_client.list_groups_for_user(UserName=user_name)
        groups_list = response.get('Groups', [])
        if groups_list:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando os grupos do usuário do IAM {user_name} em uma lista")
            groups = [group['GroupName'] for group in groups_list]
            
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo o usuário do IAM {user_name} dos grupos")
            for iam_group_name in groups:
                iam_client.remove_user_from_group(
                    GroupName=iam_group_name,
                    UserName=user_name
                )  
        else:
            print(f"Não existem grupos que o usuário do IAM {user_name} faça parte")     
    except ClientError as e:
        print(f"Erro ao processar remoção de grupos do usuário {user_name}: {e}")
# remove_iam_user_groups_all(iam_client=iam_client, user_name=iam_user_config["user_name"])


def disconnect_iam_user_policies_all(iam_client, user_name: str):
    """Verifica as managed e inline policies do usuário e as remove"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem managed policies vinculadas ao usuário do IAM {user_name}")
    try:
        response = iam_client.list_attached_user_policies(UserName=user_name)
        attached_policies = response.get('AttachedPolicies', [])
        if attached_policies:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando as managed policies do usuário do IAM {user_name} em uma lista")
            policies = [{"name": p["PolicyName"], "arn": p["PolicyArn"]} for p in attached_policies]
            
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo as managed policies do usuário do IAM {user_name}")
            for policy in policies:
                iam_client.detach_user_policy(
                    UserName=user_name,
                    PolicyArn=policy["arn"]
                )
        else:
            print(f"Não existem managed policies vinculadas ao usuário do IAM {user_name}")

        response_inline = iam_client.list_user_policies(UserName=user_name)
        inline_policies = response_inline.get('PolicyNames', [])
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Verificando se existem inline policies vinculadas ao usuário do IAM {user_name}")
        if inline_policies:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando as inline policies do usuário do IAM {user_name} em uma lista")

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo as inline policies do usuário do IAM {user_name}")
            for policy_name in inline_policies:
                iam_client.delete_user_policy(
                    UserName=user_name,
                    PolicyName=policy_name
                )
        else:
            print(f"Não existem inline policies vinculadas ao usuário do IAM {user_name}")
    except ClientError as e:
        print(f"Erro ao processar desvinculação de políticas do usuário {user_name}: {e}")
# disconnect_iam_user_policies_all(iam_client=iam_client, user_name=iam_user_config["user_name"])


def remove_iam_user_mfa_all(iam_client, user_name: str):
    """Verifica os dispositivos MFA do usuário e os desativa se existirem"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem dispositivos MFA associados ao usuário do IAM {user_name}")
    try:
        response = iam_client.list_mfa_devices(UserName=user_name)
        mfa_devices = response.get('MFADevices', [])
        if mfa_devices:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando os dispositivos MFA do usuário do IAM {user_name} em uma lista")
            serial_numbers = [device['SerialNumber'] for device in mfa_devices]

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Desativando os dispositivos MFA do usuário do IAM {user_name}")
            for serial_number in serial_numbers:
                iam_client.deactivate_mfa_device(UserName=user_name, SerialNumber=serial_number)
        else:
            print(f"Não existem dispositivos MFA associados ao usuário do IAM {user_name}")
    except ClientError as e:
        print(f"Erro ao desativar os dispositivos MFA do usuário {user_name}: {e}")
# remove_iam_user_mfa_all(iam_client=iam_client, user_name=iam_user_config["user_name"])


def remove_iam_user_key_accesses_all(iam_client, user_name: str, key_access_path: str, key_access_file: str):
    """Verifica as chaves de acesso do usuário, as remove da AWS e apaga o arquivo local se existir"""

    import os
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem chaves de acesso para o usuário do IAM {user_name}")
    try:
        response = iam_client.list_access_keys(UserName=user_name)
        keys = response.get('AccessKeyMetadata', [])
        if keys:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando as chaves de acesso do usuário do IAM {user_name} em uma lista")
            key_access_ids = [key['AccessKeyId'] for key in keys]

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo as chaves de acesso do usuário do IAM {user_name}")
            for key_access_id in key_access_ids:
                iam_client.delete_access_key(UserName=user_name, AccessKeyId=key_access_id)

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Verificando se existe o arquivo de chave de acesso {key_access_file}")
            file_path = os.path.join(key_access_path, key_access_file)
            if os.path.isfile(file_path):
                print("-----//-----//-----//-----//-----//-----//-----")
                print(f"Removendo o arquivo de chave de acesso {key_access_file}")
                os.remove(file_path)
            else:
                print(f"Não existe o arquivo de chave de acesso {key_access_file}")
        else:
            print(f"Não existem chaves de acesso para o usuário do IAM {user_name}")
    except ClientError as e:
        print(f"Erro ao remover as chaves de acesso do usuário {user_name}: {e}")
# remove_iam_user_key_accesses_all(iam_client=iam_client, user_name=iam_user_config["user_name"], key_access_path=iam_user_key_access_config["key_access_path"], key_access_file=iam_user_key_access_config["key_access_file"])


def remove_iam_login_profile(iam_client, user_name: str):
    """Verifica se existe o perfil de login do usuário e o remove se existir"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o perfil de login do usuário do IAM {user_name}")
    try:
        iam_client.get_login_profile(UserName=user_name)
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo o perfil de login do usuário do IAM {user_name}")
        iam_client.delete_login_profile(UserName=user_name)
    except ClientError as e:
        if e.response['Error']['Code'] == 'NoSuchEntity':
            print(f"Não existe perfil de login para o usuário do IAM {user_name}")
        else:
            print(f"Erro ao remover perfil de login do usuário {user_name}: {e}")
# remove_iam_login_profile(iam_client=iam_client, user_name=iam_user_config["user_name"])


def remove_iam_user(iam_client, user_name: str):
    """Remove definitivamente o usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo o usuário do IAM {user_name}")
    try:
        iam_client.delete_user(UserName=user_name)
    except ClientError as e:
        print(f"Erro ao deletar o usuário do IAM {user_name}: {e}")
# remove_iam_user(iam_client=iam_client, user_name=iam_user_config["user_name"])




# endregion
# region IAM Group:
def test_iam_group_exists(iam_client, group_name: str):
    """Verifica se existe um grupo no IAM com o nome especificado."""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o grupo do IAM {group_name}")
    try:
        iam_client.get_group(GroupName=group_name)
        return group_name
    except ClientError as e:
        if e.response["Error"]["Code"] == "NoSuchEntity":
            return ""
        raise
# group_found = test_iam_group_exists(iam_client, iam_group_config["group_name"])


def show_iam_group_name(iam_client, group_name: str):
    """Exibe o nome do grupo IAM especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe um grupo do IAM {group_name}")
    try:
        paginator = iam_client.get_paginator('list_groups')
        for page in paginator.paginate():
            for group in page['Groups']:
                if group['GroupName'] == group_name:
                    print(group['GroupName'])
    except ClientError as e:
        print(f"Erro ao buscar grupo no IAM: {e}")
# show_iam_group_name(iam_client, iam_group_config["group_name"])


def show_iam_groups_all(iam_client):
    """Lista o GroupName de todos os grupos IAM criados"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Listando todos os grupos do IAM criados")
    try:
        paginator = iam_client.get_paginator('list_groups')
        for page in paginator.paginate():
            for group in page['Groups']:
                print(group['GroupName'])
    except ClientError as e:
        print(f"Erro ao listar todos os grupos do IAM: {e}")
# show_iam_groups_all(iam_client)


def new_iam_group(iam_client, group_name: str):
    """Cria um novo grupo no IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Criando o grupo do IAM {group_name}")
    try:
        iam_client.create_group(GroupName=group_name)
    except ClientError as e:
        print(f"Erro ao criar o grupo do IAM {group_name}: {e}")
# new_iam_group(iam_client=iam_client, group_name=iam_group_config["group_name"])


def get_iam_group_name(iam_client, group_name: str):
    """Extrai o nome de um grupo IAM específico"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando o grupo do IAM {group_name}")
    try:
        paginator = iam_client.get_paginator('list_groups')
        for page in paginator.paginate():
            for group in page['Groups']:
                if group['GroupName'] == group_name:
                    print(group['GroupName'])
    except ClientError as e:
        print(f"Erro ao buscar o grupo do IAM {group_name}: {e}")
# get_iam_group_name(iam_client=iam_client, group_name=iam_group_config["group_name"])


def remove_iam_group_users_all(iam_client, group_name: str):
    """Verifica os usuários do grupo e os remove"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem usuários do IAM no grupo {group_name}")
    try:
        response = iam_client.get_group(GroupName=group_name)
        users_list = response.get('Users', [])
        if users_list:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando os usuários do grupo {group_name} em uma lista")
            users = [user['UserName'] for user in users_list]

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo os usuários do grupo {group_name}")
            for user_name in users:
                iam_client.remove_user_from_group(
                    GroupName=group_name,
                    UserName=user_name
                )
        else:
            print(f"Não existem usuários do IAM no grupo {group_name}")
    except ClientError as e:
        print(f"Erro ao processar remoção de usuários do grupo {group_name}: {e}")
# remove_iam_group_users_all(iam_client=iam_client, group_name=iam_group_config["group_name"])


def disconnect_iam_group_policies_all(iam_client, group_name: str):
    """Verifica as managed e inline policies do grupo e as remove"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem managed policies no grupo {group_name}")
    try:
        response = iam_client.list_attached_group_policies(GroupName=group_name)
        attached_policies = response.get('AttachedPolicies', [])
        if attached_policies:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando as managed policies do grupo {group_name} em uma lista")
            policies = [{"name": p["PolicyName"], "arn": p["PolicyArn"]} for p in attached_policies]

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo as managed policies do grupo {group_name}")
            for policy in policies:
                iam_client.detach_group_policy(
                    GroupName=group_name,
                    PolicyArn=policy["arn"]
                )
        else:
            print(f"Não existem managed policies no grupo {group_name}")

        response_inline = iam_client.list_group_policies(GroupName=group_name)
        inline_policies = response_inline.get('PolicyNames', [])
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Verificando se existem inline policies no grupo {group_name}")
        if inline_policies:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando as inline policies do grupo {group_name} em uma lista")

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo as inline policies do grupo {group_name}")
            for policy_name in inline_policies:
                iam_client.delete_group_policy(
                    GroupName=group_name,
                    PolicyName=policy_name
                )
        else:
            print(f"Não existem inline policies no grupo {group_name}")
    except ClientError as e:
        print(f"Erro ao processar desvinculação de políticas do grupo {group_name}: {e}")
# disconnect_iam_group_policies_all(iam_client=iam_client, group_name=iam_group_config["group_name"])


def remove_iam_group(iam_client, group_name: str):
    """Remove definitivamente o grupo do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo o grupo {group_name}")
    try:
        iam_client.delete_group(GroupName=group_name)
    except ClientError as e:
        print(f"Erro ao deletar o grupo do IAM {group_name}: {e}")
# remove_iam_group(iam_client=iam_client, group_name=iam_group_config["group_name"])




# endregion
# region IAM Role:
def test_iam_role_exists(iam_client, role_name: str):
    """Verifica se existe uma role no IAM com o nome especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe a role do IAM {role_name}")
    try:
        iam_client.get_role(RoleName=role_name)
        return role_name
    except ClientError as e:
        if e.response["Error"]["Code"] == "NoSuchEntity":
            return ""
        raise
# role_found = test_iam_role_exists(iam_client=iam_client, role_name=iam_role_config["role_name"])


def show_iam_role_name(iam_client, role_name: str):
    """Exibe o nome da role IAM especificada"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe uma role do IAM {role_name}")
    try:
        paginator = iam_client.get_paginator('list_roles')
        for page in paginator.paginate():
            for role in page['Roles']:
                if role['RoleName'] == role_name:
                    print(role['RoleName'])
    except ClientError as e:
        print(f"Erro ao buscar role no IAM: {e}")
# show_iam_role_name(iam_client=iam_client, role_name=iam_role_config["role_name"])


def show_iam_roles_all(iam_client):
    """Lista o RoleName de todas as roles IAM criadas"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Listando todas as roles do IAM criadas")
    try:
        paginator = iam_client.get_paginator('list_roles')
        for page in paginator.paginate():
            for role in page['Roles']:
                print(role['RoleName'])
    except ClientError as e:
        print(f"Erro ao listar todas as roles do IAM: {e}")
# show_iam_roles_all(iam_client=iam_client)


def new_iam_role(iam_client, role_name: str, role_description: str, tag_key: str, tag_value: str,
                trust_policy_file: str = "", trust_policy_document: str = ""):
    """Cria uma nova role no IAM via arquivo ou string de trust policy"""

    import json
    try:
        if trust_policy_file:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Criando a role do IAM {role_name} via arquivo {trust_policy_file}")
            with open(trust_policy_file, "r") as f:
                trust_policy = f.read()
        elif trust_policy_document:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Criando a role do IAM {role_name} via string")
            trust_policy = trust_policy_document
        else:
            raise ValueError("É necessário informar 'trust_policy_file' ou 'trust_policy_document'.")
        iam_client.create_role(
            RoleName=role_name,
            AssumeRolePolicyDocument=trust_policy,
            Description=role_description,
            Tags=[{"Key": tag_key, "Value": tag_value}]
        )
    except ClientError as e:
        print(f"Erro ao criar a role do IAM {role_name}: {e}")
# new_iam_role(iam_client=iam_client, role_name=iam_role_config["role_name"], role_description=iam_role_config["role_description"], trust_policy_file=iam_role_config["trust_policy_file"], trust_policy_document=iam_role_config["trust_policy_document"], tag_key=iam_role_config["tag_key"], tag_value=iam_role_config["tag_value"])


def get_iam_role_name(iam_client, role_name: str):
    """Extrai o nome de uma role IAM específica"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando a role do IAM {role_name}")
    try:
        paginator = iam_client.get_paginator('list_roles')
        for page in paginator.paginate():
            for role in page['Roles']:
                if role['RoleName'] == role_name:
                    print(role['RoleName'])
    except ClientError as e:
        print(f"Erro ao buscar a role do IAM {role_name}: {e}")
# get_iam_role_name(iam_client=iam_client, role_name=iam_role_config["role_name"])


def disconnect_iam_role_instance_profiles_all(iam_client, role_name: str):
    """Verifica se a role está vinculada a algum instance profile e a remove de todos"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se a role {role_name} está vinculada a algum instance profile")
    try:
        response = iam_client.list_instance_profiles_for_role(RoleName=role_name)
        inst_profiles = response.get('InstanceProfiles', [])
        if inst_profiles:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando os instance profiles da role {role_name} em uma lista")
            inst_profile_names = [p['InstanceProfileName'] for p in inst_profiles]

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo a role {role_name} dos instance profiles")
            for inst_prof_name in inst_profile_names:
                iam_client.remove_role_from_instance_profile(
                    InstanceProfileName=inst_prof_name,
                    RoleName=role_name
                )
        else:
            print(f"A role {role_name} não está vinculada a nenhum instance profile")
    except ClientError as e:
        print(f"Erro ao remover a role {role_name} dos instance profiles: {e}")
# disconnect_iam_role_instance_profiles_all(iam_client=iam_client, role_name=iam_role_config["role_name"])


def disconnect_iam_role_policies_all(iam_client, role_name: str):
    """Verifica as managed e inline policies da role e as remove"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem managed policies na role {role_name}")
    try:
        response = iam_client.list_attached_role_policies(RoleName=role_name)
        attached_policies = response.get('AttachedPolicies', [])
        if attached_policies:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando as managed policies da role {role_name} em uma lista")
            policies = [{"name": p["PolicyName"], "arn": p["PolicyArn"]} for p in attached_policies]

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo as managed policies da role {role_name}")
            for policy in policies:
                iam_client.detach_role_policy(
                    RoleName=role_name,
                    PolicyArn=policy["arn"]
                )
        else:
            print(f"Não existem managed policies na role {role_name}")

        response_inline = iam_client.list_role_policies(RoleName=role_name)
        inline_policies = response_inline.get('PolicyNames', [])
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Verificando se existem inline policies na role {role_name}")
        if inline_policies:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando as inline policies da role {role_name} em uma lista")

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo as inline policies da role {role_name}")
            for policy_name in inline_policies:
                iam_client.delete_role_policy(
                    RoleName=role_name,
                    PolicyName=policy_name
                )
        else:
            print(f"Não existem inline policies na role {role_name}")
    except ClientError as e:
        print(f"Erro ao processar desvinculação de políticas da role {role_name}: {e}")
# disconnect_iam_role_policies_all(iam_client=iam_client, role_name=iam_role_config["role_name"])


def remove_iam_role(iam_client, role_name: str):
    """Remove definitivamente a role do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo a role {role_name}")
    try:
        iam_client.delete_role(RoleName=role_name)
    except ClientError as e:
        print(f"Erro ao deletar a role do IAM {role_name}: {e}")
# remove_iam_role(iam_client=iam_client, role_name=iam_role_config["role_name"])


def get_iam_role_arn(iam_client, role_name: str):
    """Extrai a ARN de uma role do IAM específica"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Extraindo a ARN da role {role_name}")
    try:
        paginator = iam_client.get_paginator('list_roles')
        for page in paginator.paginate():
            for role in page['Roles']:
                if role['RoleName'] == role_name:
                    return role['Arn']
    except ClientError as e:
        print(f"Erro ao buscar a ARN da role {role_name}: {e}")
    return ""
# role_arn = get_iam_role_arn(iam_client=iam_client, role_name=iam_role_config["role_name"])




# endregion
# region IAM Instance Profile:
def test_instance_profile_exists(iam_client, inst_prof_name: str):
    """Verifica se existe um instance profile com o nome especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o instance profile {inst_prof_name}")
    try:
        paginator = iam_client.get_paginator('list_instance_profiles')
        for page in paginator.paginate():
            for profile in page['InstanceProfiles']:
                if profile['InstanceProfileName'] == inst_prof_name:
                    return inst_prof_name
        return ""
    except ClientError as e:
        print(f"Erro ao verificar o instance profile {inst_prof_name}: {e}")
        return ""
# inst_prof_found = test_instance_profile_exists(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])


def show_instance_profile_name(iam_client, inst_prof_name: str):
    """Exibe o nome do instance profile especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe um instance profile {inst_prof_name}")
    try:
        paginator = iam_client.get_paginator('list_instance_profiles')
        for page in paginator.paginate():
            for profile in page['InstanceProfiles']:
                if profile['InstanceProfileName'] == inst_prof_name:
                    print(profile['InstanceProfileName'])
    except ClientError as e:
        print(f"Erro ao exibir o instance profile {inst_prof_name}: {e}")
# show_instance_profile_name(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])


def show_instance_profiles_all(iam_client):
    """Lista o InstanceProfileName de todos os instance profiles criados"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Listando todos os instance profiles criados")
    try:
        paginator = iam_client.get_paginator('list_instance_profiles')
        for page in paginator.paginate():
            for profile in page['InstanceProfiles']:
                print(profile['InstanceProfileName'])
    except ClientError as e:
        print(f"Erro ao listar os instance profiles: {e}")
# show_instance_profiles_all(iam_client=iam_client)


def new_instance_profile(iam_client, inst_prof_name: str, tag_key: str, tag_value: str):
    """Cria um novo instance profile no IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Criando o instance profile {inst_prof_name}")
    try:
        iam_client.create_instance_profile(
            InstanceProfileName=inst_prof_name,
            Tags=[{"Key": tag_key, "Value": tag_value}]
        )
    except ClientError as e:
        print(f"Erro ao criar o instance profile {inst_prof_name}: {e}")
# new_instance_profile(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], tag_key=inst_prof_config["tag_key"], tag_value=inst_prof_config["tag_value"])


def get_instance_profile_name(iam_client, inst_prof_name: str):
    """Extrai o nome de um instance profile específico"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando o instance profile {inst_prof_name}")
    try:
        paginator = iam_client.get_paginator('list_instance_profiles')
        for page in paginator.paginate():
            for profile in page['InstanceProfiles']:
                if profile['InstanceProfileName'] == inst_prof_name:
                    print(profile['InstanceProfileName'])
    except ClientError as e:
        print(f"Erro ao obter o nome do instance profile {inst_prof_name}: {e}")
# get_instance_profile_name(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])


def disconnect_instance_profile_role(iam_client, inst_prof_name: str):
    """Verifica a role do perfil de instância e a remove"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem roles no instance profile {inst_prof_name}")
    try:
        response = iam_client.get_instance_profile(InstanceProfileName=inst_prof_name)
        roles = [role['RoleName'] for role in response['InstanceProfile'].get('Roles', [])]
        if roles:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando as roles do instance profile {inst_prof_name} em uma lista")
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo as roles do instance profile {inst_prof_name}")
            for role_name in roles:
                iam_client.remove_role_from_instance_profile(
                    InstanceProfileName=inst_prof_name,
                    RoleName=role_name
                )
        else:
            print(f"Não existem roles no instance profile {inst_prof_name}")
    except ClientError as e:
        print(f"Erro ao desanexar roles do instance profile {inst_prof_name}: {e}")
# disconnect_instance_profile_role(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])


def remove_instance_profile(iam_client, inst_prof_name: str):
    """Remove definitivamente o instance profile do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo o instance profile {inst_prof_name}")
    try:
        iam_client.delete_instance_profile(InstanceProfileName=inst_prof_name)
    except ClientError as e:
        print(f"Erro ao remover o instance profile {inst_prof_name}: {e}")
# remove_instance_profile(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])


def get_instance_profile_arn(iam_client, inst_prof_name: str):
    """Extrai a ARN do instance profile"""
    
    print("-----//-----//-----//-----//-----//-----//-----")
    print("Extraindo a ARN do instance profile")
    try:
        paginator = iam_client.get_paginator('list_instance_profiles')
        for page in paginator.paginate():
            for profile in page['InstanceProfiles']:
                if profile['InstanceProfileName'] == inst_prof_name:
                    return profile['Arn']            
    except ClientError as e:
        print(f"Erro ao buscar o instance profile {inst_prof_name}: {e}")
    return ""
# inst_prof_arn = get_instance_profile_arn(iam_client=iam_client, inst_prof_name=config["inst_prof_name"])




# endregion
# region IAM Policy:
def test_iam_policy_exists(iam_client, policy_name: str):
    """Verifica se existe uma policy no IAM com o nome especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe a policy do IAM {policy_name}")
    try:
        paginator = iam_client.get_paginator('list_policies')
        for page in paginator.paginate(Scope='Local'):
            for policy in page['Policies']:
                if policy['PolicyName'] == policy_name:
                    return policy_name
        return ""
    except ClientError as e:
        print(f"Erro ao verificar a policy do IAM {policy_name}: {e}")
        return ""
# policy_found = test_iam_policy_exists(iam_client=iam_client, policy_name=iam_policy_config["policy_name"])


def show_iam_policy_name(iam_client, policy_name: str):
    """Exibe o nome da policy IAM especificada"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe uma policy do IAM {policy_name}")
    try:
        paginator = iam_client.get_paginator('list_policies')
        for page in paginator.paginate(Scope='Local'):
            for policy in page['Policies']:
                if policy['PolicyName'] == policy_name:
                    print(policy['PolicyName'])
    except ClientError as e:
        print(f"Erro ao buscar policy no IAM: {e}")
# show_iam_policy_name(iam_client=iam_client, policy_name=iam_policy_config["policy_name"])


def show_iam_policies_all(iam_client):
    """Lista o PolicyName de todas as policies IAM criadas pelo cliente"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Listando todas as policies do IAM criadas")
    try:
        paginator = iam_client.get_paginator('list_policies')
        for page in paginator.paginate(Scope='Local'):
            for policy in page['Policies']:
                print(policy['PolicyName'])
    except ClientError as e:
        print(f"Erro ao listar todas as policies do IAM: {e}")
# show_iam_policies_all(iam_client=iam_client)


def new_iam_policy(iam_client, policy_name: str, policy_description: str, tag_key: str, tag_value: str,
                policy_file: str = "", policy_document: str = ""):
    """Cria uma nova policy no IAM"""

    try:
        if policy_file:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Criando a policy do IAM {policy_name} via arquivo")
            with open(policy_file, "r") as f:
                policy_doc = f.read()
        elif policy_document:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Criando a policy do IAM {policy_name} via string")
            policy_doc = policy_document
        else:
            raise ValueError("É necessário informar 'policy_file' ou 'policy_document'.")
        iam_client.create_policy(
            PolicyName=policy_name,
            PolicyDocument=policy_doc,
            Description=policy_description,
            Tags=[{"Key": tag_key, "Value": tag_value}]
        )
    except ClientError as e:
        print(f"Erro ao criar a policy do IAM {policy_name}: {e}")
# new_iam_policy(iam_client=iam_client, policy_name=iam_policy_config["policy_name"], policy_description=iam_policy_config["policy_description"], policy_file=iam_policy_config["policy_file"], policy_document=iam_policy_config["policy_document"], tag_key=iam_policy_config["tag_key"], tag_value=iam_policy_config["tag_value"])


def get_iam_policy_name(iam_client, policy_name: str):
    """Extrai o nome de uma policy IAM específica"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando a policy do IAM {policy_name}")
    try:
        paginator = iam_client.get_paginator('list_policies')
        for page in paginator.paginate(Scope='Local'):
            for policy in page['Policies']:
                if policy['PolicyName'] == policy_name:
                    print(policy['PolicyName'])
    except ClientError as e:
        print(f"Erro ao buscar a policy do IAM {policy_name}: {e}")
# get_iam_policy_name(iam_client=iam_client, policy_name=iam_policy_config["policy_name"])


def get_iam_policy_arn(iam_client, policy_name: str):
    """Extrai o ARN de uma policy do IAM específica"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Extraindo o ARN da policy {policy_name}")
    try:
        paginator = iam_client.get_paginator('list_policies')
        for page in paginator.paginate():
            for policy in page['Policies']:
                if policy['PolicyName'] == policy_name:
                    return policy['Arn']
    except ClientError as e:
        print(f"Erro ao buscar o ARN da policy {policy_name}: {e}")
    return ""
# policy_arn = get_iam_policy_arn(iam_client=iam_client, policy_name=iam_policy_config["policy_name"])

def disconnect_iam_policy_users(iam_client, policy_name: str, policy_arn: str):
    """Verifica os usuários que possuem a managed policy anexada e a remove de cada um deles"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem usuários com a policy {policy_name} anexada")
    try:
        response = iam_client.list_entities_for_policy(PolicyArn=policy_arn, EntityFilter='User')
        users = [u['UserName'] for u in response.get('PolicyUsers', [])]
        if users:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando os usuários com a policy {policy_name} em uma lista")
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo a policy {policy_name} dos usuários")
            for user_name in users:
                iam_client.detach_user_policy(UserName=user_name, PolicyArn=policy_arn)
        else:
            print(f"Não existem usuários com a policy {policy_name} anexada")
    except ClientError as e:
        print(f"Erro ao remover a policy {policy_name} dos usuários: {e}")
# disconnect_iam_policy_users(iam_client=iam_client, policy_name=iam_policy_config["policy_name"], policy_arn=policy_arn)


def disconnect_iam_policy_groups(iam_client, policy_name: str, policy_arn: str):
    """Verifica os grupos que possuem a managed policy anexada e a remove de cada um deles"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem grupos com a policy {policy_name} anexada")
    try:
        response = iam_client.list_entities_for_policy(PolicyArn=policy_arn, EntityFilter='Group')
        groups = [g['GroupName'] for g in response.get('PolicyGroups', [])]
        if groups:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando os grupos com a policy {policy_name} em uma lista")
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo a policy {policy_name} dos grupos")
            for group_name in groups:
                iam_client.detach_group_policy(GroupName=group_name, PolicyArn=policy_arn)
        else:
            print(f"Não existem grupos com a policy {policy_name} anexada")
    except ClientError as e:
        print(f"Erro ao remover a policy {policy_name} dos grupos: {e}")
# disconnect_iam_policy_groups(iam_client=iam_client, policy_name=iam_policy_config["policy_name"], policy_arn=policy_arn)


def disconnect_iam_policy_roles(iam_client, policy_name: str, policy_arn: str):
    """Verifica as roles que possuem a managed policy anexada e a remove de cada uma delas"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existem roles com a policy {policy_name} anexada")
    try:
        response = iam_client.list_entities_for_policy(PolicyArn=policy_arn, EntityFilter='Role')
        roles = [r['RoleName'] for r in response.get('PolicyRoles', [])]
        if roles:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Separando as roles com a policy {policy_name} em uma lista")
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo a policy {policy_name} das roles")
            for role_name in roles:
                iam_client.detach_role_policy(RoleName=role_name, PolicyArn=policy_arn)
        else:
            print(f"Não existem roles com a policy {policy_name} anexada")
    except ClientError as e:
        print(f"Erro ao remover a policy {policy_name} das roles: {e}")
# disconnect_iam_policy_roles(iam_client=iam_client, policy_name=iam_policy_config["policy_name"], policy_arn=policy_arn)

def remove_iam_policy(iam_client, policy_arn: str):
    """Remove definitivamente a policy do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo a policy {policy_arn}")
    try:
        iam_client.delete_policy(PolicyArn=policy_arn)
    except ClientError as e:
        print(f"Erro ao deletar a policy {policy_arn}: {e}")
# remove_iam_policy(iam_client=iam_client, policy_arn=policy_arn)




# endregion
# region IAM MFA Device:
def test_iam_mfa_device_exists(iam_client, device_name: str):
    """Verifica se existe um dispositivo MFA com o nome especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe um dispositivo MFA com o nome {device_name}")
    try:
        response = iam_client.list_virtual_mfa_devices()
        for device in response.get('VirtualMFADevices', []):
            if device_name in device['SerialNumber']:
                return device_name
        return ""
    except ClientError as e:
        print(f"Erro ao verificar o dispositivo MFA {device_name}: {e}")
        return ""
# condition = test_iam_mfa_device_exists(iam_client=iam_client, device_name=iam_mfa_device_config["device_name"])


def show_iam_mfa_device_name(iam_client, device_name: str):
    """Exibe o nome do dispositivo MFA especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe um dispositivo MFA com o nome {device_name}")
    try:
        response = iam_client.list_virtual_mfa_devices()
        for device in response.get('VirtualMFADevices', []):
            if device_name in device['SerialNumber']:
                name = device['SerialNumber'].split("mfa/", 1)[-1]
                print(name)
    except ClientError as e:
        print(f"Erro ao exibir o dispositivo MFA {device_name}: {e}")
# show_iam_mfa_device_name(iam_client=iam_client, device_name=iam_mfa_device_config["device_name"])


def show_iam_mfa_devices_all(iam_client):
    """Lista o DeviceName de todos os dispositivos MFA criados"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Listando todos os dispositivos MFA criados")
    try:
        response = iam_client.list_virtual_mfa_devices()
        for device in response.get('VirtualMFADevices', []):
            name = device['SerialNumber'].split("mfa/", 1)[-1]
            print(name)
    except ClientError as e:
        print(f"Erro ao listar os dispositivos MFA: {e}")
# show_iam_mfa_devices_all(iam_client=iam_client)


def new_iam_mfa_device(iam_client, device_name: str, mfa_path: str, mfa_file: str, tag_key: str, tag_value: str):
    """Cria um dispositivo MFA virtual e salva o QRCode em arquivo"""

    import os, pyotp, qrcode as qr
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Criando um dispositivo MFA virtual {device_name}")
    try:
        response = iam_client.create_virtual_mfa_device(VirtualMFADeviceName=device_name, Tags=[{'Key': tag_key, 'Value': tag_value}])
        base32_seed = response['VirtualMFADevice']['Base32StringSeed']

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Gerando o QRCode e salvando na pasta")
        totp = pyotp.TOTP(base32_seed)
        uri = totp.provisioning_uri(name=device_name, issuer_name="AWS")
        img = qr.make(uri)
        os.makedirs(mfa_path, exist_ok=True)
        img.save(os.path.join(mfa_path, mfa_file))
        print(f"QRCode salvo em {os.path.join(mfa_path, mfa_file)}")
        return response['VirtualMFADevice']['SerialNumber']
    except ClientError as e:
        print(f"Erro ao criar dispositivo MFA {device_name}: {e}")
        return ""
# device_serial = new_iam_mfa_device(iam_client=iam_client, device_name=iam_mfa_device_config["device_name"], mfa_path=iam_mfa_device_config["mfa_path"], mfa_file=iam_mfa_device_config["mfa_file"], tag_key=iam_mfa_device_config["tag_key"], tag_value=iam_mfa_device_config["tag_value"])


def get_iam_mfa_device_name(iam_client, device_name: str):
    """Extrai o nome de um dispositivo MFA específico"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando o nome do dispositivo MFA {device_name}")
    try:
        response = iam_client.list_virtual_mfa_devices()
        for device in response.get('VirtualMFADevices', []):
            if device_name in device['SerialNumber']:
                name = device['SerialNumber'].split("mfa/", 1)[-1]
                print(name)
    except ClientError as e:
        print(f"Erro ao obter o nome do dispositivo MFA {device_name}: {e}")
# get_iam_mfa_device_name(iam_client=iam_client, device_name=iam_mfa_device_config["device_name"])


def get_iam_mfa_device_arn(iam_client, device_name: str):
    """Extrai o ARN de um dispositivo MFA específico"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Extraindo o ARN do dispositivo MFA {device_name}")
    try:
        response = iam_client.list_virtual_mfa_devices()
        for device in response.get('VirtualMFADevices', []):
            if device_name in device['SerialNumber']:
                return device['SerialNumber']
        return ""
    except ClientError as e:
        print(f"Erro ao obter o ARN do dispositivo MFA {device_name}: {e}")
        return ""
# device_arn = get_iam_mfa_device_arn(iam_client=iam_client, device_name=iam_mfa_device_config["device_name"])


def disconnect_iam_mfa_user(iam_client, device_name: str, device_arn: str):
    """Verifica o dispositivo MFA do usuário e o remove"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe algum usuário associado ao dispositivo MFA {device_name}")
    try:
        response = iam_client.list_virtual_mfa_devices()
        associated_user = None
        for device in response.get('VirtualMFADevices', []):
            if device['SerialNumber'] == device_arn:
                associated_user = device.get('User', {}).get('UserName')
                break
        if associated_user:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Desanexando o dispositivo MFA {device_name} associado ao usuário do IAM {associated_user}")
            iam_client.deactivate_mfa_device(
                UserName=associated_user,
                SerialNumber=device_arn
            )
        else:
            print("O dispositivo MFA não está associado a nenhum usuário.")
    except ClientError as e:
        print(f"Erro ao desanexar o dispositivo MFA {device_name}: {e}")
# disconnect_iam_mfa_user(iam_client=iam_client, device_name=iam_mfa_device_config["device_name"], device_arn=device_arn)


def remove_iam_mfa_device(iam_client, device_name: str, device_arn: str, mfa_path: str, mfa_file: str):
    """Remove definitivamente o dispositivo de MFA e apaga o arquivo local de QRCode"""

    import os
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo o dispositivo MFA {device_name}")
    try:
        iam_client.delete_virtual_mfa_device(SerialNumber=device_arn)
    except ClientError as e:
        print(f"Erro ao remover o dispositivo MFA {device_name}: {e}")

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o arquivo de QRCode do MFA {mfa_file}")
    file_path = os.path.join(mfa_path, mfa_file)
    if os.path.isfile(file_path):
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo o arquivo de QRCode do MFA {mfa_file}")
        os.remove(file_path)
    else:
        print(f"Não existe o arquivo de QRCode do MFA {mfa_file}")
# remove_iam_mfa_device(iam_client=iam_client, device_name=iam_mfa_device_config["device_name"], device_arn=device_arn, mfa_path=iam_mfa_device_config["mfa_path"], mfa_file=iam_mfa_device_config["mfa_file"])




# endregion
# region IAM User MFA:
def test_iam_user_and_mfa_device_exists(iam_client, user_name: str, device_name: str):
    """Verifica se o usuário e o dispositivo MFA existem simultaneamente na AWS"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o usuário do IAM {user_name} e o dispositivo MFA {device_name}")
    try:
        user_exists = False
        device_exists = False

        paginator = iam_client.get_paginator('list_users')
        for page in paginator.paginate():
            for user in page['Users']:
                if user['UserName'] == user_name:
                    user_exists = True
                    break

        response = iam_client.list_virtual_mfa_devices()
        for device in response.get('VirtualMFADevices', []):
            if device_name in device['SerialNumber']:
                device_exists = True
                break

        return user_exists and device_exists
    except ClientError as e:
        print(f"Erro ao verificar usuário {user_name} e dispositivo MFA {device_name}: {e}")
        return False
# condition = test_iam_user_and_mfa_device_exists(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])


def test_iam_user_mfa_attached(iam_client, user_name: str, device_name: str):
    """Verifica se o usuário específico possui o dispositivo MFA associado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o MFA {device_name} associado ao usuário do IAM {user_name}")
    try:
        response = iam_client.list_mfa_devices(UserName=user_name)
        for device in response.get('MFADevices', []):
            if device_name in device['SerialNumber']:
                return device_name
        return ""
    except ClientError as e:
        print(f"Erro ao verificar MFA {device_name} do usuário {user_name}: {e}")
        return ""
# condition = test_iam_user_mfa_attached(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])


def show_iam_user_mfa(iam_client, user_name: str, device_name: str):
    """Exibe o dispositivo MFA específico associado ao usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe o dispositivo MFA {device_name} associado ao usuário do IAM {user_name}")
    try:
        response = iam_client.list_mfa_devices(UserName=user_name)
        for device in response.get('MFADevices', []):
            if device_name in device['SerialNumber']:
                name = device['SerialNumber'].split("mfa/", 1)[-1]
                print(name)
    except ClientError as e:
        print(f"Erro ao exibir o MFA {device_name} do usuário {user_name}: {e}")
# show_iam_user_mfa(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])


def show_iam_user_mfa_devices_all(iam_client, user_name: str):
    """Lista todos os dispositivos MFA associados ao usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando todos os dispositivos MFA associados ao usuário do IAM {user_name}")
    try:
        response = iam_client.list_mfa_devices(UserName=user_name)
        for device in response.get('MFADevices', []):
            serial_number = device["SerialNumber"]
            serial_number = serial_number.split("mfa/", 1)[1]
            print(f"mfa/{serial_number}")
    except ClientError as e:
        print(f"Erro ao listar dispositivos MFA do usuário {user_name}: {e}")
# show_iam_user_mfa_devices_all(iam_client=iam_client, user_name=iam_mfa_device_config["user_name"])


def enable_iam_user_mfa_device(iam_client, user_name: str, device_name: str):
    """Ativa o dispositivo MFA para o usuário do IAM, solicitando os dois códigos interativamente"""

    import boto3
    resposta = input("O MFA já foi configurado no dispositivo? (y/n) ").lower()
    if resposta == 'y':
        code1 = input("Digite o primeiro código de autenticação fornecido pelo dispositivo: ")
        code2 = input("Digite o segundo código de autenticação fornecido pelo dispositivo: ")

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Obtendo o ID da conta do perfil CLI em uso")
        try:
            sts_client = iam_client._endpoint.http_session._session.create_client(
                'sts',
                region_name=iam_client.meta.region_name
            )
            account_id = sts_client.get_caller_identity()['Account']
        except Exception:
            session = boto3.Session()
            account_id = session.client('sts').get_caller_identity()['Account']

        device_serial = f"arn:aws:iam::{account_id}:mfa/{device_name}"

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Ativando o MFA para o usuário do IAM {user_name}")
        try:
            iam_client.enable_mfa_device(
                UserName=user_name,
                SerialNumber=device_serial,
                AuthenticationCode1=code1,
                AuthenticationCode2=code2
            )
        except ClientError as e:
            print(f"Erro ao ativar o MFA {device_name} para o usuário {user_name}: {e}")
    else:
        print("O MFA precisa ser configurado em um dispositivo antes de ser ativado")
# enable_iam_user_mfa_device(iam_client=iam_client, user_name=iam_user_mfa_config["user_name"], device_name=iam_mfa_device_config["device_name"])


def get_iam_user_mfa(iam_client, user_name: str, device_name: str):
    """Lista o dispositivo MFA específico associado ao usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando o dispositivo MFA {device_name} associado ao usuário do IAM {user_name}")
    try:
        response = iam_client.list_mfa_devices(UserName=user_name)
        for device in response.get('MFADevices', []):
            if device_name in device['SerialNumber']:
                name = device['SerialNumber'].split("mfa/", 1)[-1]
                print(name)
    except ClientError as e:
        print(f"Erro ao obter o MFA {device_name} do usuário {user_name}: {e}")
# get_iam_user_mfa(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])




# endregion
# region IAM User Key Access:
def test_iam_user_key_access_exists(iam_client, user_name: str):
    """Verifica se existe chave de acesso para o usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe chave de acesso para o usuário do IAM {user_name}")
    try:
        response = iam_client.list_access_keys(UserName=user_name)
        keys = response.get('AccessKeyMetadata', [])
        return keys[0]['AccessKeyId'] if keys else ""
    except ClientError as e:
        print(f"Erro ao verificar chave de acesso do usuário {user_name}: {e}")
        return ""
# condition = test_iam_user_key_access_exists(iam_client=iam_client, user_name=iam_mfa_device_config["user_name"])


def show_iam_user_key_access_id(iam_client, user_name: str):
    """Exibe a(s) chave(s) de acesso existente(s) do usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe uma chave de acesso criada para o usuário do IAM {user_name}")
    try:
        response = iam_client.list_access_keys(UserName=user_name)
        for key in response.get('AccessKeyMetadata', []):
            print(key['AccessKeyId'])
    except ClientError as e:
        print(f"Erro ao exibir chave de acesso do usuário {user_name}: {e}")
# show_iam_user_key_access_id(iam_client=iam_client, user_name=iam_user_config["user_name"])


def show_iam_user_key_accesses_all(iam_client, user_name: str):
    """Lista todas as chaves de acesso do usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando todas as chaves de acesso do usuário do IAM {user_name}")
    try:
        response = iam_client.list_access_keys(UserName=user_name)
        for key in response.get('AccessKeyMetadata', []):
            print(key['AccessKeyId'])
    except ClientError as e:
        print(f"Erro ao listar chaves de acesso do usuário {user_name}: {e}")
# show_iam_user_key_accesses_all(iam_client=iam_client, user_name=iam_user_config["user_name"])


def new_iam_user_key_access(iam_client, user_name: str, key_access_path: str, key_access_file: str):
    """Cria uma chave de acesso para o usuário do IAM e salva em arquivo JSON"""

    import json, os
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Criando uma chave de acesso para o usuário do IAM {user_name}")
    try:
        response = iam_client.create_access_key(UserName=user_name)
        access_key = response['AccessKey']
        os.makedirs(key_access_path, exist_ok=True)
        file_path = os.path.join(key_access_path, key_access_file)
        with open(file_path, "w") as f:
            json.dump({
                "AccessKeyId": access_key['AccessKeyId'],
                "SecretAccessKey": access_key['SecretAccessKey']
            }, f, indent=4)
        print(f"Chave salva em {file_path}")
    except ClientError as e:
        print(f"Erro ao criar chave de acesso para o usuário {user_name}: {e}")
# new_iam_user_key_access(iam_client=iam_client, user_name=iam_user_config["user_name"], key_access_path=iam_user_key_access_config["key_access_path"], key_access_file=iam_user_key_access_config["key_access_file"])


def get_iam_user_key_access_id(iam_client, user_name: str):
    """Extrai o ID da primeira chave de acesso existente do usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Extraindo o ID da primeira chave de acesso do usuário do IAM {user_name}")
    try:
        response = iam_client.list_access_keys(UserName=user_name)
        keys = response.get('AccessKeyMetadata', [])
        if keys:
            return keys[0]['AccessKeyId']
        return ""
    except ClientError as e:
        print(f"Erro ao obter ID da chave de acesso do usuário {user_name}: {e}")
        return ""
# key_access_id = get_iam_user_key_access_id(iam_client=iam_client, user_name=iam_user_config["user_name"])


def remove_iam_user_key_access(iam_client, user_name: str, key_access_id: str, key_access_path: str, key_access_file: str):
    """Remove a chave de acesso da AWS e o arquivo local correspondente"""

    import os
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo a chave de acesso do usuário do IAM {user_name}")
    try:
        iam_client.delete_access_key(UserName=user_name, AccessKeyId=key_access_id)
    except ClientError as e:
        print(f"Erro ao remover a chave de acesso do usuário {user_name}: {e}")

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o arquivo de chave de acesso {key_access_file}")
    file_path = os.path.join(key_access_path, key_access_file)
    if os.path.isfile(file_path):
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo o arquivo de chave de acesso {key_access_file}")
        os.remove(file_path)
    else:
        print(f"Não existe o arquivo de chave de acesso {key_access_file}")
# remove_iam_user_key_access(iam_client=iam_client, user_name=iam_user_config["user_name"], key_access_id=key_access_id, key_access_path=iam_user_key_access_config["key_access_path"], key_access_file=iam_user_key_access_config["key_access_file"])




# endregion
# region IAM User Group:
def test_iam_group_and_user_exists(iam_client, group_name: str, user_name: str):
    """Verifica se o grupo e o usuário existem simultaneamente na AWS"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o grupo {group_name} e o usuário {user_name}")
    try:
        group_exists = False
        user_exists = False

        paginator = iam_client.get_paginator('list_groups')
        for page in paginator.paginate():
            for group in page['Groups']:
                if group['GroupName'] == group_name:
                    group_exists = True
                    break

        paginator = iam_client.get_paginator('list_users')
        for page in paginator.paginate():
            for user in page['Users']:
                if user['UserName'] == user_name:
                    user_exists = True
                    break

        return group_exists and user_exists
    except ClientError as e:
        print(f"Erro ao verificar grupo {group_name} e usuário {user_name}: {e}")
        return False
# condition = test_iam_group_and_user_exists(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])


def test_iam_group_user_attached(iam_client, group_name: str, user_name: str):
    """Verifica se um usuário específico está inserido no grupo do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se o usuário {user_name} está no grupo {group_name}")
    try:
        response = iam_client.get_group(GroupName=group_name)
        for user in response.get('Users', []):
            if user['UserName'] == user_name:
                return user_name
        return ""
    except ClientError as e:
        print(f"Erro ao verificar usuário {user_name} no grupo {group_name}: {e}")
        return ""
# condition = test_iam_group_user_attached(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])


def show_iam_group_user(iam_client, group_name: str, user_name: str):
    """Exibe um usuário específico inserido no grupo do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe o usuário {user_name} no grupo {group_name}")
    try:
        response = iam_client.get_group(GroupName=group_name)
        for user in response.get('Users', []):
            if user['UserName'] == user_name:
                print(user['UserName'])
    except ClientError as e:
        print(f"Erro ao buscar o usuário {user_name} no grupo {group_name}: {e}")
# show_iam_group_user(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])


def show_iam_group_users_all(iam_client, group_name: str):
    """Lista todos os usuários inseridos no grupo do IAM especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando todos os usuários do grupo {group_name}")
    try:
        response = iam_client.get_group(GroupName=group_name)
        for user in response.get('Users', []):
            print(user['UserName'])
    except ClientError as e:
        print(f"Erro ao listar usuários do grupo {group_name}: {e}")
# show_iam_group_users_all(iam_client=iam_client, group_name=iam_group_config["group_name"])


def add_iam_group_user(iam_client, group_name: str, user_name: str):
    """Adiciona um usuário específico ao grupo do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Adicionando o usuário {user_name} ao grupo {group_name}")
    try:
        iam_client.add_user_to_group(
            GroupName=group_name,
            UserName=user_name
        )
    except ClientError as e:
        print(f"Erro ao adicionar o usuário {user_name} ao grupo {group_name}: {e}")
# add_iam_group_user(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])


def get_iam_group_user(iam_client, group_name: str, user_name: str):
    """Lista um usuário específico inserido no grupo do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando o usuário {user_name} do grupo {group_name}")
    try:
        response = iam_client.get_group(GroupName=group_name)
        for user in response.get('Users', []):
            if user['UserName'] == user_name:
                print(user['UserName'])
    except ClientError as e:
        print(f"Erro ao buscar o usuário {user_name} do grupo {group_name}: {e}")
# get_iam_group_user(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])


def remove_iam_group_user(iam_client, group_name: str, user_name: str):
    """Remove um usuário específico do grupo do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo o usuário {user_name} do grupo {group_name}")
    try:
        iam_client.remove_user_from_group(
            GroupName=group_name,
            UserName=user_name
        )
    except ClientError as e:
        print(f"Erro ao remover o usuário {user_name} do grupo {group_name}: {e}")
# remove_iam_group_user(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])




# endregion
# region IAM Instance Profile Role:
def test_iam_inst_prof_and_role_exists(iam_client, inst_prof_name: str, role_name: str):
    """Verifica se o instance profile e a role existem simultaneamente na AWS"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o instance profile {inst_prof_name} e a role {role_name}")
    try:
        inst_prof_exists = False
        role_exists = False

        paginator = iam_client.get_paginator('list_instance_profiles')
        for page in paginator.paginate():
            for profile in page['InstanceProfiles']:
                if profile['InstanceProfileName'] == inst_prof_name:
                    inst_prof_exists = True
                    break

        paginator = iam_client.get_paginator('list_roles')
        for page in paginator.paginate():
            for role in page['Roles']:
                if role['RoleName'] == role_name:
                    role_exists = True
                    break

        return inst_prof_exists and role_exists
    except ClientError as e:
        print(f"Erro ao verificar instance profile {inst_prof_name} e role {role_name}: {e}")
        return False
# condition = test_iam_inst_prof_and_role_exists(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])


def test_iam_inst_prof_role_attached(iam_client, inst_prof_name: str, role_name: str):
    """Verifica se uma role específica está anexada ao instance profile do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe a role {role_name} no instance profile {inst_prof_name}")
    try:
        response = iam_client.get_instance_profile(InstanceProfileName=inst_prof_name)
        for role in response['InstanceProfile'].get('Roles', []):
            if role['RoleName'] == role_name:
                return role_name
        return ""
    except ClientError as e:
        print(f"Erro ao verificar role {role_name} no instance profile {inst_prof_name}: {e}")
        return ""
# condition = test_iam_inst_prof_role_attached(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])


def show_iam_inst_prof_role(iam_client, inst_prof_name: str, role_name: str):
    """Exibe uma role específica anexada ao instance profile do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe a role {role_name} no instance profile {inst_prof_name}")
    try:
        response = iam_client.get_instance_profile(InstanceProfileName=inst_prof_name)
        for role in response['InstanceProfile'].get('Roles', []):
            if role['RoleName'] == role_name:
                print(role['RoleName'])
    except ClientError as e:
        print(f"Erro ao exibir a role {role_name} no instance profile {inst_prof_name}: {e}")
# show_iam_inst_prof_role(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])


def show_iam_inst_prof_roles_all(iam_client, inst_prof_name: str):
    """Lista todas as roles anexadas ao instance profile do IAM especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando todas as roles do instance profile {inst_prof_name}")
    try:
        response = iam_client.get_instance_profile(InstanceProfileName=inst_prof_name)
        for role in response['InstanceProfile'].get('Roles', []):
            print(role['RoleName'])
    except ClientError as e:
        print(f"Erro ao listar roles do instance profile {inst_prof_name}: {e}")
# show_iam_inst_prof_roles_all(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])


def add_role_to_instance_profile(iam_client, inst_prof_name: str, role_name: str):
    """Adiciona (anexa) uma role específica ao instance profile do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Adicionando a role {role_name} ao instance profile {inst_prof_name}")
    try:
        iam_client.add_role_to_instance_profile(
            InstanceProfileName=inst_prof_name,
            RoleName=role_name
        )
    except ClientError as e:
        print(f"Erro ao adicionar a role {role_name} ao instance profile {inst_prof_name}: {e}")
# add_role_to_instance_profile(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])


def get_iam_inst_prof_role(iam_client, inst_prof_name: str, role_name: str):
    """Lista uma role específica anexada ao instance profile do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando a role {role_name} do instance profile {inst_prof_name}")
    try:
        response = iam_client.get_instance_profile(InstanceProfileName=inst_prof_name)
        for role in response['InstanceProfile'].get('Roles', []):
            if role['RoleName'] == role_name:
                print(role['RoleName'])
    except ClientError as e:
        print(f"Erro ao obter a role {role_name} do instance profile {inst_prof_name}: {e}")
# get_iam_inst_prof_role(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])


def remove_iam_instance_profile_role(iam_client, inst_prof_name: str, role_name: str):
    """Remove uma role de um instance profile do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo a role {role_name} do perfil de instância {inst_prof_name}")
    try:
        iam_client.remove_role_from_instance_profile(
            InstanceProfileName=inst_prof_name,
            RoleName=role_name
        )
    except ClientError as e:
        print(f"Erro ao remover a role {role_name} do instance profile {inst_prof_name}: {e}")
# remove_iam_instance_profile_role(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])




# endregion
# region IAM User Policy:
def test_iam_user_policy_attached(iam_client, user_name: str, policy_name: str):
    """Verifica se existe uma policy (managed ou inline) específica anexada ao usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe a policy {policy_name} no usuário {user_name} (managed ou inline)")
    try:
        response = iam_client.list_attached_user_policies(UserName=user_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                return True
        response_inline = iam_client.list_user_policies(UserName=user_name)
        if policy_name in response_inline.get('PolicyNames', []):
            return True
        return False
    except ClientError as e:
        print(f"Erro ao verificar policy {policy_name} no usuário {user_name}: {e}")
        return False
# condition = test_iam_user_policy_attached(iam_client=iam_client, user_name=iam_user_config["user_name"], policy_name=iam_policy_config["policy_name"])


def show_iam_user_policy(iam_client, user_name: str, policy_name: str):
    """Exibe a policy (managed ou inline) específica do usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe a policy {policy_name} no usuário {user_name}")
    try:
        response = iam_client.list_attached_user_policies(UserName=user_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                print(policy['PolicyName'])
        response_inline = iam_client.list_user_policies(UserName=user_name)
        if policy_name in response_inline.get('PolicyNames', []):
            print(policy_name)
    except ClientError as e:
        print(f"Erro ao buscar a policy {policy_name} no usuário {user_name}: {e}")
# show_iam_user_policy(iam_client=iam_client, user_name=iam_user_config["user_name"], policy_name=iam_policy_config["policy_name"])


def show_iam_user_policies_all(iam_client, user_name: str):
    """Lista todas as policies (managed e inline) do usuário do IAM especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando todas as policies do usuário {user_name}")
    try:
        response = iam_client.list_attached_user_policies(UserName=user_name)
        for policy in response.get('AttachedPolicies', []):
            print(policy['PolicyName'])
        response_inline = iam_client.list_user_policies(UserName=user_name)
        for policy_name in response_inline.get('PolicyNames', []):
            print(policy_name)
    except ClientError as e:
        print(f"Erro ao listar policies do usuário {user_name}: {e}")
# show_iam_user_policies_all(iam_client=iam_client, user_name=iam_user_config["user_name"])


def add_iam_user_policy(iam_client, user_name: str, policy_name: str, policy_file=None, policy_document=None):
    """Adiciona uma policy ao usuário: managed (via ARN) se existir, senão cria inline via arquivo ou string"""

    try:
        policy_arn = get_iam_policy_arn(iam_client=iam_client, policy_name=policy_name)
        if policy_arn:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Adicionando a managed policy {policy_name} ao usuário {user_name}")
            iam_client.attach_user_policy(UserName=user_name, PolicyArn=policy_arn)
        elif policy_file:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Managed policy {policy_name} não encontrada. Adicionando como inline policy ao usuário {user_name}, via arquivo")
            with open(policy_file, 'r') as f:
                policy_document_str = f.read()
            iam_client.put_user_policy(UserName=user_name, PolicyName=policy_name, PolicyDocument=policy_document_str)
        elif policy_document:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Managed policy {policy_name} não encontrada. Adicionando como inline policy ao usuário {user_name}, via string")
            iam_client.put_user_policy(UserName=user_name, PolicyName=policy_name, PolicyDocument=policy_document)
        else:
            print(f"Managed policy {policy_name} não encontrada. Informe 'policy_file' ou 'policy_document' para criar uma inline policy.")
    except ClientError as e:
        print(f"Erro ao adicionar a policy {policy_name} ao usuário {user_name}: {e}")
# add_iam_user_policy(iam_client=iam_client, user_name=iam_user_config["user_name"], policy_name=iam_policy_config["policy_name"], policy_file=iam_policy_config["policy_file"], policy_document=iam_policy_config["policy_document"])


def get_iam_user_policy(iam_client, user_name: str, policy_name: str):
    """Lista a policy (managed ou inline) específica do usuário do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando a policy {policy_name} do usuário {user_name}")
    try:
        response = iam_client.list_attached_user_policies(UserName=user_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                print(policy['PolicyName'])
        response_inline = iam_client.list_user_policies(UserName=user_name)
        if policy_name in response_inline.get('PolicyNames', []):
            print(policy_name)
    except ClientError as e:
        print(f"Erro ao buscar a policy {policy_name} do usuário {user_name}: {e}")
# get_iam_user_policy(iam_client=iam_client, user_name=iam_user_config["user_name"], policy_name=iam_policy_config["policy_name"])


def remove_iam_user_policy(iam_client, user_name: str, policy_name: str):
    """Remove a policy do usuário: detach se for managed, delete se for inline"""

    try:
        response = iam_client.list_attached_user_policies(UserName=user_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                policy_arn = get_iam_policy_arn(iam_client=iam_client, policy_name=policy_name)
                print("-----//-----//-----//-----//-----//-----//-----")
                print(f"Removendo a managed policy {policy_name} do usuário {user_name}")
                iam_client.detach_user_policy(UserName=user_name, PolicyArn=policy_arn)
                return
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo a inline policy {policy_name} do usuário {user_name}")
        iam_client.delete_user_policy(UserName=user_name, PolicyName=policy_name)
    except ClientError as e:
        print(f"Erro ao remover a policy {policy_name} do usuário {user_name}: {e}")
# remove_iam_user_policy(iam_client=iam_client, user_name=iam_user_config["user_name"], policy_name=iam_policy_config["policy_name"])




# endregion
# region IAM Group Policy:
def test_iam_group_policy_attached(iam_client, group_name: str, policy_name: str):
    """Verifica se existe uma policy (managed ou inline) específica anexada ao grupo do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe a policy {policy_name} no grupo {group_name} (managed ou inline)")
    try:
        response = iam_client.list_attached_group_policies(GroupName=group_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                return True
        response_inline = iam_client.list_group_policies(GroupName=group_name)
        if policy_name in response_inline.get('PolicyNames', []):
            return True
        return False
    except ClientError as e:
        print(f"Erro ao verificar policy {policy_name} no grupo {group_name}: {e}")
        return False
# condition = test_iam_group_policy_attached(iam_client=iam_client, group_name=iam_group_config["group_name"], policy_name=iam_policy_config["policy_name"])


def show_iam_group_policy(iam_client, group_name: str, policy_name: str):
    """Exibe a policy (managed ou inline) específica do grupo do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe a policy {policy_name} no grupo {group_name}")
    try:
        response = iam_client.list_attached_group_policies(GroupName=group_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                print(policy['PolicyName'])
        response_inline = iam_client.list_group_policies(GroupName=group_name)
        if policy_name in response_inline.get('PolicyNames', []):
            print(policy_name)
    except ClientError as e:
        print(f"Erro ao buscar a policy {policy_name} no grupo {group_name}: {e}")
# show_iam_group_policy(iam_client=iam_client, group_name=iam_group_config["group_name"], policy_name=iam_policy_config["policy_name"])


def show_iam_group_policies_all(iam_client, group_name: str):
    """Lista todas as policies (managed e inline) do grupo do IAM especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando todas as policies do grupo {group_name}")
    try:
        response = iam_client.list_attached_group_policies(GroupName=group_name)
        for policy in response.get('AttachedPolicies', []):
            print(policy['PolicyName'])
        response_inline = iam_client.list_group_policies(GroupName=group_name)
        for policy_name in response_inline.get('PolicyNames', []):
            print(policy_name)
    except ClientError as e:
        print(f"Erro ao listar policies do grupo {group_name}: {e}")
# show_iam_group_policies_all(iam_client=iam_client, group_name=iam_group_config["group_name"])


def add_iam_group_policy(iam_client, group_name: str, policy_name: str, policy_file=None, policy_document=None):
    """Adiciona uma policy ao grupo: managed (via ARN) se existir, senão cria inline via arquivo ou string"""

    try:
        policy_arn = get_iam_policy_arn(iam_client=iam_client, policy_name=policy_name)
        if policy_arn:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Adicionando a managed policy {policy_name} ao grupo {group_name}")
            iam_client.attach_group_policy(GroupName=group_name, PolicyArn=policy_arn)
        elif policy_file:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Managed policy {policy_name} não encontrada. Adicionando como inline policy ao grupo {group_name}, via arquivo")
            with open(policy_file, 'r') as f:
                policy_document_str = f.read()
            iam_client.put_group_policy(GroupName=group_name, PolicyName=policy_name, PolicyDocument=policy_document_str)
        elif policy_document:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Managed policy {policy_name} não encontrada. Adicionando como inline policy ao grupo {group_name}, via string")
            iam_client.put_group_policy(GroupName=group_name, PolicyName=policy_name, PolicyDocument=policy_document)
        else:
            print(f"Managed policy {policy_name} não encontrada. Informe 'policy_file' ou 'policy_document' para criar uma inline policy.")
    except ClientError as e:
        print(f"Erro ao adicionar a policy {policy_name} ao grupo {group_name}: {e}")
# add_iam_group_policy(iam_client=iam_client, group_name=iam_group_config["group_name"], policy_name=iam_policy_config["policy_name"], policy_file=iam_policy_config["policy_file"], policy_document=iam_policy_config["policy_document"])


def get_iam_group_policy(iam_client, group_name: str, policy_name: str):
    """Lista a policy (managed ou inline) específica do grupo do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando a policy {policy_name} do grupo {group_name}")
    try:
        response = iam_client.list_attached_group_policies(GroupName=group_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                print(policy['PolicyName'])
        response_inline = iam_client.list_group_policies(GroupName=group_name)
        if policy_name in response_inline.get('PolicyNames', []):
            print(policy_name)
    except ClientError as e:
        print(f"Erro ao buscar a policy {policy_name} do grupo {group_name}: {e}")
# get_iam_group_policy(iam_client=iam_client, group_name=iam_group_config["group_name"], policy_name=iam_policy_config["policy_name"])


def remove_iam_group_policy(iam_client, group_name: str, policy_name: str):
    """Remove a policy do grupo: detach se for managed, delete se for inline"""

    try:
        response = iam_client.list_attached_group_policies(GroupName=group_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                policy_arn = get_iam_policy_arn(iam_client=iam_client, policy_name=policy_name)
                print("-----//-----//-----//-----//-----//-----//-----")
                print(f"Removendo a managed policy {policy_name} do grupo {group_name}")
                iam_client.detach_group_policy(GroupName=group_name, PolicyArn=policy_arn)
                return
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo a inline policy {policy_name} do grupo {group_name}")
        iam_client.delete_group_policy(GroupName=group_name, PolicyName=policy_name)
    except ClientError as e:
        print(f"Erro ao remover a policy {policy_name} do grupo {group_name}: {e}")
# remove_iam_group_policy(iam_client=iam_client, group_name=iam_group_config["group_name"], policy_name=iam_policy_config["policy_name"])




# endregion
# region IAM Role Policy:
def test_iam_role_policy_attached(iam_client, role_name: str, policy_name: str):
    """Verifica se existe uma policy (managed ou inline) específica anexada à role do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe a policy {policy_name} na role {role_name} (managed ou inline)")
    try:
        response = iam_client.list_attached_role_policies(RoleName=role_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                return True
        response_inline = iam_client.list_role_policies(RoleName=role_name)
        if policy_name in response_inline.get('PolicyNames', []):
            return True
        return False
    except ClientError as e:
        print(f"Erro ao verificar policy {policy_name} na role {role_name}: {e}")
        return False
# condition = test_iam_role_policy_attached(iam_client=iam_client, role_name=iam_role_config["role_name"], policy_name=iam_policy_config["policy_name"])


def show_iam_role_policy(iam_client, role_name: str, policy_name: str):
    """Exibe a policy (managed ou inline) específica da role do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe a policy {policy_name} na role {role_name}")
    try:
        response = iam_client.list_attached_role_policies(RoleName=role_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                print(policy['PolicyName'])
        response_inline = iam_client.list_role_policies(RoleName=role_name)
        if policy_name in response_inline.get('PolicyNames', []):
            print(policy_name)
    except ClientError as e:
        print(f"Erro ao buscar a policy {policy_name} na role {role_name}: {e}")
# show_iam_role_policy(iam_client=iam_client, role_name=iam_role_config["role_name"], policy_name=iam_policy_config["policy_name"])


def show_iam_role_policies_all(iam_client, role_name: str):
    """Lista todas as policies (managed e inline) da role do IAM especificada"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando todas as policies da role {role_name}")
    try:
        response = iam_client.list_attached_role_policies(RoleName=role_name)
        for policy in response.get('AttachedPolicies', []):
            print(policy['PolicyName'])
        response_inline = iam_client.list_role_policies(RoleName=role_name)
        for policy_name in response_inline.get('PolicyNames', []):
            print(policy_name)
    except ClientError as e:
        print(f"Erro ao listar policies da role {role_name}: {e}")
# show_iam_role_policies_all(iam_client=iam_client, role_name=iam_role_config["role_name"])


def add_iam_role_policy(iam_client, role_name: str, policy_name: str, policy_file=None, policy_document=None):
    """Adiciona uma policy à role: managed (via ARN) se existir, senão cria inline via arquivo ou string"""

    try:
        policy_arn = get_iam_policy_arn(iam_client=iam_client, policy_name=policy_name)
        if policy_arn:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Adicionando a managed policy {policy_name} à role {role_name}")
            iam_client.attach_role_policy(RoleName=role_name, PolicyArn=policy_arn)
        elif policy_file:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Managed policy {policy_name} não encontrada. Adicionando como inline policy à role {role_name}, via arquivo")
            with open(policy_file, 'r') as f:
                policy_document_str = f.read()
            iam_client.put_role_policy(RoleName=role_name, PolicyName=policy_name, PolicyDocument=policy_document_str)
        elif policy_document:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Managed policy {policy_name} não encontrada. Adicionando como inline policy à role {role_name}, via string")
            iam_client.put_role_policy(RoleName=role_name, PolicyName=policy_name, PolicyDocument=policy_document)
        else:
            print(f"Managed policy {policy_name} não encontrada. Informe 'policy_file' ou 'policy_document' para criar uma inline policy.")
    except ClientError as e:
        print(f"Erro ao adicionar a policy {policy_name} à role {role_name}: {e}")
# add_iam_role_policy(iam_client=iam_client, role_name=iam_role_config["role_name"], policy_name=iam_policy_config["policy_name"], policy_file=iam_policy_config["policy_file"], policy_document=iam_policy_config["policy_document"])


def get_iam_role_policy(iam_client, role_name: str, policy_name: str):
    """Lista a policy (managed ou inline) específica da role do IAM"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando a policy {policy_name} da role {role_name}")
    try:
        response = iam_client.list_attached_role_policies(RoleName=role_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                print(policy['PolicyName'])
        response_inline = iam_client.list_role_policies(RoleName=role_name)
        if policy_name in response_inline.get('PolicyNames', []):
            print(policy_name)
    except ClientError as e:
        print(f"Erro ao buscar a policy {policy_name} da role {role_name}: {e}")
# get_iam_role_policy(iam_client=iam_client, role_name=iam_role_config["role_name"], policy_name=iam_policy_config["policy_name"])


def remove_iam_role_policy(iam_client, role_name: str, policy_name: str):
    """Remove a policy da role: detach se for managed, delete se for inline"""

    try:
        response = iam_client.list_attached_role_policies(RoleName=role_name)
        for policy in response.get('AttachedPolicies', []):
            if policy['PolicyName'] == policy_name:
                policy_arn = get_iam_policy_arn(iam_client=iam_client, policy_name=policy_name)
                print("-----//-----//-----//-----//-----//-----//-----")
                print(f"Removendo a managed policy {policy_name} da role {role_name}")
                iam_client.detach_role_policy(RoleName=role_name, PolicyArn=policy_arn)
                return
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo a inline policy {policy_name} da role {role_name}")
        iam_client.delete_role_policy(RoleName=role_name, PolicyName=policy_name)
    except ClientError as e:
        print(f"Erro ao remover a policy {policy_name} da role {role_name}: {e}")
# remove_iam_role_policy(iam_client=iam_client, role_name=iam_role_config["role_name"], policy_name=iam_policy_config["policy_name"])




# endregion













