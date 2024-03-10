from random import randint
import pickle


output = [[], []]

for i in range(0, 999):
    output[0].append(randint(0, 10))
    output[1].append(randint(1, 10))


output[0].append(0)
output[1].append(0)

with open('rand_Input.txt', 'w') as rI:
    for i in range(0, 1000):
        rI.write(str(output[0][i]) + " " + str(output[1][i]) + '\n') 
