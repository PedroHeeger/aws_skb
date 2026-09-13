#!/usr/bin/env python3
import sys
import time

try:
    from pathlib import Path
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
    from identity_variables import aws_profile, region, iam_user_config, iam_user_key_access_config
    from identity_functions import *
except Exception as e:
    import traceback
    traceback.print_exc()
    sys.exit(1)


def Show_Menu():
    print("***********************************************")
    print(" AWS - IDENTITY - PROVISIONAMENTO - IAM USER ")
    print("***********************************************")
    print(f"1) Criar Usuário ({iam_user_config['user_name']})")
    print(f"2) Excluir Usuário ({iam_user_config['user_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()
    if selection == "1":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_user_exists(iam_client=iam_client, user_name=iam_user_config["user_name"])
        if len(condition) > 0:
            show_iam_user_name(iam_client=iam_client, user_name=iam_user_config["user_name"])
        else:
            show_iam_users_all(iam_client=iam_client)
            new_iam_user(iam_client=iam_client, user_name=iam_user_config["user_name"], tag_key=iam_user_config["tag_key"], tag_value=iam_user_config["tag_value"])
            new_iam_login_profile(iam_client=iam_client, user_name=iam_user_config["user_name"], user_password=iam_user_config["user_password"])
            get_iam_user_name(iam_client=iam_client, user_name=iam_user_config["user_name"])

    elif selection == "2":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_user_exists(iam_client=iam_client, user_name=iam_user_config["user_name"])
        if len(condition) > 0:
            show_iam_users_all(iam_client=iam_client)
            remove_iam_user_groups_all(iam_client=iam_client, user_name=iam_user_config["user_name"])
            disconnect_iam_user_policies_all(iam_client=iam_client, user_name=iam_user_config["user_name"])
            remove_iam_user_mfa_all(iam_client=iam_client, user_name=iam_user_config["user_name"])
            remove_iam_user_key_accesses_all(iam_client=iam_client, user_name=iam_user_config["user_name"], key_access_path=iam_user_key_access_config["key_access_path"], key_access_file=iam_user_key_access_config["key_access_file"])
            remove_iam_login_profile(iam_client=iam_client, user_name=iam_user_config["user_name"])
            remove_iam_user(iam_client=iam_client, user_name=iam_user_config["user_name"])
            show_iam_users_all(iam_client=iam_client)
        else:
            print(f"Não existe o usuário do IAM {iam_user_config['user_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        # Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)