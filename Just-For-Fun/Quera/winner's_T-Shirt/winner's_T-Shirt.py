def Winners_T_Shirt():
    XL_Shoulder, XL_Hight = [int(x) for x in input().split()]
    person_Shoulder, person_Hight = [int(x) for x in input().split()]

    if (person_Shoulder <= XL_Shoulder and person_Hight <= XL_Hight):
        print("yes")
        return
    print("no")
    return


if __name__ == "__main__":
    Winners_T_Shirt()
