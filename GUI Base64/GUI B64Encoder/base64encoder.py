import string


def Base64Encode(text):
    bin_Text = ""
    for ch in text:
        tmp = bin(ord(ch))[2:]
        bin_Text += '0'*((8 - len(tmp)) % 8) + tmp

    charMap = string.ascii_uppercase + string.ascii_lowercase + "0123456789" + "+/"

    padding = 0
    if len(bin_Text) % 6 != 0:
        padding = (6 - (len(bin_Text) % 6))
        bin_Text += '0'*padding

    encoded = ""
    for i in range(0, len(bin_Text), 6):
        encoded += charMap[int(bin_Text[i:i+6], 2)]

        # print(f"charmap[{int(bin_Text[i:i+6], 2)}]: {charMap[int(bin_Text[i:i+6], 2)]}")
    # print(padding, ' ', padding/2)

    return encoded + (padding//2)*'='


if __name__ == "__main__":
    text1 = "ABC"
    text2 = "Hello World"
    text3 = "jadiisf312\\"
    
    print(Base64Encode("097687gf53234gfv"))
