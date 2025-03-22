import boto3
import json

def lambda_handler(event, context):
    # Create a Secrets Manager client
    client = boto3.client('secretsmanager')

    secret_arn = event['SecretId']

    try:
        # Retrieve the current version of the secret
        get_secret_value_response = client.get_secret_value(SecretId=secret_arn)

        if 'SecretString' in get_secret_value_response:
            secret = json.loads(get_secret_value_response['SecretString'])
        else:
            raise Exception("Secret is in binary format, which is not supported in this example")

        # Keep the existing username
        existing_username = secret['username']
        
        # Use Secrets Manager to generate a random password
        random_password_response = client.get_random_password(
            PasswordLength=16, 
            ExcludeCharacters='/"', 
            IncludeSpace=False 
        )
        new_password = random_password_response['RandomPassword']

        # Create the new secret value
        new_secret = {
            'username': existing_username,
            'password': new_password
        }

        # Store the new secret version in Secrets Manager
        client.put_secret_value(
            SecretId=secret_arn,
            SecretString=json.dumps(new_secret),
        )

        return {
            'statusCode': 200,
            'body': json.dumps('Secret rotation successful')
        }

    except Exception as e:
        print(f"Error rotating secret: {str(e)}")
        raise e