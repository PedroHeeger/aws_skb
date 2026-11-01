#!/usr/bin/env python3
import json
import time
import boto3
from botocore.exceptions import ClientError

# region SNS Client:
def create_sns_client(aws_profile, region):
    """Cria e retorna um cliente SNS do boto3."""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Criando o cliente SNS com o profile '{aws_profile}' e região '{region}'")
    try:
        session = boto3.Session(
            profile_name=aws_profile,
            region_name=region,
        )
        return session.client("sns")
    except Exception as e:
        print(f"Erro inesperado ao criar o cliente SNS: {e}")
# sns_client = create_sns_client(aws_profile, region)

# endregion


# region SNS Topic:
def set_sns_topic_fifo_defaults(topic_name: str, topic_arn: str, fifo_topic=None):
    """Adiciona o sufixo .fifo ao nome e ao ARN se o tópico for Fifo. Se for Standard, mantém os valores recebidos"""

    if fifo_topic == "true":
        if not topic_name.endswith(".fifo"):
            topic_name = f"{topic_name}.fifo"
        if not topic_arn.endswith(".fifo"):
            topic_arn = f"{topic_arn}.fifo"
    return {"topic_name": topic_name, "topic_arn": topic_arn}
# defaults = set_sns_topic_fifo_defaults(topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], fifo_topic=sns_topic_config.get("fifo_topic"))


def test_sns_topic_exists(sns_client, topic_name: str, topic_arn: str):
    """Verifica se existe um tópico SNS com o ARN especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o tópico {topic_name}")
    try:
        paginator = sns_client.get_paginator("list_topics")
        for page in paginator.paginate():
            for topic in page["Topics"]:
                if topic["TopicArn"] == topic_arn:
                    return topic_arn
        return ""
    except ClientError as e:
        print(f"Falha ao verificar a existência do tópico {topic_name}: {e}")
        return ""
# condition = test_sns_topic_exists(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])


def show_sns_topic_arn(sns_client, topic_name: str, topic_arn: str):
    """Exibe o ARN do tópico SNS especificado"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe o tópico {topic_name}")
    try:
        paginator = sns_client.get_paginator("list_topics")
        for page in paginator.paginate():
            for topic in page["Topics"]:
                if topic["TopicArn"] == topic_arn:
                    print(topic["TopicArn"])
    except ClientError as e:
        print(f"Falha ao exibir o tópico {topic_name}: {e}")
# show_sns_topic_arn(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])


def show_sns_topics_all(sns_client):
    """Lista o ARN de todos os tópicos SNS criados"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Listando o ARN de todos os tópicos SNS")
    try:
        paginator = sns_client.get_paginator("list_topics")
        for page in paginator.paginate():
            for topic in page["Topics"]:
                print(topic["TopicArn"])
    except ClientError as e:
        print(f"Falha ao listar os tópicos SNS: {e}")
# show_sns_topics_all(sns_client=sns_client)


def new_sns_topic(sns_client, topic_name: str, display_name: str, fifo_topic="false", content_based_deduplication="false",
                  kms_master_key_id=None, max_message_size=None, topic_arn=None, account_id=None, access_policy_file=None,
                  tag_key=None, tag_value=None):
    """Cria um novo tópico SNS"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Fazendo ajustes se o tópico for FIFO")
    attributes = {"DisplayName": display_name}
    if fifo_topic == "true":
        attributes["FifoTopic"] = "true"
        attributes["ContentBasedDeduplication"] = content_based_deduplication or "false"

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Adicionando KMS Master Key ID se fornecido")
    if kms_master_key_id:
        attributes["KmsMasterKeyId"] = kms_master_key_id

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Adicionando o tamanho máximo de mensagem se fornecido")
    if max_message_size not in (None, ""):
        try:
            size_kib = int(max_message_size)
        except (ValueError, TypeError):
            size_kib = None
        if size_kib is not None and 1 <= size_kib <= 1024:
            attributes["MaximumMessageSize"] = str(size_kib * 1024)
        else:
            print(f"\033[91mO tamanho máximo de mensagem {max_message_size} KiB é inválido (deve ser entre 1 e 1024). O tópico será criado com o padrão da AWS (256 KiB).\033[0m")

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Adicionando a access policy se fornecida")
    if access_policy_file:
        with open(access_policy_file, "r", encoding="utf-8") as f:
            policy_content = f.read().replace("<topicArn>", topic_arn or "").replace("<accountId>", account_id or "")
        attributes["Policy"] = json.dumps(json.loads(policy_content), separators=(",", ":"))

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Criando o tópico SNS {topic_name}")
    try:
        params = {"Name": topic_name, "Attributes": attributes}
        if tag_key:
            params["Tags"] = [{"Key": tag_key, "Value": tag_value or ""}]
        sns_client.create_topic(**params)
    except ClientError as e:
        print(f"Falha ao criar o tópico SNS {topic_name}: {e}")
