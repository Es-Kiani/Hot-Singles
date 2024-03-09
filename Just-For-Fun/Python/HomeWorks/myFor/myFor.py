def myFor(Iterable):
    Iterator = iter(Iterable)

    while True:
        try:
            print(next(Iterator))
        except StopIteration:
            break


myNums = [1, 2, 3, 4, 5]

myFor(myNums)
