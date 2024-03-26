class User:

    def __init__(self, UserName="", UserFamily="", UserAge=""):
        self.Name = UserName
        self.Family = UserFamily
        self.Age = UserAge

    def __repr__(self):
        return f"{self.Name} {self.Family}: {self.Age}"

    @property
    def Info(self):
        return f"\nUser Info is: \n Name: {self.Name} \n Family: {self.Family} \n Age: {self.Age}"
    

