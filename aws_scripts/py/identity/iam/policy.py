#!/usr/bin/env python3
import sys
import time

try:
    from pathlib import Path
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
    from identity_variables import aws_profile, region, iam_policy_config
    from identity_functions import *
except Exception as e:
    import traceback
    traceback.print_exc()
    sys.exit(1)


def Show_Menu():
    print("***********************************************")
    print(" AWS - IDENTITY - PROVISIONAMENTO - IAM POLICY")
    print("***********************************************")
    print(f"1) Criar Policy ({iam_policy_config['policy_name']})")
    print(f"2) Excluir Policy ({iam_policy_config['policy_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()
    if selection == "1":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_policy_exists(iam_client=iam_client, policy_name=iam_policy_config["policy_name"])
        if len(condition) > 0:
            show_iam_policy_name(iam_client=iam_client, policy_name=iam_policy_config["policy_name"])
        else:
            show_iam_policies_all(iam_client=iam_client)
            new_iam_policy(
                iam_client=iam_client,
                policy_name=iam_policy_config["policy_name"],
                policy_description=iam_policy_config["policy_description"],
                policy_file=iam_policy_config["policy_file"],
                policy_document=iam_policy_config["policy_document"],
                tag_key=iam_policy_config["tag_key"],
                tag_value=iam_policy_config["tag_value"]
            )
            get_iam_policy_name(iam_client=iam_client, policy_name=iam_policy_config["policy_name"])

    elif selection == "2":
        iam_client = create_iam_client(aws_profile, region)
        condition = test_iam_policy_exists(iam_client=iam_client, policy_name=iam_policy_config["policy_name"])
        if len(condition) > 0:
            show_iam_policies_all(iam_client=iam_client)
            policy_arn = get_iam_policy_arn(iam_client=iam_client, policy_name=iam_policy_config["policy_name"])
            disconnect_iam_policy_users(iam_client=iam_client, policy_name=iam_policy_config["policy_name"], policy_arn=policy_arn)
            disconnect_iam_policy_groups(iam_client=iam_client, policy_name=iam_policy_config["policy_name"], policy_arn=policy_arn)
            disconnect_iam_policy_roles(iam_client=iam_client, policy_name=iam_policy_config["policy_name"], policy_arn=policy_arn)
            remove_iam_policy(iam_client=iam_client, policy_arn=policy_arn)
            show_iam_policies_all(iam_client=iam_client)
        else:
            print(f"Não existe a policy do IAM {iam_policy_config['policy_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        # Default { Write-Host "Opção inválida, tente novamente." -ForegroundColor Red; Start-Sleep -Seconds 2 }
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)
