print("-----//-----//-----//-----//-----//-----//-----")
print("Definindo variáveis")

# --- Configurações Gerais ---
aws_profile = "default"
region = "us-east-1"
# region = "sa-east-1"

# IAM User:
iam_user_config = {
    # --- Identificação (Tags) ---
    "user_name": "UserTest",
    "user_password": "PwdTest123",
    "tag_key": "Environment",
    "tag_value": "Test"
}

# IAM Group:
iam_group_config = {
    # --- Identificação (Tags) ---
    "group_name": "GroupTest"
}

# IAM Role:
iam_role_config = {
    # --- Identificação ---
    "role_name":             "RoleTest",
    "role_description":      "Role de teste",
    "tag_key":               "Environment",
    "tag_value":             "Test",
    # --- Trust Policy (use um dos dois) ---
    "trust_policy_file":     "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/trust_policy_document.json",
    "trust_policy_document": '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}'
}

# IAM Instance Profile:
inst_prof_config = {
    # --- Identificação ---
    "inst_prof_name": "InstanceProfileTest",
    "tag_key":        "Environment",
    "tag_value":      "Test"
}

# IAM Policy:
iam_policy_config = {
    # --- Identificação ---
    # "policy_name":        "AmazonS3ReadOnlyAccess",
    "policy_name":        "PolicyTest",
    "policy_description": "Policy de teste",
    "tag_key":            "Environment",
    "tag_value":          "Test",
    # --- Policy Document (use um dos dois) ---
    "policy_file":        "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/json/policy_document.json",
    "policy_file":        None,
    "policy_document":    '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Action":["s3:GetObject","s3:ListBucket"],"Resource":"arn:aws:s3:::seu-bucket/*"}]}'
}

# IAM MFA Device:
iam_mfa_device_config = {
    "device_name": "deviceTest",
    "mfa_file":    "mfaTest.png",
    "mfa_path":    "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/secrets/mfa",
    "tag_key":     "Environment",
    "tag_value":   "Test"
}

# IAM User Key Access:
iam_user_key_access_config = {
    "key_access_file": "keyAccessTest.json",
    "key_access_path": "G:/Meu Drive/4_PROJ/aws_skb/aws_scripts/.default/secrets/awsKa/test"
}