import pymongo
import sys
import time

##Create a MongoDB client, open a connection to Amazon DocumentDB as a replica set and specify the read preference as secondary preferred
client = pymongo.MongoClient(
    'mongodb://dbadmin:fj6QlO8fYtGL@mydocdb.cqw3on8gcnoh.us-west-2.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=./global-bundle.pem&retryWrites=false'
)

# client = pymongo.MongoClient('mongodb://dbadmin:fj6QlO8fYtGL@mydocdb.cluster-cfax8ujxsxep.us-east-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false')

##Specify the database to be used
db = client.mydb

##Specify the collection to be used
col = db.profiles

##Find a profile that was previously entered using the shell
x = col.find_one({"name": "Matt"})

##Print the result to the screen
print(x)

##Add an additional player record
col.insert_one({ "_id" : 5, "name" : "Ahmed", "status": "active", "level": 8, "score": 93})
time.sleep(2)

##Print the new full list
print("The full list of players is now")
for player in col.find():
    print(player)

##Remove an additional player record
col.delete_one({ "_id" : 5, "name" : "Ahmed", "status": "active", "level": 8, "score": 93})
time.sleep(2)

##Print the new full list 2
print("The full list of post-removal players is now")
for player in col.find():
    print(player)

##Close the connection
client.close()