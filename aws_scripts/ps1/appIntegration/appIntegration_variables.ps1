Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"

# --- Configurações Gerais ---
$awsProfile = "default"
$region     = "us-east-1"
$accountId  = "001727357081"

# SNS Topic:
$snsTopicConfig = @{
    topicName                   = "snsTopicTest1"
    displayName                 = "SNS Topic Test 1"
    topicArn                    = "arn:aws:sns:${region}:${accountId}:snsTopicTest1"
    # fifoTopic                   = "true"        # "false" = Standard | "true" = FIFO (nome deve terminar em .fifo)
    # contentBasedDeduplication   = "true"        # Apenas para FIFO: "true" habilita deduplicação baseada no conteúdo
    kmsMasterKeyId              = ""             # Vazio = sem encriptação | ex: "alias/aws/sns" para KMS gerenciado pela AWS
    maxMessageSize              = 256            # KiB, entre 1 e 1024. Comentado = padrão AWS (256). Acima de 256 só aceita subscrição SQS, Lambda ou Firehose
    accessPolicyFile            = "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/sns/sns_topic_access_policy.json"   # Comentado = policy padrão da AWS. Placeholders <topicArn> e <accountId> são preenchidos pela função
    tagKey                      = "Environment"
    tagValue                    = "Test"
}

# SNS Subscription:
$snsSubscriptionConfig = @{
    # --- Tópico Standard: email | email-json | sms | http | https | sqs | lambda | application
    # --- Tópico FIFO: apenas sqs (fila Standard ou FIFO)
    # protocol        = "email"
    # snsEndpoint     = "phcstudy@proton.me"
    # snsEndpointName = "PH Email Study"
    protocol        = "email-json"
    snsEndpoint     = "phcstudy@proton.me"
    snsEndpointName = "PH Email JSON Study"
    # protocol        = "sms"
    # snsEndpoint     = "+5500000000000"                                              # Formato E.164
    # snsEndpointName = "SMS Test"
    # protocol        = "http"
    # snsEndpoint     = "http://exemplo.com/endpoint"
    # snsEndpointName = "HTTP Endpoint Test"
    # protocol        = "https"
    # snsEndpoint     = "https://exemplo.com/endpoint"
    # snsEndpointName = "HTTPS Endpoint Test"
    # protocol        = "sqs"
    # snsEndpoint     = "arn:aws:sqs:${region}:${accountId}:sqsQueueTest1"
    # snsEndpointName = "sqsQueueTest1"
    # protocol        = "sqs"
    # snsEndpoint     = "arn:aws:sqs:${region}:${accountId}:sqsQueueTest1.fifo"
    # snsEndpointName = "sqsQueueTest1.fifo"
    # protocol        = "lambda"
    # snsEndpoint     = "arn:aws:lambda:${region}:${accountId}:function:functionTest1"
    # snsEndpointName = "functionTest1"
    # protocol        = "application"
    # snsEndpoint     = "arn:aws:sns:${region}:${accountId}:endpoint/GCM/appTest1/id"
    # snsEndpointName = "appTest1"

    # --- Redrive Policy / Dead-Letter Queue (opcional). Comentado = sem DLQ. Tópico FIFO exige fila .fifo ---
    dlqArn   = "arn:aws:sqs:${region}:${accountId}:sqsDlqTest1"
    # dlqArn   = "arn:aws:sqs:${region}:${accountId}:sqsDlqTest1.fifo"

    # --- Filter Policy (opcional, use um dos dois; file tem prioridade; comentado = sem filtro) ---
    filterPolicyScope    = "MessageAttributes"     # MessageAttributes | MessageBody (só vale junto com o filtro)
    filterPolicyDocument = '{"evento": ["pedido_criado"]}'
    # filterPolicyScope    = "MessageBody"     # MessageAttributes | MessageBody (só vale junto com o filtro)
    # filterPolicyFile     = "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/sns/sns_filter_policy.json"

    # --- Raw Message Delivery (opcional). "true" = entrega só o corpo, sem o JSON do SNS. Apenas http | https | sqs ---
    # rawMessageDelivery   = "true"
}
