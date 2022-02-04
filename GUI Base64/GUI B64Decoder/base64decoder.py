import string


def Base64Decode(text):
    charMap = string.ascii_uppercase + string.ascii_lowercase + "0123456789" + "+/"

    padding = 2 if '==' in text else 1 if '=' in text else 0

    # print(padding)
    text = text[:len(text)-padding]
    # print(text)

    bin_Text = ""
    for ch in text:
        tmp = bin(charMap.index(ch))[2:]
        bin_Text += '0'*((6 - len(tmp)) % 6) + tmp

    # print(bin_Text)

    decoded = ""
    for i in range(0, len(bin_Text), 8):
        decoded += chr(int(bin_Text[i:i+8], 2))

    return decoded


if __name__ == "__main__":
    cypher1 = "QUJD"
    cypher2 = "SGVsbG8gV29ybGQ="
    cypher3 = "MDk3Njg3Z2Y1MzIzNGdmdg=="

    print(Base64Decode(cypher1))
