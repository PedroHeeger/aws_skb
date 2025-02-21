import boto3
import csv
import subprocess

session = boto3.Session()
ec2_region = session.region_name
# execute the AWS CLI commands
#ec2_region = subprocess.getoutput(
#    'curl -s "http://169.254.169.254/latest/meta-data/placement/availability-zone" | sed "s/[a-z]$//"')

# Below used for troubleshooting region designation
# Save ec2_region to a text file
# with open('/home/ec2-user/environment/region.txt', 'w') as f:
# f.write(ec2_region)

dynamodb = boto3.resource('dynamodb', region_name=ec2_region)
table = dynamodb.Table('LanguagesTable')

with open('/home/ec2-user/environment/.languages.csv', 'r') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        table.put_item(Item=row)
