#!/usr/bin/env python3
import sys
import time

try:
    from pathlib import Path
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
    from identity_variables import aws_profile, region, iam_role_config
    from identity_functions import *
except Exception as e:
    import traceback
    traceback.print_exc()
    sys.exit(1)


def Show_Menu():
    print("***********************************************")
    print(" AWS - IDENTITY - PROVISIONAMENTO - IAM ROLE  ")
    print("***********************************************")
    print(f"1) Criar Role ({iam_role_config['role_name']})")
    print(f"2) Excluir Role ({iam_role_config['role_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()
    if selection == "1":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_role_exists(iam_client=iam_client, role_name=iam_role_config["role_name"])
        if len(condition) > 0:
            show_iam_role_name(iam_client=iam_client, role_name=iam_role_config["role_name"])
        else:
            show_iam_roles_all(iam_client=iam_client)
            new_iam_role(
                iam_client=iam_client,
                role_name=iam_role_config["role_name"],
                role_description=iam_role_config["role_description"],
                trust_policy_file=iam_role_config["trust_policy_file"],
                trust_policy_document=iam_role_config["trust_policy_document"],
                tag_key=iam_role_config["tag_key"],
                tag_value=iam_role_config["tag_value"]
            )
            get_iam_role_name(iam_client=iam_client, role_name=iam_role_config["role_name"])

    elif selection == "2":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_role_exists(iam_client=iam_client, role_name=iam_role_config["role_name"])
        if len(condition) > 0:
            show_iam_roles_all(iam_client=iam_client)
            disconnect_iam_role_instance_profiles_all(iam_client=iam_client, role_name=iam_role_config["role_name"])
            disconnect_iam_role_policies_all(iam_client=iam_client, role_name=iam_role_config["role_name"])
            remove_iam_role(iam_client=iam_client, role_name=iam_role_config["role_name"])
            show_iam_roles_all(iam_client=iam_client)
        else:
            print(f"Não existe a role do IAM {iam_role_config['role_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        # Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)