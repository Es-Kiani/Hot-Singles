def counter(max):
    Num = 1
    while Num <= max:
        yield Num
        Num += 1

print(list(counter(10)))
print(next(counter(10)))

nextCounter = counter(5)
print(next(nextCounter))
print(next(nextCounter))
print(next(nextCounter))
print(next(nextCounter))

# -----------------------------

