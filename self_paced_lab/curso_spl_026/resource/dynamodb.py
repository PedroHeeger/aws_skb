import boto3
dynamo = boto3.client('dynamodb')

#####
# Challenge 1: Put the entry for Danish into the LanguagesTable
#   "Language": "Danish"
#   "Code": "da"
#####
dynamo.put_item(
    TableName="????",
    Item={?????
          })

#####
# Challenge 2: Retrieve the entry for Danish
#####
response = dynamo.get_item(
    TableName="????",
    Key={?????})

print("")  # adds a blank line to format output
print(response['Item'])
print("")  # adds a blank line to format output
