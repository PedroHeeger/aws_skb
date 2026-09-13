#!/usr/bin/env python3
import sys
import time

try:
    from pathlib import Path
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
    from identity_variables import aws_profile, region, iam_group_config, iam_user_config
    from identity_functions import *
except Exception as e:
    import traceback
    traceback.print_exc()
    sys.exit(1)


def Show_Menu():
    print("***********************************************")
    print(" AWS - IDENTITY - PROVISIONAMENTO - IAM USER GROUP ")
    print("***********************************************")
    print(f"1) Adicionar o usuário ({iam_user_config['user_name']}) ao grupo ({iam_group_config['group_name']})")
    print(f"2) Excluir o usuário ({iam_user_config['user_name']}) do grupo ({iam_group_config['group_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()
    if selection == "1":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_group_and_user_exists(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])
        if condition:
            condition = test_iam_group_user_attached(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])
            if len(condition) > 0:
                show_iam_group_user(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])
            else:
                show_iam_group_users_all(iam_client=iam_client, group_name=iam_group_config["group_name"])
                add_iam_group_user(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])
                get_iam_group_user(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])
        else:
            print(f"Não existe o grupo do IAM {iam_group_config['group_name']} ou o usuário {iam_user_config['user_name']}")

    elif selection == "2":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_group_and_user_exists(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])
        if condition:
            condition = test_iam_group_user_attached(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])
            if len(condition) > 0:
                show_iam_group_users_all(iam_client=iam_client, group_name=iam_group_config["group_name"])
                remove_iam_group_user(iam_client=iam_client, group_name=iam_group_config["group_name"], user_name=iam_user_config["user_name"])
                show_iam_group_users_all(iam_client=iam_client, group_name=iam_group_config["group_name"])
            else:
                print(f"Não existe o usuário {iam_user_config['user_name']} no grupo {iam_group_config['group_name']}")
        else:
            print(f"Não existe o grupo do IAM {iam_group_config['group_name']} ou o usuário {iam_user_config['user_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        # Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)
