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
    print(" AWS - IDENTITY - PROVISIONAMENTO - IAM USER KEY ACCESS ")
    print("***********************************************")
    print(f"1) Criar chave de acesso ({iam_user_config['user_name']})")
    print(f"2) Excluir chave de acesso ({iam_user_config['user_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()

    if selection == "1":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_user_exists(iam_client=iam_client, user_name=iam_user_config["user_name"])
        if len(condition) > 0:
            condition = test_iam_user_key_access_exists(iam_client=iam_client, user_name=iam_user_config["user_name"])
            if len(condition) > 0:
                show_iam_user_key_access_id(iam_client=iam_client, user_name=iam_user_config["user_name"])
            else:
                show_iam_user_key_accesses_all(iam_client=iam_client, user_name=iam_user_config["user_name"])
                new_iam_user_key_access(
                    iam_client=iam_client,
                    user_name=iam_user_config["user_name"],
                    key_access_path=iam_user_key_access_config["key_access_path"],
                    key_access_file=iam_user_key_access_config["key_access_file"]
                )
                print(get_iam_user_key_access_id(iam_client=iam_client, user_name=iam_user_config["user_name"]))
        else:
            print(f"Não existe o usuário do IAM {iam_user_config['user_name']}")

    elif selection == "2":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_user_exists(iam_client=iam_client, user_name=iam_user_config["user_name"])
        if len(condition) > 0:
            condition = test_iam_user_key_access_exists(iam_client=iam_client, user_name=iam_user_config["user_name"])
            if len(condition) > 0:
                show_iam_user_key_accesses_all(iam_client=iam_client, user_name=iam_user_config["user_name"])
                key_access_id = get_iam_user_key_access_id(iam_client=iam_client, user_name=iam_user_config["user_name"])
                remove_iam_user_key_access(
                    iam_client=iam_client,
                    user_name=iam_user_config["user_name"],
                    key_access_id=key_access_id,
                    key_access_path=iam_user_key_access_config["key_access_path"],
                    key_access_file=iam_user_key_access_config["key_access_file"]
                )
                show_iam_user_key_accesses_all(iam_client=iam_client, user_name=iam_user_config["user_name"])
            else:
                print(f"Não existe chave de acesso para o usuário do IAM {iam_user_config['user_name']}")
        else:
            print(f"Não existe o usuário do IAM {iam_user_config['user_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)