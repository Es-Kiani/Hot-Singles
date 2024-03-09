def SingleDigit():
    number = str(input())
    while len(number) != 1:
        sum = 0
        for digit in number:
            sum += int(digit)
        number = str(sum)
    print(sum)


if __name__ == "__main__":
    SingleDigit()
