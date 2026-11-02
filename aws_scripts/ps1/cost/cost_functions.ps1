#!/usr/bin/env powershell




# Budget:
    function Test-BudgetExists {
        <# Verifica se existe um budget com o nome especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe o budget $budgetName"
        $result = aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='$budgetName'].BudgetName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a existência do budget $budgetName." -ForegroundColor Red }
        return $result
    }
    # $condition = Test-BudgetExists -accountId $accountId -budgetName $budgetConfig.budgetName


    function Show-BudgetName {
        <# Exibe o nome do budget especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe o budget $budgetName"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='$budgetName'].BudgetName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir o budget $budgetName." -ForegroundColor Red }
    }
    # Show-BudgetName -accountId $accountId -budgetName $budgetConfig.budgetName


    function Show-BudgetsAll {
        <# Lista o nome de todos os budgets criados #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o nome de todos os budgets criados"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[].BudgetName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar os budgets." -ForegroundColor Red }
    }
    # Show-BudgetsAll -accountId $accountId


    function New-Budget {
        <# Cria um novo budget com base no tipo e método especificados #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName,
            [Parameter(Mandatory=$true)][string]$budgetType,
            [Parameter(Mandatory=$true)][string]$timeUnit,
            [string]$budgetingMethod,
            [int]$budgetAdjustmentPeriod,
            [string]$limitAmount,
            [string]$priceUnit,
            [string]$usageUnit,
            [string]$timePeriodStart,
            [string]$timePeriodEnd,
            [string]$utilizationThreshold,
            [string]$budgetAgainst,
            [string[]]$budgetAgainstValues,
            [string]$tagKey,
            [string]$tagValue
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Formatando as datas no padrão"
        if ($timePeriodStart) {
            $timePeriodStart = [int][double]::Parse((Get-Date ([datetime]::ParseExact($timePeriodStart, "dd/MM/yyyy", $null)) -UFormat %s))
        }
        if ($timePeriodEnd) {
            $timePeriodEnd = [int][double]::Parse((Get-Date ([datetime]::ParseExact($timePeriodEnd, "dd/MM/yyyy", $null)) -UFormat %s))
        }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Escolhendo o intervalo de tempo"
        $timePeriodBlock = ""
        if ($timePeriodStart -and $timePeriodEnd) {
            $timePeriodBlock = "`"TimePeriod`": { `"Start`": $timePeriodStart, `"End`": $timePeriodEnd },"
        } elseif ($timePeriodStart) {
            $timePeriodBlock = "`"TimePeriod`": { `"Start`": $timePeriodStart },"
        } elseif ($timePeriodEnd) {
            $timePeriodBlock = "`"TimePeriod`": { `"End`": $timePeriodEnd },"
        }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Escolhendo o tipo e método de budget"
        switch ($budgetType) {
            "COST" {
                switch ($budgetingMethod) {
                    "FIXED" {
                        Write-Host "-----//-----//-----//-----//-----//-----//-----"
                        Write-Host "Criando o budget de custo fixo $budgetName"
                        $budgetJson = "{ `"BudgetName`": `"$budgetName`", `"BudgetLimit`": { `"Amount`": `"$limitAmount`", `"Unit`": `"$priceUnit`" }, `"TimeUnit`": `"$timeUnit`", $timePeriodBlock `"BudgetType`": `"COST`" }"
                        aws budgets create-budget --account-id $accountId --budget $budgetJson --resource-tags "Key=$tagKey,Value=$tagValue"
                        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o budget $budgetName." -ForegroundColor Red }
                    }
                    "AUTO_ADJUSTING_HISTORICAL" {
                        Write-Host "-----//-----//-----//-----//-----//-----//-----"
                        Write-Host "Criando o budget de custo com auto-ajuste histórico $budgetName"
                        $budgetJson = "{ `"BudgetName`": `"$budgetName`", `"TimeUnit`": `"$timeUnit`", $timePeriodBlock `"BudgetType`": `"COST`", `"AutoAdjustData`": { `"AutoAdjustType`": `"HISTORICAL`", `"HistoricalOptions`": { `"BudgetAdjustmentPeriod`": $budgetAdjustmentPeriod } } }"
                        aws budgets create-budget --account-id $accountId --budget $budgetJson --resource-tags "Key=$tagKey,Value=$tagValue"
                        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o budget $budgetName." -ForegroundColor Red }
                    }
                    "AUTO_ADJUSTING_FORECAST" {
                        Write-Host "-----//-----//-----//-----//-----//-----//-----"
                        Write-Host "Criando o budget de custo com auto-ajuste por previsão $budgetName"
                        $budgetJson = "{ `"BudgetName`": `"$budgetName`", `"TimeUnit`": `"$timeUnit`", $timePeriodBlock `"BudgetType`": `"COST`", `"AutoAdjustData`": { `"AutoAdjustType`": `"FORECAST`" } }"
                        aws budgets create-budget --account-id $accountId --budget $budgetJson --resource-tags "Key=$tagKey,Value=$tagValue"
                        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o budget $budgetName." -ForegroundColor Red }
                    }
                    Default {
                        Write-Host "É necessário escolher um método de orçamento válido para COST: FIXED, AUTO_ADJUSTING_HISTORICAL ou AUTO_ADJUSTING_FORECAST." -ForegroundColor Red
                    }
                }
            }
            "USAGE" {
                if ([string]::IsNullOrWhiteSpace($budgetAgainst)) {
                    Write-Host "É necessário definir budgetAgainst para o tipo USAGE: USAGE_TYPE_GROUP ou USAGE_TYPE." -ForegroundColor Red
                    return
                }
                $filterBlock = ""
                if ($budgetAgainstValues -and $budgetAgainstValues.Count -gt 0) {
                    $valuesJson = ($budgetAgainstValues | ForEach-Object { "`"$_`"" }) -join ", "
                    $filterBlock = "`"FilterExpression`": { `"Dimensions`": { `"Key`": `"$budgetAgainst`", `"Values`": [ $valuesJson ], `"MatchOptions`": [ `"EQUALS`" ] } },"
                }
                switch ($budgetingMethod) {
                    "FIXED" {
                        Write-Host "-----//-----//-----//-----//-----//-----//-----"
                        Write-Host "Criando o budget de uso fixo $budgetName"
                        $budgetJson = "{ `"BudgetName`": `"$budgetName`", `"BudgetLimit`": { `"Amount`": `"$limitAmount`", `"Unit`": `"$usageUnit`" }, `"TimeUnit`": `"$timeUnit`", $timePeriodBlock $filterBlock `"BudgetType`": `"USAGE`" }"
                        aws budgets create-budget --account-id $accountId --budget $budgetJson --resource-tags "Key=$tagKey,Value=$tagValue"
                        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o budget $budgetName." -ForegroundColor Red }
                    }
                    "AUTO_ADJUSTING_HISTORICAL" {
                        Write-Host "-----//-----//-----//-----//-----//-----//-----"
                        Write-Host "Criando o budget de uso com auto-ajuste histórico $budgetName"
                        $budgetJson = "{ `"BudgetName`": `"$budgetName`", `"TimeUnit`": `"$timeUnit`", $timePeriodBlock $filterBlock `"BudgetType`": `"USAGE`", `"AutoAdjustData`": { `"AutoAdjustType`": `"HISTORICAL`", `"HistoricalOptions`": { `"BudgetAdjustmentPeriod`": $budgetAdjustmentPeriod } } }"
                        aws budgets create-budget --account-id $accountId --budget $budgetJson --resource-tags "Key=$tagKey,Value=$tagValue"
                        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o budget $budgetName." -ForegroundColor Red }
                    }
                    "AUTO_ADJUSTING_FORECAST" {
                        Write-Host "-----//-----//-----//-----//-----//-----//-----"
                        Write-Host "Criando o budget de uso com auto-ajuste por previsão $budgetName"
                        $budgetJson = "{ `"BudgetName`": `"$budgetName`", `"TimeUnit`": `"$timeUnit`", $timePeriodBlock $filterBlock `"BudgetType`": `"USAGE`", `"AutoAdjustData`": { `"AutoAdjustType`": `"FORECAST`" } }"
                        aws budgets create-budget --account-id $accountId --budget $budgetJson --resource-tags "Key=$tagKey,Value=$tagValue"
                        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o budget $budgetName." -ForegroundColor Red }
                    }
                    Default {
                        Write-Host "É necessário escolher um método de orçamento válido para USAGE: FIXED, AUTO_ADJUSTING_HISTORICAL ou AUTO_ADJUSTING_FORECAST." -ForegroundColor Red
                    }
                }
            }
            "RI_UTILIZATION" {
                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Criando o budget de utilização de RI $budgetName"
                $budgetJson = "{ `"BudgetName`": `"$budgetName`", `"BudgetLimit`": { `"Amount`": `"100`", `"Unit`": `"PERCENTAGE`" }, `"TimeUnit`": `"$timeUnit`", $timePeriodBlock `"BudgetType`": `"RI_UTILIZATION`" }"
                aws budgets create-budget --account-id $accountId --budget $budgetJson --resource-tags "Key=$tagKey,Value=$tagValue"
                if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o budget $budgetName." -ForegroundColor Red }
            }
            "RI_COVERAGE" {
                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Criando o budget de cobertura de RI $budgetName"
                $budgetJson = "{ `"BudgetName`": `"$budgetName`", `"BudgetLimit`": { `"Amount`": `"100`", `"Unit`": `"PERCENTAGE`" }, `"TimeUnit`": `"$timeUnit`", $timePeriodBlock `"BudgetType`": `"RI_COVERAGE`" }"
                aws budgets create-budget --account-id $accountId --budget $budgetJson --resource-tags "Key=$tagKey,Value=$tagValue"
                if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o budget $budgetName." -ForegroundColor Red }
            }
            "SAVINGS_PLANS_UTILIZATION" {
                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Criando o budget de utilização de Savings Plans $budgetName"
                $budgetJson = "{ `"BudgetName`": `"$budgetName`", `"BudgetLimit`": { `"Amount`": `"100`", `"Unit`": `"PERCENTAGE`" }, `"TimeUnit`": `"$timeUnit`", $timePeriodBlock `"BudgetType`": `"SAVINGS_PLANS_UTILIZATION`" }"
                aws budgets create-budget --account-id $accountId --budget $budgetJson --resource-tags "Key=$tagKey,Value=$tagValue"
                if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o budget $budgetName." -ForegroundColor Red }
            }
            "SAVINGS_PLANS_COVERAGE" {
                Write-Host "-----//-----//-----//-----//-----//-----//-----"
                Write-Host "Criando o budget de cobertura de Savings Plans $budgetName"
                $budgetJson = "{ `"BudgetName`": `"$budgetName`", `"BudgetLimit`": { `"Amount`": `"100`", `"Unit`": `"PERCENTAGE`" }, `"TimeUnit`": `"$timeUnit`", $timePeriodBlock `"BudgetType`": `"SAVINGS_PLANS_COVERAGE`" }"
                aws budgets create-budget --account-id $accountId --budget $budgetJson --resource-tags "Key=$tagKey,Value=$tagValue"
                if ($LastExitCode -ne 0) { Write-Host "Falha ao criar o budget $budgetName." -ForegroundColor Red }
            }
            Default {
                Write-Host "É necessário escolher um tipo de budget válido: COST, USAGE, RI_UTILIZATION, RI_COVERAGE, SAVINGS_PLANS_UTILIZATION ou SAVINGS_PLANS_COVERAGE." -ForegroundColor Red
            }
        }
    }
    # New-Budget -accountId $accountId -budgetName $budgetConfig.budgetName -budgetType $budgetConfig.budgetType -timeUnit $budgetConfig.timeUnit -budgetingMethod $budgetConfig.budgetingMethod -budgetAdjustmentPeriod $budgetConfig.budgetAdjustmentPeriod -limitAmount $budgetConfig.limitAmount -priceUnit $budgetConfig.priceUnit -usageUnit $budgetConfig.usageUnit -timePeriodStart $budgetConfig.timePeriodStart -timePeriodEnd $budgetConfig.timePeriodEnd -utilizationThreshold $budgetConfig.utilizationThreshold -budgetAgainst $budgetConfig.budgetAgainst -budgetAgainstValues $budgetConfig.budgetAgainstValues -tagKey $budgetConfig.tagKey -tagValue $budgetConfig.tagValue


    function Get-BudgetName {
        <# Extrai o nome de um budget específico #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando o budget $budgetName"
        aws budgets describe-budgets --account-id $accountId --query "Budgets[?BudgetName=='$budgetName'].BudgetName" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter o budget $budgetName." -ForegroundColor Red }
    }
    # Get-BudgetName -accountId $accountId -budgetName $budgetConfig.budgetName


    function Disconnect-BudgetNotificationsAll {
        <# Verifica todas as notificações do budget e as remove se existirem #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existem notificações no budget $budgetName"
        $notifications = aws budgets describe-notifications-for-budget --account-id $accountId --budget-name $budgetName --query "Notifications[]" --output json | ConvertFrom-Json

        if ($notifications -and $notifications.Count -gt 0) {
            Write-Host "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo todas as notificações do budget $budgetName"
            foreach ($notification in $notifications) {
                $notificationType   = $notification.NotificationType
                $comparisonOperator = $notification.ComparisonOperator
                $threshold          = $notification.Threshold
                # A AWS omite o ThresholdType quando é PERCENTAGE (padrão); sem ele, o delete de uma ABSOLUTE_VALUE falha
                $thresholdType      = if ($notification.ThresholdType) { $notification.ThresholdType } else { "PERCENTAGE" }
                aws budgets delete-notification --account-id $accountId --budget-name $budgetName --notification "NotificationType=$notificationType,ComparisonOperator=$comparisonOperator,Threshold=$threshold,ThresholdType=$thresholdType"
                if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a notificação $notificationType $comparisonOperator $threshold ($thresholdType) do budget $budgetName." -ForegroundColor Red }
            }
        } else {Write-Host "Não existem notificações no budget $budgetName"}
    }
    # Disconnect-BudgetNotificationsAll -accountId $accountId -budgetName $budgetConfig.budgetName


    function Remove-Budget {
        <# Remove definitivamente o budget #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo o budget $budgetName"
        aws budgets delete-budget --account-id $accountId --budget-name $budgetName
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover o budget $budgetName." -ForegroundColor Red }
    }
    # Remove-Budget -accountId $accountId -budgetName $budgetConfig.budgetName




