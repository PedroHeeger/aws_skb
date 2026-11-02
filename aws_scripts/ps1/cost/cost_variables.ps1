Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"

# --- Configurações Gerais ---
$awsProfile = "default"
$region     = "us-east-1"
$accountId  = "001727357081"


# Budget:
$budgetConfig = @{
    budgetName              = "Teste 6 dolares"
    budgetType              = "COST"             # COST | USAGE | RI_UTILIZATION | RI_COVERAGE | SAVINGS_PLANS_UTILIZATION | SAVINGS_PLANS_COVERAGE
    budgetingMethod         = "AUTO_ADJUSTING_HISTORICAL"            # FIXED | AUTO_ADJUSTING_HISTORICAL | AUTO_ADJUSTING_FORECAST (apenas para COST e USAGE)
    budgetAdjustmentPeriod  = 12                 # Número de períodos para cálculo histórico (apenas AUTO_ADJUSTING_HISTORICAL)
    limitAmount             = "6.0"              # Valor do limite (COST e USAGE com FIXED)
    priceUnit               = "USD"              # Unidade monetária para COST (priceUnit)
    usageUnit               = "GB"              # Unidade de uso para USAGE (ex: GB, Hrs)
    timeUnit                = "ANNUALY"          # DAILY | MONTHLY | QUARTERLY | ANNUALLY
    timePeriodStart         = "01/09/2026"                 # Formato: dd/MM/yyyy. Vazio = padrão da AWS. É convertido para timestamp Unix (ex: 3706473600 = Jun 2087)
    timePeriodEnd           = ""                 # Formato: dd/MM/yyyy. Vazio = padrão da AWS. É convertido para timestamp Unix (ex: 3706473600 = Jun 2087)
    # utilizationThreshold    = "70"                 # Percentual de utilização/cobertura para Savings Plans (ex: "80"). Vazio = 100 (padrão AWS). RI só aceita 100%.
    budgetAgainst           = "USAGE_TYPE"                 # Dimensão do Budget Against para USAGE: USAGE_TYPE_GROUP | USAGE_TYPE.
    # budgetAgainstValues     = @("EC2: Running Hours", "EC2: Data Transfer - Internet (Out)")                # Lista de valores do Budget Against (USAGE_TYPE_GROUP)
    budgetAgainstValues     = @("DataTransfer-Out-Bytes", "DataTransfer-In-Bytes", "USE1-BoxUsage:t3.micro")                # Lista de valores do Budget Against (USAGE_TYPE)
    tagKey                  = "Environment"
    tagValue                = "Test"
}

# Budget Notification:
$budgetNotificationConfig = @{
    notificationType    = "ACTUAL"          # ACTUAL | FORECASTED
    comparisonOperator  = "GREATER_THAN"    # GREATER_THAN | LESS_THAN | EQUAL_TO
    threshold           = 85.65
    thresholdType       = "PERCENTAGE"      # PERCENTAGE | ABSOLUTE_VALUE (Cost)
    # thresholdType       = "ABSOLUTE_VALUE"    # PERCENTAGE | ABSOLUTE_VALUE (Cost)
    # --- Subscribers: até 10 EMAIL (endereço) e 1 SNS (ARN do tópico, exige access policy liberando budgets.amazonaws.com). Comente a linha que não quiser ---
    subscribers         = @(
        @{ subscriptionType = "EMAIL"; address = "phcstudy@proton.me" }
        @{ subscriptionType = "SNS";   address = "arn:aws:sns:${region}:${accountId}:snsTopicTest1" }
    )
}
