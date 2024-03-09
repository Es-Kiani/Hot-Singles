import math


def f(n):
    for digit in n[::-1]:
        if digit != '0':
            return digit


print(f(str(math.factorial(int(input())))))
