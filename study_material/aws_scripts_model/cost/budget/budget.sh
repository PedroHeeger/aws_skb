#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS BUDGET"
echo "BUDGET CREATION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
accountId="001727357081"
budgetName="Gastos acima de 4.0 dolares"
limitAmount=4.0
unit="USD"
timeUnit="MONTHLY"
budgetType="COST"
notificationType="ACTUAL"
comparisonOperator="GREATER_THAN"
threshold=50
thresholdType="PERCENTAGE"
notificationState="ALARM"
subscriptionType="EMAIL"
address="pedroheeger19@gmail.com"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$resposta" = "y" ] || [ "$resposta" = "Y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o budget $budgetName"
    condition=$(aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName" --output text | wc -l)
    if [[ "$condition" -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Já existe o budget $budgetName"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName" --output text
    else
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de todos os budgets criados"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[].BudgetName" --output text
    
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando o budget $budgetName (Shorthand Syntax)"
        aws budgets create-budget --account-id $accountId --budget "BudgetName=$budgetName,BudgetLimit={Amount=$limitAmount,Unit=$unit},TimeUnit=$timeUnit,BudgetType=$budgetType"

        # echo "-----//-----//-----//-----//-----//-----//-----"
        # echo "Criando o budget $budgetName (JSON)"
        # aws budgets create-budget --account-id $accountId --budget "{
        #     \"BudgetName\":\"$budgetName\",
        #     \"BudgetLimit\":{
        #         \"Amount\":\"$limitAmount\",
        #         \"Unit\":\"$unit\"
        #     },
        #     \"TimeUnit\":\"$timeUnit\",
        #     \"BudgetType\":\"$budgetType\"
        # }"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Criando um alerta para o orçamento $budgetName (Shorthand Syntax)"
        aws budgets create-notification --account-id $accountId --budget-name $budgetName --notification "NotificationType=$notificationType,ComparisonOperator=$comparisonOperator,Threshold=$threshold,ThresholdType=$thresholdType,NotificationState=$notificationState" --subscribers "SubscriptionType=$subscriptionType,Address=$address"

        # echo "-----//-----//-----//-----//-----//-----//-----"
        # echo "Criando um alerta para o orçamento $budgetName (JSON)"
        # aws budgets create-notification --account-id $accountId --budget-name $budgetName --notification "{ 
        #     \"NotificationType\":\"$notificationType\",
        #     \"ComparisonOperator\":\"$comparisonOperator\",
        #     \"Threshold\":$threshold,
        #     \"ThresholdType\":\"$thresholdType\",
        #     \"NotificationState\":\"$notificationState\"
        # }" --subscribers "[{
        #       \"SubscriptionType\":\"$subscriptionType\",
        #       \"Address\":\"$address\"
        # }]"

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome do budget criado"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName" --output text
    fi
else
    echo "Código não executado"
fi




#!/bin/bash

echo "***********************************************"
echo "SERVIÇO: AWS BUDGET"
echo "BUDGET EXCLUSION"

echo "-----//-----//-----//-----//-----//-----//-----"
echo "Definindo variáveis"
accountId="001727357081"
budgetName="Gastos acima de 4.0 dolares"
notificationType="ACTUAL"
comparisonOperator="GREATER_THAN"
threshold=50
thresholdType="PERCENTAGE"
notificationState="ALARM"

echo "-----//-----//-----//-----//-----//-----//-----"
read -p "Deseja executar o código? (y/n) " resposta
if [ "$resposta" = "y" ] || [ "$resposta" = "Y" ]; then
    echo "-----//-----//-----//-----//-----//-----//-----"
    echo "Verificando se existe o budget $budget_name"
    condition=$(aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='${budgetName}'].BudgetName" --output text | wc -l)
    if [[ "$condition" -gt 0 ]]; then
        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de todos os budgets criados"
        aws budgets describe-budgets --account-id $account_id --query "Budgets[].BudgetName" --output text

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Verificando se existe alerta no budget $budgetName"
        command="aws budgets describe-notifications-for-budget --account-id $accountId --budget-name \"$budgetName\" --query \"Notifications[?NotificationType=='$notificationType' && ComparisonOperator=='$comparisonOperator' && to_string(Threshold)=='$threshold'].NotificationType\" --output text"
        condition=$(eval "$command")

        if [[ -n "$condition" && "$condition" != "None" ]]; then
            echo "-----//-----//-----//-----//-----//-----//-----"
            echo "Removendo o alerta do budget $budgetName"
            aws budgets delete-notification --account-id "$accountId" --budget-name "$budgetName" --notification "NotificationType=$notificationType,ComparisonOperator=$comparisonOperator,Threshold=$threshold,ThresholdType=$thresholdType,NotificationState=$notificationState"
        else
            echo "Não existe alerta para o budget $budgetName"
        fi

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Removendo o budget $budget_name"
        aws budgets delete-budget --account-id $account_id --budget-name $budget_name

        echo "-----//-----//-----//-----//-----//-----//-----"
        echo "Listando o nome de todos os budgets criados"
        aws budgets describe-budgets --account-id $account_id --query "Budgets[].BudgetName" --output text
    else
        echo "Não existe o budget $budget_name"
    fi
else
    echo "Código não executado"
fi