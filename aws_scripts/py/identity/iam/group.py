#!/usr/bin/env python3
import sys
import time

try:
    from pathlib import Path
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
    from identity_variables import aws_profile, region, iam_group_config
    from identity_functions import *
except Exception as e:
    import traceback
    traceback.print_exc()
    sys.exit(1)


def Show_Menu():
    print("***********************************************")
    print(" AWS - IDENTITY - PROVISIONAMENTO - IAM GROUP ")
    print("***********************************************")
    print(f"1) Criar Grupo ({iam_group_config['group_name']})")
    print(f"2) Excluir Grupo ({iam_group_config['group_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()
    if selection == "1":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_group_exists(iam_client=iam_client, group_name=iam_group_config["group_name"])
        if len(condition) > 0:
            show_iam_group_name(iam_client=iam_client, group_name=iam_group_config["group_name"])
        else:
            show_iam_groups_all(iam_client=iam_client)
            new_iam_group(iam_client=iam_client, group_name=iam_group_config["group_name"])
            get_iam_group_name(iam_client=iam_client, group_name=iam_group_config["group_name"])

    elif selection == "2":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_group_exists(iam_client=iam_client, group_name=iam_group_config["group_name"])
        if len(condition) > 0:
            show_iam_groups_all(iam_client=iam_client)
            remove_iam_group_users_all(iam_client=iam_client, group_name=iam_group_config["group_name"])
            disconnect_iam_group_policies_all(iam_client=iam_client, group_name=iam_group_config["group_name"])
            remove_iam_group(iam_client=iam_client, group_name=iam_group_config["group_name"])
            show_iam_groups_all(iam_client=iam_client)
        else:
            print(f"Não existe o grupo do IAM {iam_group_config['group_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        # Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)