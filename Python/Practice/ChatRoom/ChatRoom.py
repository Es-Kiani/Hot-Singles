class User:
    ActiveUsers = []
    ActiveUserCount = 0

    def __init__(self, name, family, age):
        self.name = name
        self.family = family
        self.age = age
        ActiveUserDict = {'User Name': self.name + " " + self.family, 'Age': self.age}
        User.ActiveUsers.append(ActiveUserDict)
        User.ActiveUserCount += 1



User_1 = User("Esfandiar", "Kiani", 18)
User_2 = User("Faranak", "Soleimanii", 33)
User_3 = User("Rezvane", "Bari", 24)
User_4 = User("Aria", "Amiri", 19)
User_5 = User("Ali", "Fazeli", 20)

print({User.ActiveUsers})
print(User.ActiveUserCount)
