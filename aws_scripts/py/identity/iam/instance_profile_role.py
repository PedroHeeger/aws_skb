#!/usr/bin/env python3
import sys
import time

try:
    from pathlib import Path
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
    from identity_variables import aws_profile, region, inst_prof_config, iam_role_config
    from identity_functions import *
except Exception as e:
    import traceback
    traceback.print_exc()
    sys.exit(1)


def Show_Menu():
    print("***********************************************")
    print(" AWS - IDENTITY - PROVISIONAMENTO - IAM INSTANCE PROFILE ROLE ")
    print("***********************************************")
    print(f"1) Adicionar a role ({iam_role_config['role_name']}) ao instance profile ({inst_prof_config['inst_prof_name']})")
    print(f"2) Excluir a role ({iam_role_config['role_name']}) do instance profile ({inst_prof_config['inst_prof_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()
    if selection == "1":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_inst_prof_and_role_exists(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])
        if condition:
            condition = test_iam_inst_prof_role_attached(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])
            if len(condition) > 0:
                show_iam_inst_prof_role(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])
            else:
                show_iam_inst_prof_roles_all(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])
                add_role_to_instance_profile(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])
                get_iam_inst_prof_role(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])
        else:
            print(f"Não existe o instance profile {inst_prof_config['inst_prof_name']} ou a role {iam_role_config['role_name']}")

    elif selection == "2":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_inst_prof_and_role_exists(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])
        if condition:
            condition = test_iam_inst_prof_role_attached(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])
            if len(condition) > 0:
                show_iam_inst_prof_roles_all(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])
                remove_iam_instance_profile_role(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], role_name=iam_role_config["role_name"])
                show_iam_inst_prof_roles_all(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])
            else:
                print(f"Não existe a role {iam_role_config['role_name']} no instance profile {inst_prof_config['inst_prof_name']}")
        else:
            print(f"Não existe o instance profile {inst_prof_config['inst_prof_name']} ou a role {iam_role_config['role_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        # Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)
