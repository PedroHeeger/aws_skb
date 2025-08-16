import boto3

print("***********************************************")
print("SERVIÇO: AMAZON SNS")
print("TOPIC CREATION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
topic_name = "snsTopicTest1"
display_name = "SNS Topic Test 1"
region = "us-east-1"
account_id = "001727357081"
topic_arn = f"arn:aws:sns:{region}:{account_id}:{topic_name}"

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
        print(f"Já existe o tópico {topic_name}")
        print(topic_arn)
    else:
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o ARN de todos os tópicos")
        for topic in topics:
            print(topic['TopicArn'])
        
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando o tópico {topic_name}")
        sns.create_topic(Name=topic_name, Attributes={'DisplayName': display_name})

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Listando o tópico {topic_name}")
        response = sns.list_topics()
        topics = response.get('Topics', [])
        topic_exists = any(topic['TopicArn'] == topic_arn for topic in topics)
        if topic_exists:
            print(topic_arn)
else:
    print("Código não executado")




import boto3

print("***********************************************")
print("SERVIÇO: AMAZON SNS")
print("TOPIC EXCLUSION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
topic_name = "snsTopicTest1"
region = "us-east-1"
account_id = "001727357081"
topic_arn = f"arn:aws:sns:{region}:{account_id}:{topic_name}"

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
        print("Listando o ARN de todos os tópicos")
        for topic in topics:
            print(topic['TopicArn'])
        
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo o tópico {topic_name}")
        sns.delete_topic(TopicArn=topic_arn)

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o ARN de todos os tópicos")
        response = sns.list_topics
    else:
        print(f"Não existe o tópico {topic_name}")
else:
    print("Código não executado")