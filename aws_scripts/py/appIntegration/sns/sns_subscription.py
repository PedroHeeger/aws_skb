#!/usr/bin/env python3
import sys
import time

try:
    from pathlib import Path
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
    from appIntegration_variables import aws_profile, region, sns_topic_config, sns_subscription_config
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
    print(" AWS - APP INTEGRATION - PROVISIONAMENTO - SNS SUBSCRIPTION ")
    print("***********************************************")
    print(f"1) Criar Subscrição ({sns_subscription_config['sns_endpoint_name']}) no Tópico ({sns_topic_config['topic_name']})")
    print(f"2) Excluir Subscrição ({sns_subscription_config['sns_endpoint_name']}) do Tópico ({sns_topic_config['topic_name']})")
    print("3) Sair")
    print("***********************************************")


while True:
    Show_Menu()
    selection = input("Escolha uma opção: ").strip()

    if selection == "1":
        sns_client = create_sns_client(aws_profile, region)
        condition = test_sns_topic_exists(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])
        if len(condition) > 0:
            condition = test_sns_subscription_protocol(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], protocol=sns_subscription_config["protocol"])
            if len(condition) > 0:
                condition = test_sns_subscription_exists(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], sns_endpoint=sns_subscription_config["sns_endpoint"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"])
                if len(condition) > 0:
                    show_sns_subscription_endpoint(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], sns_endpoint=sns_subscription_config["sns_endpoint"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"])
                else:
                    show_sns_subscriptions_all(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])
                    new_sns_subscription(
                        sns_client=sns_client,
                        topic_name=sns_topic_config["topic_name"],
                        topic_arn=sns_topic_config["topic_arn"],
                        protocol=sns_subscription_config["protocol"],
                        sns_endpoint=sns_subscription_config["sns_endpoint"],
                        sns_endpoint_name=sns_subscription_config["sns_endpoint_name"],
                        dlq_arn=sns_subscription_config.get("dlq_arn"),
                        filter_policy_scope=sns_subscription_config.get("filter_policy_scope"),
                        filter_policy_file=sns_subscription_config.get("filter_policy_file"),
                        filter_policy_document=sns_subscription_config.get("filter_policy_document"),
                        raw_message_delivery=sns_subscription_config.get("raw_message_delivery")
                    )
                    print(get_sns_subscription_arn(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], sns_endpoint=sns_subscription_config["sns_endpoint"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"]))
            else:
                print(f"O protocolo {sns_subscription_config['protocol']} não é permitido para o tópico {sns_topic_config['topic_name']}")
        else:
            print(f"Não existe o tópico SNS {sns_topic_config['topic_name']}")

    elif selection == "2":
        sns_client = create_sns_client(aws_profile, region)
        condition = test_sns_subscription_exists(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], sns_endpoint=sns_subscription_config["sns_endpoint"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"])
        if len(condition) > 0:
            show_sns_subscriptions_all(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])
            subscription_arn = get_sns_subscription_arn(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], sns_endpoint=sns_subscription_config["sns_endpoint"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"])
            remove_sns_subscription(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"], subscription_arn=subscription_arn)
            show_sns_subscriptions_all(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])
        else:
            print(f"Não existe a subscrição de endpoint {sns_subscription_config['sns_endpoint_name']} para o tópico {sns_topic_config['topic_name']}")

    elif selection == "3":
        print("Saindo...")
        break

    else:
        print("\033[91mOpção inválida, tente novamente.\033[0m")
        time.sleep(2)
