#!/usr/bin/env python3
import sys
import time

try:
    from pathlib import Path
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
    from identity_variables import aws_profile, region, inst_prof_config
    from identity_functions import *
except Exception as e:
    import traceback
    traceback.print_exc()
    sys.exit(1)


def Show_Menu():
    print("***********************************************")
    print(" AWS - IDENTITY - PROVISIONAMENTO - IAM INSTANCE PROFILE ")
    print("***********************************************")
    print(f"1) Criar Instance Profile ({inst_prof_config['inst_prof_name']})")
    print(f"2) Excluir Instance Profile ({inst_prof_config['inst_prof_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()
    if selection == "1":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_instance_profile_exists(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])
        if len(condition) > 0:
            show_instance_profile_name(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])
        else:
            show_instance_profiles_all(iam_client=iam_client)
            new_instance_profile(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"], tag_key=inst_prof_config["tag_key"], tag_value=inst_prof_config["tag_value"])
            get_instance_profile_name(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])

    elif selection == "2":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_instance_profile_exists(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])
        if len(condition) > 0:
            show_instance_profiles_all(iam_client=iam_client)
            disconnect_instance_profile_role(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])
            remove_instance_profile(iam_client=iam_client, inst_prof_name=inst_prof_config["inst_prof_name"])
            show_instance_profiles_all(iam_client=iam_client)
        else:
            print(f"Não existe o instance profile do IAM {inst_prof_config['inst_prof_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        # Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)
