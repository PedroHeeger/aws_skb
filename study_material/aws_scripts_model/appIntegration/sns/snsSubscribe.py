import boto3
import time

print("***********************************************")
print("SERVIÇO: AMAZON SNS")
print("SUBSCRIPTION CREATION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
topic_name = "snsTopicTest1"
region = "us-east-1"
account_id = "001727357081"
topic_arn = f"arn:aws:sns:{region}:{account_id}:{topic_name}"
protocol = "email"
notification_endpoint = "phcstudy@proton.me"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ").lower()
if resposta == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o tópico {topic_name}")
    sns = boto3.client('sns', region_name=region)
    response = sns.list_topics()

    topics = response.get('Topics', [])
    topic_exists = any(topic['TopicArn'] == topic_arn for topic in topics)
    if topic_exists:
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Verificando se existe a subscrição de endpoint {notification_endpoint} para o tópico {topic_name}")
        response = sns.list_subscriptions_by_topic(TopicArn=topic_arn)
        
        subscriptions = response.get('Subscriptions', [])
        subscription_exists = any(sub['Endpoint'] == notification_endpoint for sub in subscriptions)
        if subscription_exists:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Já existe a subscrição de endpoint {notification_endpoint} para o tópico {topic_name}")
            for sub in subscriptions:
                if sub['Endpoint'] == notification_endpoint:
                    print(sub['Endpoint'])
        else:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Listando o endpoint de todas as subscrições do tópico {topic_name}")
            for sub in subscriptions:
                print(sub['Endpoint'])

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Criando a subscrição de endpoint {notification_endpoint} para o tópico {topic_name}")
            sns.subscribe(
                TopicArn=topic_arn,
                Protocol=protocol,
                Endpoint=notification_endpoint
            )

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Verificando se o endpoint {notification_endpoint} da subscrição para o tópico {topic_name} já foi confirmada")
            while True:
                print(f"Confirme o endpoint {notification_endpoint} da subscrição")
                time.sleep(10)
                response = sns.list_subscriptions_by_topic(TopicArn=topic_arn)
                subscriptions = response.get('Subscriptions', [])
                subscription = next((sub for sub in subscriptions if sub['Endpoint'] == notification_endpoint), None)
                if subscription and subscription.get('SubscriptionArn') != 'PendingConfirmation':
                    break

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Listando a subscrição de endpoint {notification_endpoint} para o tópico {topic_name}")
            response = sns.list_subscriptions_by_topic(TopicArn=topic_arn)
            subscriptions = response.get('Subscriptions', [])
            for sub in subscriptions:
                if sub['Endpoint'] == notification_endpoint:
                    print(sub['Endpoint'])
    else:
        print(f"Não existe o tópico {topic_name}")
else:
    print("Código não executado")




import boto3

print("***********************************************")
print("SERVIÇO: AMAZON SNS")
print("SUBSCRIPTION EXCLUSION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
topic_name = "snsTopicTest1"
region = "us-east-1"
account_id = "001727357081"
topic_arn = f"arn:aws:sns:{region}:{account_id}:{topic_name}"
protocol = "email"
notification_endpoint = "phcstudy@proton.me"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ").lower()
if resposta == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o tópico {topic_name}")
    sns = boto3.client('sns', region_name=region)
    response = sns.list_topics()

    topics = response.get('Topics', [])
    topic_exists = any(topic['TopicArn'] == topic_arn for topic in topics)
    if topic_exists:
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Verificando se existe a subscrição de endpoint {notification_endpoint} para o tópico {topic_name}")
        response = sns.list_subscriptions_by_topic(TopicArn=topic_arn)

        subscriptions = response.get('Subscriptions', [])
        subscription_exists = any(sub['Endpoint'] == notification_endpoint for sub in subscriptions)
        if subscription_exists:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Listando o endpoint de todas as subscrições do tópico {topic_name}")
            for sub in subscriptions:
                print(sub['Endpoint'])

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Extraindo a ARN da subscrição de endpoint {notification_endpoint} do tópico {topic_name}")
            subscription_arn = next(
                (sub['SubscriptionArn'] for sub in subscriptions if sub['Endpoint'] == notification_endpoint), 
                None
            )

            if subscription_arn:
                print("-----//-----//-----//-----//-----//-----//-----")
                print(f"Removendo a subscrição de endpoint {notification_endpoint} para o tópico {topic_name}")
                sns.unsubscribe(SubscriptionArn=subscription_arn)

            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Listando o endpoint de todas as subscrições do tópico {topic_name}")
            response = sns.list_subscriptions_by_topic(TopicArn=topic_arn)
            subscriptions = response.get('Subscriptions', [])
            for sub in subscriptions:
                print(sub['Endpoint'])
        else:
            print(f"Não existe a subscrição de endpoint {notification_endpoint} para o tópico {topic_name}")
    else:
        print(f"Não existe o tópico {topic_name}")            
else:
    print("Código não executado")