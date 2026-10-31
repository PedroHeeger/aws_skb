#!/usr/bin/env powershell




# SNS Topic:
    function Set-SnsTopicFifoDefaults {
        <# Adiciona o sufixo .fifo ao nome e ao ARN se o tópico for Fifo. Se for Standard, mantém os valores recebidos #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn,
            [string]$fifoTopic
        )

        if ($fifoTopic -eq "true") {
            if (-not $topicName.EndsWith(".fifo")) { $topicName = "$topicName.fifo" }
            if (-not $topicArn.EndsWith(".fifo")) { $topicArn = "$topicArn.fifo" }
        }
        return @{ topicName = $topicName; topicArn = $topicArn }
    }
    # $defaults = Set-SnsTopicFifoDefaults -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -fifoTopic $snsTopicConfig.fifoTopic


    function Test-SnsTopicExists {
        <# Verifica se existe um tópico SNS com o ARN especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o tópico $topicName"
        $result = aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência do tópico $topicName." -ForegroundColor Red }
        return $result
    }
    # $condition = Test-SnsTopicExists -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn


    function Show-SnsTopicArn {
        <# Exibe o ARN do tópico SNS especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe o tópico $topicName"
        aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir o tópico $topicName." -ForegroundColor Red }
    }
    # Show-SnsTopicArn -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn


    function Show-SnsTopicsAll {
        <# Lista o ARN de todos os tópicos SNS criados #>
        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o ARN de todos os tópicos SNS"
        aws sns list-topics --query "Topics[].TopicArn" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar os tópicos SNS." -ForegroundColor Red }
    }
    # Show-SnsTopicsAll


    function New-SnsTopic {
        <# Cria um novo tópico SNS #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$displayName,
            [string]$fifoTopic = "false",
            [string]$contentBasedDeduplication = "false",
            [string]$kmsMasterKeyId,
            [string]$maxMessageSize,
            [string]$topicArn,
            [string]$accountId,
            [string]$accessPolicyFile,
            [string]$tagKey,
            [string]$tagValue
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Fazendo ajustes se o tópico for FIFO"
        $attributes = "DisplayName=$displayName"
        if ($fifoTopic -eq "true") {
            $attributes += ",FifoTopic=true,ContentBasedDeduplication=$contentBasedDeduplication"
        }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Adicionando KMS Master Key ID se fornecido"
        if (-not [string]::IsNullOrWhiteSpace($kmsMasterKeyId)) {
            $attributes += ",KmsMasterKeyId=$kmsMasterKeyId"
        }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Adicionando o tamanho máximo de mensagem se fornecido"
        if (-not [string]::IsNullOrWhiteSpace($maxMessageSize)) {
            $sizeKiB = $maxMessageSize -as [int]
            if ($sizeKiB -ge 1 -and $sizeKiB -le 1024) {
                $attributes += ",MaximumMessageSize=$($sizeKiB * 1024)"
            } else {Write-Host "O tamanho máximo de mensagem $maxMessageSize KiB é inválido (deve ser entre 1 e 1024). O tópico será criado com o padrão da AWS (256 KiB)." -ForegroundColor Red}
        }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Adicionando a access policy se fornecida"
        if (-not [string]::IsNullOrWhiteSpace($accessPolicyFile)) {
            $policyContent = (Get-Content -Path $accessPolicyFile -Raw) -replace '<topicArn>', $topicArn -replace '<accountId>', $accountId
            $accessPolicy  = $policyContent | ConvertFrom-Json | ConvertTo-Json -Compress -Depth 20
            $attributes   += ",Policy='$accessPolicy'"
        }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Criando o tópico SNS $topicName"
        aws sns create-topic --name $topicName --attributes $attributes --tags "Key=$tagKey,Value=$tagValue"
        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o tópico SNS $topicName." -ForegroundColor Red }
    }
    # New-SnsTopic -topicName $snsTopicConfig.topicName -displayName $snsTopicConfig.displayName -fifoTopic $snsTopicConfig.fifoTopic -contentBasedDeduplication $snsTopicConfig.contentBasedDeduplication -kmsMasterKeyId $snsTopicConfig.kmsMasterKeyId -maxMessageSize $snsTopicConfig.maxMessageSize -topicArn $snsTopicConfig.topicArn -accountId $accountId -accessPolicyFile $snsTopicConfig.accessPolicyFile -tagKey $snsTopicConfig.tagKey -tagValue $snsTopicConfig.tagValue


    function Get-SnsTopicArn {
        <# Extrai o ARN de um tópico SNS específico #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o tópico SNS $topicName"
        aws sns list-topics --query "Topics[?TopicArn=='$topicArn'].TopicArn" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o tópico SNS $topicName." -ForegroundColor Red }
    }
    # Get-SnsTopicArn -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn


    function Remove-SnsTopic {
        <# Remove definitivamente o tópico SNS #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo o tópico SNS $topicName"
        aws sns delete-topic --topic-arn $topicArn
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover o tópico SNS $topicName." -ForegroundColor Red }
    }
    # Remove-SnsTopic -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn




