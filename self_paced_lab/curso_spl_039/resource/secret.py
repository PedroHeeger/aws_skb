import boto3
from botocore.exceptions import ClientError

def get_secret():
    secret_name = "lab-secret"  # Replace with your secret name. EX. "lab-secret"
    region_name = "us-west-2"    # Replace with your AWS region. EX. "us-east-1"

    # Create a session and Secrets Manager client
    session = boto3.session.Session()
    secrets = session.client(
        service_name='secretsmanager',
        region_name=region_name,
    )

    try:
        # Attempt to retrieve the secret value
        get_secret_value_response = secrets.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        # Handle different error codes from AWS
        error_code = e.response['Error']['Code']
        if error_code == 'ResourceNotFoundException':
            print(f"The requested secret {secret_name} was not found.")
        elif error_code == 'InvalidRequestException':
            print(f"The request was invalid due to: {e}")
        elif error_code == 'InvalidParameterException':
            print(f"The request had invalid params: {e}")
        elif error_code == 'DecryptionFailure':
            print(f"The requested secret can't be decrypted using the provided KMS key: {e}")
        elif error_code == 'InternalServiceError':
            print(f"An error occurred on the service side: {e}")
        else:
            print(f"An unexpected error occurred: {e}")
    else:
        # If no exception was raised, handle the secret data
        if 'SecretString' in get_secret_value_response:
            # If secret is in string format
            secret = get_secret_value_response['SecretString']
            print(f"Secret retrieved: {secret}")
        elif 'SecretBinary' in get_secret_value_response:
            # If secret is in binary format, decode it
            secret = get_secret_value_response['SecretBinary']
            print(f"Binary secret retrieved: {secret}")
        else:
            print("Secret data not found.")

if __name__ == "__main__":
    get_secret()