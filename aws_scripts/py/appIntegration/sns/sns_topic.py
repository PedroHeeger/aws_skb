#!/usr/bin/env python3
import sys
import time

try:
    from pathlib import Path
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
    from appIntegration_variables import aws_profile, region, account_id, sns_topic_config
    from appIntegration_functions import *
except Exception as e:
    import traceback
    traceback.print_exc()
    sys.exit(1)


defaults = set_sns_topic_fifo_defaults(topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], fifo_topic=sns_topic_config.get("fifo_topic"))
sns_topic_config["topic_name"] = defaults["topic_name"]
sns_topic_config["topic_arn"]  = defaults["topic_arn"]


def Show_Menu():
    print("***********************************************")
    print(" AWS - APP INTEGRATION - PROVISIONAMENTO - SNS TOPIC ")
    print("***********************************************")
    print(f"1) Criar Tópico SNS ({sns_topic_config['topic_name']})")
    print(f"2) Excluir Tópico SNS ({sns_topic_config['topic_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()

    if selection == "1":
        sns_client = create_sns_client(aws_profile, region)
        condition = test_sns_topic_exists(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])
        if len(condition) > 0:
            show_sns_topic_arn(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])
        else:
            show_sns_topics_all(sns_client=sns_client)
            new_sns_topic(
                sns_client=sns_client,
                topic_name=sns_topic_config["topic_name"],
                display_name=sns_topic_config["display_name"],
                fifo_topic=sns_topic_config.get("fifo_topic"),
                content_based_deduplication=sns_topic_config.get("content_based_deduplication"),
                kms_master_key_id=sns_topic_config.get("kms_master_key_id"),
                max_message_size=sns_topic_config.get("max_message_size"),
                topic_arn=sns_topic_config["topic_arn"],
                account_id=account_id,
                access_policy_file=sns_topic_config.get("access_policy_file"),
                tag_key=sns_topic_config.get("tag_key"),
                tag_value=sns_topic_config.get("tag_value")
            )
            get_sns_topic_arn(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])

    elif selection == "2":
        sns_client = create_sns_client(aws_profile, region)
        condition = test_sns_topic_exists(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])
        if len(condition) > 0:
            show_sns_topics_all(sns_client=sns_client)
            remove_sns_topic(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])
            show_sns_topics_all(sns_client=sns_client)
        else:
            print(f"Não existe o tópico SNS {sns_topic_config['topic_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)
