#!/usr/bin/env python

import boto3

print("***********************************************")
print("SERVIÇO: AWS BUDGET")
print("BUDGET CREATION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
account_id = "001727357081"
budget_name = "Gastos acima de 3.5 dolares"
limit_amount = 3.5
unit = "USD"
time_unit = "MONTHLY"
budget_type = "COST"
notification_type = "ACTUAL"
comparison_operator = "GREATER_THAN"
threshold = 50.0
threshold_type = "PERCENTAGE"
notification_state = "ALARM"
subscription_type = "EMAIL"
address = "pedroheeger19@gmail.com"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ")
if resposta.lower() == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o budget {budget_name}")
    budgets_client = boto3.client('budgets')
    response = budgets_client.describe_budgets(AccountId=account_id)
    budgets = response.get('Budgets', [])
    
    if any(budget['BudgetName'] == budget_name for budget in budgets):
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Já existe o budget {budget_name}")
        print(budget_name)
    else:
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de todos os budgets criados")
        all_budget_names = [budget['BudgetName'] for budget in budgets]
        print('\n'.join(all_budget_names))
    
        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando o budget {budget_name}")
        budgets_client.create_budget(
            AccountId=account_id,
            Budget={
                'BudgetName': budget_name,
                'BudgetLimit': {
                    'Amount': str(limit_amount),
                    'Unit': unit
                },
                'TimeUnit': time_unit,
                'BudgetType': budget_type
            }
        )

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Criando um alerta para o orçamento {budget_name}")
        budgets_client.create_notification(
            AccountId=account_id,
            BudgetName=budget_name,
            Notification={
                'NotificationType': notification_type,
                'ComparisonOperator': comparison_operator,
                'Threshold': threshold,
                'ThresholdType': threshold_type,
                'NotificationState': notification_state
            },
            Subscribers=[
                {
                    'SubscriptionType': subscription_type,
                    'Address': address
                }
            ]
        )

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome do budget criado")
        print(budget_name)
else:
    print("Código não executado")




#!/usr/bin/env python

import boto3

print("***********************************************")
print("SERVIÇO: AWS BUDGET")
print("BUDGET EXCLUSION")

print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")
account_id = "001727357081"
budget_name = "Gastos acima de 3.5 dolares"
notification_type = "ACTUAL"
comparison_operator = "GREATER_THAN"
threshold = 50.0
threshold_type = "PERCENTAGE"
notification_state = "ALARM"

print("-----//-----//-----//-----//-----//-----//-----")
resposta = input("Deseja executar o código? (y/n) ")
if resposta.lower() == 'y':
    print("-----//-----//-----//-----//-----//-----//-----")
    print(f"Verificando se existe o budget {budget_name}")
    budgets_client = boto3.client('budgets')
    response = budgets_client.describe_budgets(AccountId=account_id)
    budgets = response.get('Budgets', [])

    if any(budget['BudgetName'] == budget_name for budget in budgets):
        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de todos os budgets criados")
        all_budget_names = [budget['BudgetName'] for budget in budgets]
        print('\n'.join(all_budget_names))

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Verificando se existe alerta no budget {budget_name}")
        notifications = budgets_client.describe_notifications_for_budget(
            AccountId=account_id,
            BudgetName=budget_name
        ).get('Notifications', [])

        # Filtrando notificações com base nos critérios definidos
        matching_notifications = [
            notification for notification in notifications
            if notification['NotificationType'] == notification_type
            and notification['ComparisonOperator'] == comparison_operator
            and float(notification['Threshold']) == threshold
        ]

        if matching_notifications:
            print("-----//-----//-----//-----//-----//-----//-----")
            print(f"Removendo o alerta do budget {budget_name}")
            for notification in matching_notifications:
                budgets_client.delete_notification(
                    AccountId=account_id,
                    BudgetName=budget_name,
                    Notification={
                        'NotificationType': notification_type,
                        'ComparisonOperator': comparison_operator,
                        'Threshold': threshold,
                        'ThresholdType': threshold_type,
                        'NotificationState': notification_state
                    }
                )
        else:
            print(f"Não existe alerta para o budget {budget_name}")

        print("-----//-----//-----//-----//-----//-----//-----")
        print(f"Removendo o budget {budget_name}")
        budgets_client.delete_budget(AccountId=account_id, BudgetName=budget_name)

        print("-----//-----//-----//-----//-----//-----//-----")
        print("Listando o nome de todos os budgets criados")
        all_budget_names_after_deletion = [budget['BudgetName'] for budget in budgets_client.describe_budgets(AccountId=account_id)['Budgets']]
        print('\n'.join(all_budget_names_after_deletion))
    else:
        print(f"Não existe o budget {budget_name}")
else:
    print("Código não executado")