#!/usr/bin/env python

import boto3

print("***********************************************")
print("SERVIÇO: AWS EC2")
print("KEY PAIR CREATION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
key_pair_name = "keyPairTest"
key_pair_path = "G:/Meu Drive/4_PROJ/scripts/aws/.default/secrets/awsKeyPair/test"
region = "us-east-1"
# region = "sa-east-1"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n): ")
if resposta.lower() == 'y':
    try:
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Verificando se existe o par de chaves {key_pair_name}")
        ec2 = boto3.client('ec2', region=region)
        existing_key_pairs = ec2.describe_key_pairs(KeyNames=[key_pair_name])
        
        if existing_key_pairs["KeyPairs"]:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Já existe o par de chaves {key_pair_name}")
            print(f"Chave Pública:\n{existing_key_pairs['KeyPairs'][0]['KeyName']}")
        else:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Criando o par de chaves {key_pair_name}")
            key_pair = ec2.create_key_pair(KeyName=key_pair_name)

            print("-----//-----//-----//-----//-----//-----//-----")
            print("Salvando o arquivo de chave privada")
            with open(f"{key_pair_path}/{key_pair_name}.pem", 'w') as pem_file:
                pem_file.write(key_pair['KeyMaterial'])

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Par de chaves {key_pair_name} criado com sucesso")
            print(f"Chave Pública:\n{key_pair['KeyMaterial']}")

    # Caso de Erro: InvalidKeyPair.NotFound
    except ec2.exceptions.ClientError as e:
        if e.response['Error']['Code'] == 'InvalidKeyPair.NotFound':
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Criando o par de chaves {key_pair_name}")
            key_pair = ec2.create_key_pair(KeyName=key_pair_name)

            print("-----//-----//-----//-----//-----//-----//-----")
            print("Salvando a chave privada no arquivo .pem")
            with open(f"{key_pair_path}/{key_pair_name}.pem", 'w') as pem_file:
                pem_file.write(key_pair['KeyMaterial'])

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Par de chaves {key_pair_name} criado com sucesso")
            print(f"Chave Pública:\n{key_pair['KeyMaterial']}")
else:
    print("Código não executado")




#!/usr/bin/env python

import os
import boto3

print("***********************************************")
print("SERVIÇO: AWS EC2")
print("KEY PAIR EXCLUSION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
key_pair_name = "keyPairTest"
key_pair_path = "G:/Meu Drive/4_PROJ/scripts/aws/.default/secrets/awsKeyPair/test"
region = "us-east-1"
# region = "sa-east-1"

print("-----//-----//-----//-----//-----//-----//-----")
response = input("Deseja executar o código? (y/n) ").lower()
if response == 'y':   
    try:
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Verificando se existe o par de chaves {key_pair_name}")
        ec2 = boto3.client('ec2', region=region)
        existing_key_pairs = ec2.describe_key_pairs(KeyNames=[key_pair_name])

        if existing_key_pairs.get("KeyPairs"):
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo o par de chaves {key_pair_name}")
            ec2.delete_key_pair(KeyName=key_pair_name)          

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo o arquivo de chave privada {key_pair_name}.pem se existir")
            pem_path = os.path.join(key_pair_path, f"{key_pair_name}.pem")
            if os.path.exists(pem_path):
                os.remove(pem_path)
            else:
                print(f"Não existe o arquivo de chave privada {key_pair_name}.pem")

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo o arquivo de chave privada {key_pair_name}.ppk se existir")
            ppk_path = os.path.join(key_pair_path, f"{key_pair_name}.ppk")
            if os.path.exists(ppk_path):
                os.remove(ppk_path)
            else:
                print(f"Não existe o arquivo de chave privada {key_pair_name}.ppk")

        else:
            print(f"Não existe o par de chaves {key_pair_name}!")

    except ec2.exceptions.ClientError as e:
        if e.response['Error']['Code'] == 'InvalidKeyPair.NotFound':
            print(f"Não existe o par de chaves {key_pair_name}!")

else:
    print("Código não executado")