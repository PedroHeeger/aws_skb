import json
import urllib.request

def handler(event, context):
    d = ""
    try:
        with urllib.request.urlopen('https://httpbin.org/get') as response:
            data = response.read()
        print("data:",json.loads(data))
        d='Success'   
    except:
        d='Fail'
        print("Couldn't reach the URL")
    return d
