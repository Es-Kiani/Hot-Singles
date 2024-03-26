# import time


def Wichestan_1():
    n = int(input())
    modes = [1]*(n-1)
    sum = n-1

    for i in range(1, n+1):
        modes.append(i)
        sum += i

    count = 2*n-1
    for i in range(1, n+1):
        for j in range(2, i):
            if i % j == 0:
                modes.append(j)
                c += 1
                sum += j
    print(count, sum)


def Wichestan_2():
    n = int(input())
    modes = []
    sum = 0
    count = 0

    for i in range(1, n+1):
        for j in range(1, i+1):
            if i % j == 0:
                modes.append(j)

    for item in modes:
        count += 1
        sum += item

    print(count, sum)


if __name__ == "__main__":
    # start = time.time()
    
    #! Wichestan_1()
    #! Wichestan_2()
    
    # end = time.time()
    # print(end-start)
