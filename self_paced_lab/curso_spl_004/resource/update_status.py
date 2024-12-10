import boto3
import sys
import time

sqs = boto3.client("sqs")

# Set status to not started
response = sqs.send_message(
    QueueUrl='BackgroundCheckApp',
    MessageBody='The Background Check Job has not been started. Currently gathering required data to process.'
)
# Timeout simulates various processes running in-between automatic status updates
time.sleep(8)


# Set status to started
response = sqs.send_message(
    QueueUrl='BackgroundCheckApp',
    MessageBody='The Background Check Job has been started.'
)
# Timeout simulates various processes running in-between automatic status updates
time.sleep(8)

# Set status to finished
response = sqs.send_message(
    QueueUrl='BackgroundCheckApp',
    MessageBody='The Background Check Job has finished.'
)