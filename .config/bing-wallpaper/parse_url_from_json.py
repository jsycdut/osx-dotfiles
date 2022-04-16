import json

with open("./api-data.json", "r") as file:
    jsonData = json.load(file)

picUrl = jsonData["url"]
print(picUrl)
