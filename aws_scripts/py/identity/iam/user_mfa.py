#!/usr/bin/env python3
import sys
import time

try:
    from pathlib import Path
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
    from identity_variables import aws_profile, region, iam_user_config, iam_mfa_device_config
    from identity_functions import *
except Exception as e:
    import traceback
    traceback.print_exc()
    sys.exit(1)


def Show_Menu():
    print("***********************************************")
    print(" AWS - IDENTITY - PROVISIONAMENTO - IAM USER MFA ")
    print("***********************************************")
    print(f"1) Adicionar o dispositivo MFA ({iam_mfa_device_config['device_name']}) para o usuário ({iam_user_config['user_name']})")
    print(f"2) Excluir o dispositivo MFA ({iam_mfa_device_config['device_name']}) do usuário ({iam_user_config['user_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()
    if selection == "1":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_user_and_mfa_device_exists(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])
        if condition:
            condition = test_iam_user_mfa_attached(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])
            if len(condition) > 0:
                show_iam_user_mfa(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])
            else:
                show_iam_user_mfa_devices_all(iam_client=iam_client, user_name=iam_user_config["user_name"])
                enable_iam_user_mfa_device(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])
                get_iam_user_mfa(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])
        else:
            print(f"Não existe o usuário do IAM {iam_user_config['user_name']} ou o dispositivo MFA {iam_mfa_device_config['device_name']}")

    elif selection == "2":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_user_and_mfa_device_exists(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])
        if condition:
            condition = test_iam_user_mfa_attached(iam_client=iam_client, user_name=iam_user_config["user_name"], device_name=iam_mfa_device_config["device_name"])
            if len(condition) > 0:
                show_iam_user_mfa_devices_all(iam_client=iam_client, user_name=iam_user_config["user_name"])
                device_arn = get_iam_mfa_device_arn(iam_client=iam_client, device_name=iam_mfa_device_config["device_name"])
                disconnect_iam_mfa_user(iam_client=iam_client, device_name=iam_mfa_device_config["device_name"], device_arn=device_arn)
                show_iam_user_mfa_devices_all(iam_client=iam_client, user_name=iam_user_config["user_name"])
            else:
                print(f"Não existe o dispositivo MFA {iam_mfa_device_config['device_name']} associado ao usuário do IAM {iam_user_config['user_name']}")
        else:
            print(f"Não existe o usuário do IAM {iam_user_config['user_name']} ou o dispositivo MFA {iam_mfa_device_config['device_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        # Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)
        