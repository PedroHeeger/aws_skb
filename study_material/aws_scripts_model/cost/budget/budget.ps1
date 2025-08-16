#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS BUDGET"
Write-Output "BUDGET CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$accountId = "001727357081"
$budgetName = "Gastos acima de 6.0 dolares"
$limitAmount = 6.0
$unit = "USD"
$timeUnit = "MONTHLY"
$budgetType = "COST"
$notificationType = "ACTUAL"
$comparisonOperator = "GREATER_THAN"
$threshold = 50.0
$thresholdType = "PERCENTAGE"
$notificationState = "ALARM"
$subscriptionType = "EMAIL"
$address = "pedroheeger19@gmail.com"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o budget $budgetName"
    $condition = aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o budget $budgetName"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName" --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de todos os budgets criados"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[].BudgetName" --output text
    
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o budget $budgetName (Shorthand Syntax)"
        aws budgets create-budget --account-id $accountId --budget "BudgetName=$budgetName,BudgetLimit={Amount=$limitAmount,Unit=$unit},TimeUnit=$timeUnit,BudgetType=$budgetType"

        # Write-Output "-----//-----//-----//-----//-----//-----//-----"
        # Write-Output "Criando o budget $budgetName (JSON)"
        # aws budgets create-budget --account-id $accountId --budget "{
        #     `"BudgetName`": `"$budgetName`",
        #     `"BudgetLimit`": {
        #         `"Amount`": `"$limitAmount`",
        #         `"Unit`": `"$unit`"
        #     },
        #     `"TimeUnit`": `"$timeUnit`",
        #     `"BudgetType`": `"$budgetType`"
        # }"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando um alerta para o orçamento $budgetName (Shorthand Syntax)"
        aws budgets create-notification --account-id $accountId --budget-name $budgetName --notification "NotificationType=$notificationType,ComparisonOperator=$comparisonOperator,Threshold=$threshold,ThresholdType=$thresholdType,NotificationState=$notificationState" --subscribers "SubscriptionType=$subscriptionType,Address=$address"

        # Write-Output "-----//-----//-----//-----//-----//-----//-----"
        # Write-Output "Criando um alerta para o orçamento $budgetName (JSON)"
        # aws budgets create-notification --account-id $accountId --budget-name $budgetName --notification "{ 
        #     `"NotificationType`": `"$notificationType`",
        #     `"ComparisonOperator`": `"$comparisonOperator`",
        #     `"Threshold`": $threshold,
        #     `"ThresholdType`": `"$thresholdType`",
        #     `"NotificationState`": `"$notificationState`"
        # }" --subscribers "[{
        #       `"SubscriptionType`": `"$subscriptionType`",
        #       `"Address`": `"$address`"
        # }]"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome do budget criado"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName" --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS BUDGET"
Write-Output "BUDGET EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$accountId = "001727357081"
$budgetName = "Gastos acima de 6.0 dolares"
$notificationType = "ACTUAL"
$comparisonOperator = "GREATER_THAN"
$threshold = "50.0"
$thresholdType = "PERCENTAGE"
$notificationState = "ALARM"
$subscriptionType = "EMAIL"
$address = "pedroheeger19@gmail.com"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o budget $budgetName"
    $condition = aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName" --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de todos os budgets criados"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[].BudgetName" --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe alerta no budget $budgetName"
        $command = "aws budgets describe-notifications-for-budget --account-id $accountId --budget-name `"$budgetName`" --query `"Notifications[?NotificationType=='$notificationType' && ComparisonOperator=='$comparisonOperator' && to_string(Threshold)=='$threshold'].NotificationType`" --output text"
        $condition = Invoke-Expression $command
        if (($condition).Count -gt 0 -and $condition -ne "None") {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Output "Removendo o alerta do budget $budgetName"
            aws budgets delete-notification --account-id $accountId --budget-name $budgetName --notification "NotificationType=$notificationType,ComparisonOperator=$comparisonOperator,Threshold=$threshold,ThresholdType=$thresholdType,NotificationState=$notificationState"
        } else {Write-Output "Não existe alerta para o budget $budgetName"}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o budget $budgetName"
        aws budgets delete-budget --account-id $accountId --budget-name $budgetName

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando o nome de todos os budgets criados"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[].BudgetName" --output text
    } else {Write-Output "Não existe o budget $budgetName"}
} else {Write-Host "Código não executado"}