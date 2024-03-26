def Best_Gift():
    base_Gift = str(input())
    best_Gift = ""

    for bit in range(len(base_Gift)):
        if base_Gift[bit] == '0':
            continue
        best_Gift += base_Gift[bit:]
        break

    if best_Gift == "":
        print(0)
        return
    print(best_Gift)
    return


if __name__ == "__main__":
    Best_Gift()
