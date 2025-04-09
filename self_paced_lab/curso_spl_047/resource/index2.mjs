import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { QueryCommand, DynamoDBDocumentClient } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const docClient = DynamoDBDocumentClient.from(client);

export const handler = async (event, context) => {
  try {
    const command = new QueryCommand({
          TableName:'SuperMission',
          ProjectionExpression:"SuperHero, MissionStatus, Villain1, Villain2, Villain3",
          KeyConditionExpression: "SuperHero = :superHero",
          ExpressionAttributeValues: {
              ":superHero": event.superhero
            }
    });
    const response = await docClient.send(command);
    return response.Items;
  } 
  catch (err) {
    console.log(err)
  }
  
};