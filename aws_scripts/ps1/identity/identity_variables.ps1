Write-Output "-----//-----//-----//-----//-----//-----//-----"
Write-Output "Definindo variáveis"

# --- Configurações Gerais ---
$awsProfile = "default"
# $region = "us-east-1"
$region = "sa-east-1"


# IAM User:
$iamUserConfig = @{
    # --- Identificação (Tags) ---
    userName         = "UserTest"
    userPassword     = "PwdTest123"
    tagKey           = "Environment"
    tagValue         = "Test"
}

# IAM Group:
$iamGroupConfig = @{
    # --- Identificação (Tags) ---
    groupName        = "GroupTest"
}

# IAM Role:
$iamRoleConfig = @{
    # --- Identificação (Tags) ---
    roleName            = "RoleTest"
    roleDescription     = "Role de teste"
    tagKey              = "Environment"
    tagValue            = "Test"
    # --- Trust Policy (use um dos dois) ---
    trustPolicyFile   = "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/trust_policy_document.json"
    trustPolicyDocument = "{
        `"Version`": `"2012-10-17`",
        `"Statement`": [
            {
                `"Effect`": `"Allow`",
                `"Principal`": {
                    `"Service`": `"ec2.amazonaws.com`"
                },
                `"Action`": `"sts:AssumeRole`"
            }
        ]
    }"
}

# IAM Instance Profile:
$instProfConfig = @{
    # --- Identificação (Tags) ---
    instProfName        = "InstanceProfileTest"
    tagKey              = "Environment"
    tagValue            = "Test"
}

# IAM Policy:
$iamPolicyConfig = @{
    # --- Identificação (Tags) ---
    # policyName        = "AmazonS3ReadOnlyAccess"
    policyName        = "PolicyTest"
    policyDescription = "Policy de teste"
    tagKey            = "Environment"
    tagValue          = "Test"
    # --- Policy Document (use um dos dois) ---
    policyFile        = "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/policy_document.json"
    policyDocument    = "{
        `"Version`": `"2012-10-17`",
        `"Statement`": [
            {
                `"Effect`": `"Allow`",
                `"Action`": [
                    `"s3:GetObject`",
                    `"s3:ListBucket`"
                ],
                `"Resource`": `"arn:aws:s3:::seu-bucket/*`"
            }
        ]
    }"
}

# IAM MFA Device:
$iamMfaDeviceConfig = @{
    deviceName    = "deviceTest"
    mfaFile       = "mfaTest.png"
    mfaPath       = "G:\Meu Drive\4_PROJ\aws_skb\aws_scripts\.default\secrets\mfa"
    tagKey        = "Environment"
    tagValue      = "Test"
}

# IAM User Key Access:
$iamUserKeyAccessConfig = @{
    keyAccessFile   = "keyAccessTest.json"
    keyAccessPath   = "G:\Meu Drive\4_PROJ\aws_skb\aws_scripts\.default\secrets\awsKa\test"
}