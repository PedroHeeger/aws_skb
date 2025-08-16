#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "KEY PAIR CREATION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$keyPairName = "keyPairTest"
$keyPairPath = "G:/Meu Drive/4_PROJ/scripts/aws/.default/secrets/awsKeyPair/test"
# $region = "us-east-1"
$region = "sa-east-1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o par de chaves $keyPairName"
    $condition = aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName'].KeyName" --region $region --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Já existe o par de chaves $keyPairName"
        aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName'].KeyName" --region $region --output text
    } else {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os pares de chaves criados"
        aws ec2 describe-key-pairs --query "KeyPairs[].KeyName" --region $region --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Criando o par de chaves $keyPairName e salvado o arquivo de chave privada"
        aws ec2 create-key-pair --key-name $keyPairName --query 'KeyMaterial' --region $region --output text > "$keyPairPath\$keyPairName.pem"

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando apenas o par de chave $keyPairName"
        aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName'].KeyName" --region $region --output text
    }
} else {Write-Host "Código não executado"}




#!/usr/bin/env powershell

Write-Output "***********************************************"
Write-Output "SERVIÇO: AWS EC2"
Write-Output "KEY PAIR EXCLUSION"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"
$keyPairName = "keyPairTest"
$keyPairPath = "G:/Meu Drive/4_PROJ/scripts/aws/.default/secrets/awsKeyPair/test"
# $region = "us-east-1"
$region = "sa-east-1"

Write-Output "-----//-----//-----//-----//-----//-----//-----"
$resposta = Read-Host "Deseja executar o código? (y/n) "
if ($resposta.ToLower() -eq 'y') {
    Write-Output "-----//-----//-----//-----//-----//-----//-----"
    Write-Output "Verificando se existe o par de chaves $keyPairName"
    $condition = aws ec2 describe-key-pairs --query "KeyPairs[?KeyName=='$keyPairName'].KeyName" --region $region --output text
    if (($condition).Count -gt 0) {
        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os pares de chaves criados"
        aws ec2 describe-key-pairs --query "KeyPairs[].KeyName" --region $region --output text

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Removendo o par de chaves $keyPairName"
        aws ec2 delete-key-pair --key-name $keyPairName --region $region

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o arquivo de chave privada $keyPairName.pem"
        if (Test-Path "$keyPairPath\$keyPairName.pem" -PathType Leaf) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo o arquivo de chave privada $keyPairName.pem"
            Remove-Item "$keyPairPath\$keyPairName.pem"
        } else {Write-Host "Não existe o arquivo de chave privada $keyPairName.pem"}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Verificando se existe o arquivo de chave privada $keyPairName.ppk"
        if (Test-Path "$keyPairPath\$keyPairName.ppk" -PathType Leaf) {
            Write-Output "-----//-----//-----//-----//-----//-----//-----"
            Write-Host "Removendo o arquivo de chave privada $keyPairName.ppk"
            Remove-Item "$keyPairPath\$keyPairName.ppk"
        } else {Write-Host "Não existe o arquivo de chave privada $keyPairName.ppk"}

        Write-Output "-----//-----//-----//-----//-----//-----//-----"
        Write-Output "Listando todos os pares de chaves criados"
        aws ec2 describe-key-pairs --query "KeyPairs[].KeyName" --region $region --output text
    } else {Write-Output "Não existe o par de chaves $keyPairName"}
} else {Write-Host "Código não executado"}