# new_sns_topic(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], display_name=sns_topic_config["display_name"], fifo_topic=sns_topic_config.get("fifo_topic"), content_based_deduplication=sns_topic_config.get("content_based_deduplication"), kms_master_key_id=sns_topic_config.get("kms_master_key_id"), max_message_size=sns_topic_config.get("max_message_size"), topic_arn=sns_topic_config["topic_arn"], account_id=account_id, access_policy_file=sns_topic_config.get("access_policy_file"), tag_key=sns_topic_config.get("tag_key"), tag_value=sns_topic_config.get("tag_value"))


def get_sns_topic_arn(sns_client, topic_name: str, topic_arn: str):
    """Extrai o ARN de um tópico SNS específico"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando o tópico SNS {topic_name}")
    try:
        paginator = sns_client.get_paginator("list_topics")
        for page in paginator.paginate():
            for topic in page["Topics"]:
                if topic["TopicArn"] == topic_arn:
                    print(topic["TopicArn"])
    except ClientError as e:
        print(f"Falha ao obter o tópico SNS {topic_name}: {e}")
# get_sns_topic_arn(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])


def remove_sns_topic(sns_client, topic_name: str, topic_arn: str):
    """Remove definitivamente o tópico SNS"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo o tópico SNS {topic_name}")
    try:
        sns_client.delete_topic(TopicArn=topic_arn)
    except ClientError as e:
        print(f"Falha ao remover o tópico SNS {topic_name}: {e}")
# remove_sns_topic(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])

# endregion


# region SNS Subscription:
def test_sns_subscription_protocol(sns_client, topic_name: str, topic_arn: str, protocol: str):
    """Verifica se o protocolo informado é permitido para o tipo do tópico (FIFO ou Standard) e o tamanho máximo de mensagem"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando o tipo do tópico {topic_name} e os protocolos permitidos")
    try:
        topic_attributes = sns_client.get_topic_attributes(TopicArn=topic_arn)["Attributes"]
    except ClientError as e:
        print(f"\033[91mFalha ao verificar o tipo do tópico {topic_name}: {e}\033[0m")
        return ""

    # Tamanho máximo em bytes; se a AWS não retornar o atributo, considera o padrão de 256 KiB (262144)
    try:
        max_message_size = int(topic_attributes.get("MaximumMessageSize", 262144))
    except (ValueError, TypeError):
        max_message_size = 262144

    if topic_attributes.get("FifoTopic") == "true":
        topic_type = "FIFO"; allowed_protocols = ["sqs"]
    elif max_message_size > 262144:
        topic_type = "Standard (acima de 256 KiB)"; allowed_protocols = ["sqs", "lambda"]
    else:
        topic_type = "Standard"; allowed_protocols = ["email", "email-json", "sms", "http", "https", "sqs", "lambda", "application"]
    print(f"O tópico {topic_name} é do tipo {topic_type} e aceita os protocolos: {', '.join(allowed_protocols)}")

    if protocol in allowed_protocols:
        return protocol
    return ""
# condition = test_sns_subscription_protocol(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], protocol=sns_subscription_config["protocol"])


def test_sns_subscription_exists(sns_client, topic_name: str, topic_arn: str, sns_endpoint: str, sns_endpoint_name: str):
    """Verifica se existe uma subscrição confirmada com o endpoint especificado no tópico SNS (funciona mesmo se o tópico não existir mais)"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe a subscrição de endpoint {sns_endpoint_name} para o tópico {topic_name}")
    try:
        paginator = sns_client.get_paginator("list_subscriptions")
        for page in paginator.paginate():
            for subscription in page["Subscriptions"]:
                if subscription["TopicArn"] == topic_arn and subscription["Endpoint"] == sns_endpoint and subscription["SubscriptionArn"].startswith("arn:"):
                    return subscription["Endpoint"]
        return ""
    except ClientError as e:
        print(f"Falha ao verificar a subscrição do endpoint {sns_endpoint_name}: {e}")
        return ""
# condition = test_sns_subscription_exists(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], sns_endpoint=sns_subscription_config["sns_endpoint"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"])


def show_sns_subscription_endpoint(sns_client, topic_name: str, topic_arn: str, sns_endpoint: str, sns_endpoint_name: str):
    """Exibe o endpoint da subscrição especificada no tópico SNS"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Já existe a subscrição de endpoint {sns_endpoint_name} para o tópico {topic_name}")
    try:
        paginator = sns_client.get_paginator("list_subscriptions")
        for page in paginator.paginate():
            for subscription in page["Subscriptions"]:
                if subscription["TopicArn"] == topic_arn and subscription["Endpoint"] == sns_endpoint:
                    print(subscription["Endpoint"])
    except ClientError as e:
        print(f"Falha ao exibir a subscrição do endpoint {sns_endpoint_name}: {e}")
# show_sns_subscription_endpoint(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], sns_endpoint=sns_subscription_config["sns_endpoint"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"])


def show_sns_subscriptions_all(sns_client, topic_name: str, topic_arn: str):
    """Lista o endpoint de todas as subscrições do tópico SNS"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Listando o endpoint de todas as subscrições do tópico {topic_name}")
    try:
        paginator = sns_client.get_paginator("list_subscriptions")
        for page in paginator.paginate():
            for subscription in page["Subscriptions"]:
                if subscription["TopicArn"] == topic_arn:
                    print(subscription["Endpoint"])
    except ClientError as e:
        print(f"Falha ao listar as subscrições do tópico {topic_name}: {e}")
