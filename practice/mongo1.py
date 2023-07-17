from pymongo import MongoClient
client = MongoClient('localhost:27017')
db=client.get_database('mscit')
records=db.student
print('count of records ',records.count_documents({}))
insertquery2={'firstname':'riya','age':22,'place':'delhi','gender':'female'}
records.insert_one(insertquery2)
for v in records.find():
    print(v)
print('inserted')
upquery={'age':22}
new={'$set':{'place':'goa'}}
records.update_one(upquery,new)
for v in records.find():
    print(v)
print('updated')
records.delete_one({'age':22})
for v in records.find():
    print(v)
print('deleted')

insertmany=[{'firstname':'heheh','age':22,'place':'mumbai','gender':'male'},
            {'firstname':'hoho','age':21,'place':'kulu','gender':'female'},
            {'firstname':'hahah','age':22,'place':'ooty','gender':'male'}]
records.insert_many(insertmany)
for v in records.find():
    print(v)
print('inserted many')

upquery={'age':22}
new={'$set':{'place':'goa'}}
records.update_many(upquery,new)
for v in records.find():
    print(v)
print('updated')
records.delete_many({'age':22})
for v in records.find():
    print(v)
print('deleted')
