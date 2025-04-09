import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, ScanCommand } from "@aws-sdk/lib-dynamodb";

const dynamodb = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(dynamodb);

export const handler = async (event, context) => {
  const command = new ScanCommand({
    TableName:'SuperMission'
  });

  const response = await docClient.send(command);
  return response.Items;
};