# SNS Subscription:
    function Test-SnsSubscriptionProtocol {
        <# Verifica se o protocolo informado é permitido para o tipo do tópico (FIFO ou Standard) e o tamanho máximo de mensagem #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn,
            [Parameter(Mandatory=$true)][string]$protocol
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando o tipo do tópico $topicName e os protocolos permitidos"
        $topicAttributes = aws sns get-topic-attributes --topic-arn $topicArn --query "Attributes" --output json | ConvertFrom-Json
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar o tipo do tópico $topicName." -ForegroundColor Red; return $null }

        # Tamanho máximo em bytes; se a AWS não retornar o atributo, considera o padrão de 256 KiB (262144)
        $maxMessageSize = $topicAttributes.MaximumMessageSize -as [int]
        if (-not $maxMessageSize) { $maxMessageSize = 262144 }

        if ($topicAttributes.FifoTopic -eq "true") {
            $topicType        = "FIFO"; $allowedProtocols = @("sqs")
        } elseif ($maxMessageSize -gt 262144) {
            $topicType        = "Standard (acima de 256 KiB)"; $allowedProtocols = @("sqs", "lambda")
        } else {
            $topicType        = "Standard"; $allowedProtocols = @("email", "email-json", "sms", "http", "https", "sqs", "lambda", "application")
        }
        Write-Host "O tópico $topicName é do tipo $topicType e aceita os protocolos: $($allowedProtocols -join ', ')"

        if ($protocol -in $allowedProtocols) { return $protocol }
        return $null
    }
    # $condition = Test-SnsSubscriptionProtocol -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -protocol $snsSubscriptionConfig.protocol


    function Test-SnsSubscriptionExists {
        <# Verifica se existe uma subscrição com o endpoint especificado no tópico SNS #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn,
            [Parameter(Mandatory=$true)][string]$snsEndpoint,
            [Parameter(Mandatory=$true)][string]$snsEndpointName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe a subscrição de endpoint $snsEndpointName para o tópico $topicName"
        $result = aws sns list-subscriptions --query "Subscriptions[?TopicArn=='$topicArn' && Endpoint=='$snsEndpoint' && starts_with(SubscriptionArn, 'arn:')].Endpoint" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a subscrição do endpoint $snsEndpointName." -ForegroundColor Red }
        return $result
    }
    # $condition = Test-SnsSubscriptionExists -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -snsEndpoint $snsSubscriptionConfig.snsEndpoint -snsEndpointName $snsSubscriptionConfig.snsEndpointName


    function Show-SnsSubscriptionEndpoint {
        <# Exibe o endpoint da subscrição especificada no tópico SNS #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn,
            [Parameter(Mandatory=$true)][string]$snsEndpoint,
            [Parameter(Mandatory=$true)][string]$snsEndpointName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe a subscrição de endpoint $snsEndpointName para o tópico $topicName"
        aws sns list-subscriptions --query "Subscriptions[?TopicArn=='$topicArn' && Endpoint=='$snsEndpoint'].Endpoint" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir a subscrição do endpoint $snsEndpointName." -ForegroundColor Red }
    }
    # Show-SnsSubscriptionEndpoint -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -snsEndpoint $snsSubscriptionConfig.snsEndpoint -snsEndpointName $snsSubscriptionConfig.snsEndpointName


    function Show-SnsSubscriptionsAll {
        <# Lista o endpoint de todas as subscrições do tópico SNS #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o endpoint de todas as subscrições do tópico $topicName"
        aws sns list-subscriptions --query "Subscriptions[?TopicArn=='$topicArn'].Endpoint" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar as subscrições do tópico $topicName." -ForegroundColor Red }
    }
    # Show-SnsSubscriptionsAll -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn


    function New-SnsSubscription {
        <# Cria uma subscrição no tópico SNS e aguarda confirmação do endpoint #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn,
            [Parameter(Mandatory=$true)][string]$protocol,
            [Parameter(Mandatory=$true)][string]$snsEndpoint,
            [Parameter(Mandatory=$true)][string]$snsEndpointName,
            [string]$dlqArn,
            [string]$filterPolicyScope,
            [string]$filterPolicyFile,
            [string]$filterPolicyDocument,
            [string]$rawMessageDelivery
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Montando os atributos opcionais da subscrição"
        $attributesList = @()
        if (-not [string]::IsNullOrWhiteSpace($dlqArn)) {
            $attributesList += "RedrivePolicy='{`"deadLetterTargetArn`":`"$dlqArn`"}'"
        }

        $filterPolicy = $null
        if (-not [string]::IsNullOrWhiteSpace($filterPolicyFile)) {
            $filterPolicy = Get-Content -Path $filterPolicyFile -Raw | ConvertFrom-Json | ConvertTo-Json -Compress -Depth 20
        } elseif (-not [string]::IsNullOrWhiteSpace($filterPolicyDocument)) {
            $filterPolicy = $filterPolicyDocument
        }
        if (-not [string]::IsNullOrWhiteSpace($filterPolicy)) {
            $attributesList += "FilterPolicy='$filterPolicy'"
            if (-not [string]::IsNullOrWhiteSpace($filterPolicyScope)) { $attributesList += "FilterPolicyScope=$filterPolicyScope" }
        }

        if ($rawMessageDelivery -eq "true") {
            if ($protocol -in @("http", "https", "sqs")) {
                $attributesList += "RawMessageDelivery=true"
            } else {Write-Host "Raw message delivery não é suportado para o protocolo $protocol (apenas http, https e sqs). A subscrição será criada sem ele." -ForegroundColor Red}
        }

        $attributes = @()
        if ($attributesList.Count -gt 0) { $attributes = @("--attributes", ($attributesList -join ",")) }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Criando a subscrição de endpoint $snsEndpointName para o tópico $topicName"
        aws sns subscribe --topic-arn $topicArn --protocol $protocol --notification-endpoint $snsEndpoint @attributes
        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar a subscrição do endpoint $snsEndpointName." -ForegroundColor Red }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Aguardando confirmação do endpoint $snsEndpointName"
        do {
            Write-Host "Confirme o endpoint $snsEndpointName da subscrição e aguarde..."
            Start-Sleep -Seconds 10
            $status = (aws sns list-subscriptions-by-topic --topic-arn $topicArn --query "Subscriptions[?Endpoint=='$snsEndpoint']" | ConvertFrom-Json).SubscriptionArn
        } while ($status -eq "PendingConfirmation")
        Write-Host "Subscrição confirmada."
    }
    # New-SnsSubscription -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -protocol $snsSubscriptionConfig.protocol -snsEndpoint $snsSubscriptionConfig.snsEndpoint -snsEndpointName $snsSubscriptionConfig.snsEndpointName -dlqArn $snsSubscriptionConfig.dlqArn -filterPolicyScope $snsSubscriptionConfig.filterPolicyScope -filterPolicyFile $snsSubscriptionConfig.filterPolicyFile -filterPolicyDocument $snsSubscriptionConfig.filterPolicyDocument -rawMessageDelivery $snsSubscriptionConfig.rawMessageDelivery


    function Get-SnsSubscriptionArn {
        <# Extrai o ARN da subscrição pelo endpoint no tópico SNS #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$topicArn,
            [Parameter(Mandatory=$true)][string]$snsEndpoint,
            [Parameter(Mandatory=$true)][string]$snsEndpointName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Extraindo o ARN da subscrição de endpoint $snsEndpointName do tópico $topicName"
        $subscriptionArn = aws sns list-subscriptions --query "Subscriptions[?TopicArn=='$topicArn' && Endpoint=='$snsEndpoint' && starts_with(SubscriptionArn, 'arn:')].SubscriptionArn" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o ARN da subscrição do endpoint $snsEndpointName." -ForegroundColor Red }
        return $subscriptionArn
    }
    # $subscriptionArn = Get-SnsSubscriptionArn -topicName $snsTopicConfig.topicName -topicArn $snsTopicConfig.topicArn -snsEndpoint $snsSubscriptionConfig.snsEndpoint -snsEndpointName $snsSubscriptionConfig.snsEndpointName


    function Remove-SnsSubscription {
        <# Remove a subscrição do tópico SNS pelo ARN #>
        param (
            [Parameter(Mandatory=$true)][string]$topicName,
            [Parameter(Mandatory=$true)][string]$snsEndpointName,
            [Parameter(Mandatory=$true)][string]$subscriptionArn
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo a subscrição de endpoint $snsEndpointName do tópico $topicName"
        aws sns unsubscribe --subscription-arn $subscriptionArn
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a subscrição do endpoint $snsEndpointName." -ForegroundColor Red }
    }
    # Remove-SnsSubscription -topicName $snsTopicConfig.topicName -snsEndpointName $snsSubscriptionConfig.snsEndpointName -subscriptionArn $subscriptionArn