# show_sns_subscriptions_all(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"])


def new_sns_subscription(sns_client, topic_name: str, topic_arn: str, protocol: str, sns_endpoint: str, sns_endpoint_name: str,
                         dlq_arn=None, filter_policy_scope=None, filter_policy_file=None, filter_policy_document=None,
                         raw_message_delivery=None):
    """Cria uma subscrição no tópico SNS e aguarda confirmação do endpoint"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print("Montando os atributos opcionais da subscrição")
    attributes = {}
    if dlq_arn:
        attributes["RedrivePolicy"] = json.dumps({"deadLetterTargetArn": dlq_arn}, separators=(",", ":"))

    filter_policy = None
    if filter_policy_file:
        with open(filter_policy_file, "r", encoding="utf-8") as f:
            filter_policy = json.dumps(json.load(f), separators=(",", ":"))
    elif filter_policy_document:
        filter_policy = filter_policy_document
    if filter_policy:
        attributes["FilterPolicy"] = filter_policy
        if filter_policy_scope:
            attributes["FilterPolicyScope"] = filter_policy_scope

    if raw_message_delivery == "true":
        if protocol in ("http", "https", "sqs"):
            attributes["RawMessageDelivery"] = "true"
        else:
            print(f"\033[91mRaw message delivery não é suportado para o protocolo {protocol} (apenas http, https e sqs). A subscrição será criada sem ele.\033[0m")

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Criando a subscrição de endpoint {sns_endpoint_name} para o tópico {topic_name}")
    try:
        params = {"TopicArn": topic_arn, "Protocol": protocol, "Endpoint": sns_endpoint}
        if attributes:
            params["Attributes"] = attributes
        sns_client.subscribe(**params)
    except ClientError as e:
        print(f"Falha ao criar a subscrição do endpoint {sns_endpoint_name}: {e}")
        return

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Aguardando confirmação do endpoint {sns_endpoint_name}")
    while True:
        print(f"Confirme o endpoint {sns_endpoint_name} da subscrição e aguarde...")
        time.sleep(10)
        status = None
        try:
            paginator = sns_client.get_paginator("list_subscriptions_by_topic")
            for page in paginator.paginate(TopicArn=topic_arn):
                for subscription in page["Subscriptions"]:
                    if subscription["Endpoint"] == sns_endpoint:
                        status = subscription["SubscriptionArn"]
        except ClientError as e:
            print(f"Falha ao verificar a confirmação do endpoint {sns_endpoint_name}: {e}")
            break
        if status != "PendingConfirmation":
            break
    print("Subscrição confirmada.")
# new_sns_subscription(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], protocol=sns_subscription_config["protocol"], sns_endpoint=sns_subscription_config["sns_endpoint"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"], dlq_arn=sns_subscription_config.get("dlq_arn"), filter_policy_scope=sns_subscription_config.get("filter_policy_scope"), filter_policy_file=sns_subscription_config.get("filter_policy_file"), filter_policy_document=sns_subscription_config.get("filter_policy_document"), raw_message_delivery=sns_subscription_config.get("raw_message_delivery"))


def get_sns_subscription_arn(sns_client, topic_name: str, topic_arn: str, sns_endpoint: str, sns_endpoint_name: str):
    """Extrai o ARN da subscrição pelo endpoint no tópico SNS"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Extraindo o ARN da subscrição de endpoint {sns_endpoint_name} do tópico {topic_name}")
    try:
        paginator = sns_client.get_paginator("list_subscriptions")
        for page in paginator.paginate():
            for subscription in page["Subscriptions"]:
                if subscription["TopicArn"] == topic_arn and subscription["Endpoint"] == sns_endpoint and subscription["SubscriptionArn"].startswith("arn:"):
                    return subscription["SubscriptionArn"]
        return ""
    except ClientError as e:
        print(f"Falha ao obter o ARN da subscrição do endpoint {sns_endpoint_name}: {e}")
        return ""
# subscription_arn = get_sns_subscription_arn(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], topic_arn=sns_topic_config["topic_arn"], sns_endpoint=sns_subscription_config["sns_endpoint"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"])


def remove_sns_subscription(sns_client, topic_name: str, sns_endpoint_name: str, subscription_arn: str):
    """Remove a subscrição do tópico SNS pelo ARN"""

    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Removendo a subscrição de endpoint {sns_endpoint_name} do tópico {topic_name}")
    try:
        sns_client.unsubscribe(SubscriptionArn=subscription_arn)
    except ClientError as e:
        print(f"Falha ao remover a subscrição do endpoint {sns_endpoint_name}: {e}")
# remove_sns_subscription(sns_client=sns_client, topic_name=sns_topic_config["topic_name"], sns_endpoint_name=sns_subscription_config["sns_endpoint_name"], subscription_arn=subscription_arn)

# endregion