# Budget Notification:
    function Set-BudgetNotificationDefaults {
        <# Função preparatória: define notificationType e comparisonOperator com base no tipo de budget. Para RI e Savings Plans, fixa ACTUAL e LESS_THAN. Para COST e USAGE, mantém os valores recebidos. #>
        param (
            [Parameter(Mandatory=$true)][string]$budgetType,
            [Parameter(Mandatory=$true)][string]$notificationType,
            [Parameter(Mandatory=$true)][string]$comparisonOperator
        )

        if ($budgetType -in @("RI_UTILIZATION", "RI_COVERAGE", "SAVINGS_PLANS_UTILIZATION", "SAVINGS_PLANS_COVERAGE")) {
            $notificationType   = "ACTUAL"
            $comparisonOperator = "LESS_THAN"
        }
        return @{ notificationType = $notificationType; comparisonOperator = $comparisonOperator }
    }
    # $defaults = Set-BudgetNotificationDefaults -budgetType $budgetConfig.budgetType -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator


    function Test-BudgetNotificationExists {
        <# Verifica se existe uma notificação específica no budget (ThresholdType ausente no retorno da AWS = PERCENTAGE) #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName,
            [Parameter(Mandatory=$true)][string]$notificationType,
            [Parameter(Mandatory=$true)][string]$comparisonOperator,
            [Parameter(Mandatory=$true)][decimal]$threshold,
            [Parameter(Mandatory=$true)][string]$thresholdType
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Verificando se existe a notificação com as configurações especificadas no budget $budgetName"
        $result = aws budgets describe-notifications-for-budget --account-id $accountId --budget-name $budgetName --query "Notifications[?NotificationType=='$notificationType' && ComparisonOperator=='$comparisonOperator' && Threshold==``$threshold`` && (ThresholdType || 'PERCENTAGE')=='$thresholdType'].NotificationType" --output text
        if ($LastExitCode -ne 0) { Write-Host "Falha ao verificar a notificação com as configurações especificadas no budget $budgetName." -ForegroundColor Red }
        return $result
    }
    # $condition = Test-BudgetNotificationExists -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType


    function Show-BudgetNotification {
        <# Exibe a notificação específica do budget #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName,
            [Parameter(Mandatory=$true)][string]$notificationType,
            [Parameter(Mandatory=$true)][string]$comparisonOperator,
            [Parameter(Mandatory=$true)][decimal]$threshold,
            [Parameter(Mandatory=$true)][string]$thresholdType
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Já existe a notificação com as configurações especificadas no budget $budgetName"
        aws budgets describe-notifications-for-budget --account-id $accountId --budget-name "$budgetName" --query "Notifications[?NotificationType=='$notificationType' && ComparisonOperator=='$comparisonOperator' && Threshold==``$threshold`` && (ThresholdType || 'PERCENTAGE')=='$thresholdType']" --output json
        if ($LastExitCode -ne 0) { Write-Host "Falha ao exibir a notificação com as configurações especificadas no budget $budgetName." -ForegroundColor Red }
    }
    # Show-BudgetNotification -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType


    function Show-BudgetNotificationsAll {
        <# Lista todas as notificações do budget #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando todas as notificações do budget $budgetName"
        aws budgets describe-notifications-for-budget --account-id $accountId --budget-name $budgetName --query "Notifications[]" --output json
        if ($LastExitCode -ne 0) { Write-Host "Falha ao listar as notificações do budget $budgetName." -ForegroundColor Red }
    }
    # Show-BudgetNotificationsAll -accountId $accountId -budgetName $budgetConfig.budgetName


    function New-BudgetNotification {
        <# Cria uma notificação com um ou mais subscribers (até 10 EMAIL e 1 SNS) para o budget especificado #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName,
            [Parameter(Mandatory=$true)][string]$notificationType,
            [Parameter(Mandatory=$true)][string]$comparisonOperator,
            [Parameter(Mandatory=$true)][decimal]$threshold,
            [Parameter(Mandatory=$true)][string]$thresholdType,
            [Parameter(Mandatory=$true)][object[]]$subscribers
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Montando os subscribers da notificação"
        $subscribersList = @()
        foreach ($subscriber in $subscribers) {
            $subscribersList += "SubscriptionType=$($subscriber.subscriptionType),Address=$($subscriber.address)"
        }

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Criando a notificação com as configurações especificadas no budget $budgetName"
        aws budgets create-notification --account-id $accountId --budget-name $budgetName --notification "NotificationType=$notificationType,ComparisonOperator=$comparisonOperator,Threshold=$threshold,ThresholdType=$thresholdType" --subscribers @subscribersList
        if ($LastExitCode -ne 0) { Write-Host "Falha ao criar a notificação com as configurações especificadas no budget $budgetName." -ForegroundColor Red }
    }
    # New-BudgetNotification -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType -subscribers $budgetNotificationConfig.subscribers


    function Get-BudgetNotification {
        <# Lista a notificação específica do budget #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName,
            [Parameter(Mandatory=$true)][string]$notificationType,
            [Parameter(Mandatory=$true)][string]$comparisonOperator,
            [Parameter(Mandatory=$true)][decimal]$threshold,
            [Parameter(Mandatory=$true)][string]$thresholdType
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Listando a notificação com as configurações especificadas do budget $budgetName"
        aws budgets describe-notifications-for-budget --account-id $accountId --budget-name $budgetName --query "Notifications[?NotificationType=='$notificationType' && ComparisonOperator=='$comparisonOperator' && Threshold==``$threshold`` && (ThresholdType || 'PERCENTAGE')=='$thresholdType']" --output json
        if ($LastExitCode -ne 0) { Write-Host "Falha ao obter a notificação com as configurações especificadas do budget $budgetName." -ForegroundColor Red }
    }
    # Get-BudgetNotification -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType


    function Remove-BudgetNotification {
        <# Remove uma notificação específica do budget #>
        param (
            [Parameter(Mandatory=$true)][string]$accountId,
            [Parameter(Mandatory=$true)][string]$budgetName,
            [Parameter(Mandatory=$true)][string]$notificationType,
            [Parameter(Mandatory=$true)][string]$comparisonOperator,
            [Parameter(Mandatory=$true)][decimal]$threshold,
            [Parameter(Mandatory=$true)][string]$thresholdType
        )

        Write-Host "-----//-----//-----//-----//-----//-----//-----"
        Write-Host "Removendo a notificação com as configurações especificadas do budget $budgetName"
        aws budgets delete-notification --account-id $accountId --budget-name $budgetName --notification "NotificationType=$notificationType,ComparisonOperator=$comparisonOperator,Threshold=$threshold,ThresholdType=$thresholdType"
        if ($LastExitCode -ne 0) { Write-Host "Falha ao remover a notificação com as configurações especificadas do budget $budgetName." -ForegroundColor Red }
    }
    # Remove-BudgetNotification -accountId $accountId -budgetName $budgetConfig.budgetName -notificationType $budgetNotificationConfig.notificationType -comparisonOperator $budgetNotificationConfig.comparisonOperator -threshold $budgetNotificationConfig.threshold -thresholdType $budgetNotificationConfig.thresholdType
