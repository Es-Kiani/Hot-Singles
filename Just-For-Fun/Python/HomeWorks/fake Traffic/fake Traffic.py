import requests
import random

url = "http://daneshjoo.shbu.ac.ir/GraduatesCommunity/GraduatesInfo.php"
data = {
    'StartingYear': 1375,
    'FldCode': 11
}
auth = ()
proxy = {
    'http': '127.0.0.1:8080'
}

n = 0
while True:
    responce = requests.post(url, data=data, proxies=proxy)
    n += 1
    print(responce, n)
