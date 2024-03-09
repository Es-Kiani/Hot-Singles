def Sigma():
    n = int(input())
    m = int(input())

    sum = 0
    for i in range(-10, m + 1):
        for j in range(1, n + 1):
            sum += ( pow((i + j), 3) / pow(j, 2) )

    print(round(sum))
    return


if __name__ == "__main__":
    Sigma()
