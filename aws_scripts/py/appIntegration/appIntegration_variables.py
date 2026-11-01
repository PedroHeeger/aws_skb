print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")

# --- Configurações Gerais ---
aws_profile = "default"
region      = "us-east-1"
account_id  = "001727357081"

# SNS Topic:
sns_topic_config = {
    "topic_name":                  "snsTopicTest1",
    "display_name":                "SNS Topic Test 1",
    "topic_arn":                   f"arn:aws:sns:{region}:{account_id}:snsTopicTest1",
    # "fifo_topic":                  "true",        # "false" = Standard | "true" = FIFO (nome deve terminar em .fifo)
    # "content_based_deduplication": "true",        # Apenas para FIFO: "true" habilita deduplicação baseada no conteúdo
    "kms_master_key_id":           "",            # Vazio = sem encriptação | ex: "alias/aws/sns" para KMS gerenciado pela AWS
    "max_message_size":            456,           # KiB, entre 1 e 1024. Comentado = padrão AWS (256). Acima de 256 só aceita subscrição SQS, Lambda ou Firehose
    "access_policy_file":          "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/sns/sns_topic_access_policy.json",   # Comentado = policy padrão da AWS. Placeholders <topicArn> e <accountId> são preenchidos pela função
    "tag_key":                     "Environment",
    "tag_value":                   "Test"
}

# SNS Subscription:
sns_subscription_config = {
    # --- Tópico Standard: email | email-json | sms | http | https | sqs | lambda | application
    # --- Tópico FIFO: apenas sqs (fila Standard ou FIFO)
    # "protocol":          "email",
    # "sns_endpoint":      "phcstudy@proton.me",
    # "sns_endpoint_name": "PH Email Study",
    # "protocol":          "email-json",
    # "sns_endpoint":      "phcstudy@proton.me",
    # "sns_endpoint_name": "PH Email JSON Study",
    # "protocol":          "sms",
    # "sns_endpoint":      "+5500000000000",                                              # Formato E.164
    # "sns_endpoint_name": "SMS Test",
    # "protocol":          "http",
    # "sns_endpoint":      "http://exemplo.com/endpoint",
    # "sns_endpoint_name": "HTTP Endpoint Test",
    # "protocol":          "https",
    # "sns_endpoint":      "https://exemplo.com/endpoint",
    # "sns_endpoint_name": "HTTPS Endpoint Test",
    # "protocol":          "sqs",
    # "sns_endpoint":      f"arn:aws:sqs:{region}:{account_id}:sqsQueueTest1",
    # "sns_endpoint_name": "sqsQueueTest1",
    # "protocol":          "sqs",
    # "sns_endpoint":      f"arn:aws:sqs:{region}:{account_id}:sqsQueueTest1.fifo",
    # "sns_endpoint_name": "sqsQueueTest1.fifo",
    "protocol":          "lambda",
    "sns_endpoint":      f"arn:aws:lambda:{region}:{account_id}:function:functionTest1",
    "sns_endpoint_name": "functionTest1",
    # "protocol":          "application",
    # "sns_endpoint":      f"arn:aws:sns:{region}:{account_id}:endpoint/GCM/appTest1/id",
    # "sns_endpoint_name": "appTest1",

    # --- Redrive Policy / Dead-Letter Queue (opcional). Comentado = sem DLQ. Tópico FIFO exige fila .fifo ---
    # "dlq_arn":                f"arn:aws:sqs:{region}:{account_id}:sqsDlqTest1",
    # "dlq_arn":                f"arn:aws:sqs:{region}:{account_id}:sqsDlqTest1.fifo",

    # --- Filter Policy (opcional, use um dos dois; file tem prioridade; comentado = sem filtro) ---
    "filter_policy_scope":    "MessageAttributes",   # MessageAttributes | MessageBody (só vale junto com o filtro)
    "filter_policy_document": '{"evento": ["pedido_criado"]}',
    # "filter_policy_scope":    "MessageBody",         # MessageAttributes | MessageBody (só vale junto com o filtro)
    # "filter_policy_file":     "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/sns/sns_filter_policy.json",

    # --- Raw Message Delivery (opcional). "true" = entrega só o corpo, sem o JSON do SNS. Apenas http | https | sqs ---
    "raw_message_delivery":   "true",
}
