# ['square', 'circle', 'rectangle', 'triangle']
import math


def get_func(shapes_List):
    res_Func = []
    for shape in shapes_List:
        if shape == "square":
            res_Func.append(square_Area)
        elif shape == "circle":
            res_Func.append(circle_Area)
        elif shape == "rectangle":
            res_Func.append(rectangle_Area)
        elif shape == "triangle":
            res_Func.append(triangle_Area)
    return res_Func


def square_Area(length):
    return length*length


def circle_Area(r):
    return r*r*math.pi


def rectangle_Area(length, hight):
    return length*hight


def triangle_Area(base, hight):
    return base*hight/2


ls = get_func(['square', 'circle', 'rectangle', 'triangle'])


print(ls[0](1))
print(ls[1](2))
print(ls[2](2, 4))
print(ls[3](4, 5))

# 1
# 12.566370614359172
# 8
# 10.0
