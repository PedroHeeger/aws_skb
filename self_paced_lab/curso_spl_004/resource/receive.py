import boto3

sqs = boto3.client("sqs")
queue_url = 'BackgroundCheckApp'

while True:
    print("Retrieving messages")
    response = sqs.receive_message(
        QueueUrl=queue_url,
        MaxNumberOfMessages=2,
        WaitTimeSeconds=7,
    )

    if "Messages" in response:
        for message in response["Messages"]:
            # do your processing
            print(f"Message body: {message['Body']}")
            print(f"Removing message: {message['MessageId']}")
            sqs.delete_message(
                QueueUrl=queue_url,
                ReceiptHandle=message['ReceiptHandle']
            )