class Human:
    def __init__(self,name,surname,age): #profession
        self.name = name
        self.surname = surname
        self.age = age
      #  self.profession = profession 
    def __str__(self):
        return f"{self.name},{self.surname},{self.age}"  #,{self.profession}

class Employee(Human):
    def __init__(self,name,surname,age):
        super().__init__(name,surname,age)

    def hire(self):  #work
        print(f"{self.name}{self.surname} is hired to work")    #{work}

    def fire(self):
        print(f"{self.name}{self.surname} is fired from work")

class Engineer(Human):
    def __init__(self,name,surname,age,profession):
        super().__init__(name,surname,age)
        self.profession = profession

    def __str__(self): 
        return super().__str__() + f", Profession: {self.profession}"

class Manager(Human):
    def __init__(self,name,surname,age):
        super().__init__(name,surname,age)
        self.engineers = []

    def hire_engineer(self,engineer):
        if len(self.engineers) < 10:
            self.engineers.append(engineer)
            print(f"{engineer.name}{engineer.surname} is added")
        else:
            print("No empty vacations. Team is full")

    def fire_engineer(self,engineer):
        if engineer in self.engineers:
            self.engineers.remove(engineer)
            print(f"{engineer.name} is fired")
        else:
            print(f"{engineer.name} is not found")
    def list_engineers(self):
        print(f"Engineers managed by {self.name} {self.surname}:")
        for engineer in self.engineers:
            print(engineer)

if __name__ == '__main__':
    human1 = Human("Kim","Kardashyan",30)
    employee1 = Employee("Kanye","West",35)

    print(human1)
    print(employee1)

    employee1.hire()
    employee1.fire()
    print()
    engineer1 = Engineer("Sherigi","Gago",28,"Mechanical Engineering")
    engineer2 = Engineer("Chuchu","Anarak",55,"Mans_calming Engineering")
    engineer3 = Engineer("Bulbi","Vardan",28,"Sales Engineering")
    engineer4 = Engineer("Varoyi","Tiko",44,"Buying Engineering")
    engineer5 = Engineer("Tizii","Klz",28,"Goxakan Engineering")
    engineer6 = Engineer("Chax","Aragac",60,"Eating Engineering")
    engineer7 = Engineer("Shimpi","Borik",35,"Security Engineering")
    engineer8 = Engineer("Stigi","Gevor",48,"Farming Engineering")
    engineer9 = Engineer("Pxi","Artush",32,"Rubbing Engineering")
    engineer10 = Engineer("Bubur","Hakob",35,"Communications Engineering")
    engineer11 = Engineer("Aloshi","Davo",32,"Electrical Engineering")
    print()
    manager1 = Manager("Mike", "Wazovski", 35)
    manager1.hire_engineer(engineer1)    #gorc in 
    manager1.hire_engineer(engineer2)    #gorc in 
    manager1.hire_engineer(engineer3)    #gorc in 
    manager1.hire_engineer(engineer4)    #gorc in 
    manager1.hire_engineer(engineer5)
    manager1.hire_engineer(engineer6)
    manager1.hire_engineer(engineer7)
    manager1.hire_engineer(engineer8)
    manager1.hire_engineer(engineer9)
    manager1.hire_engineer(engineer10)
    manager1.hire_engineer(engineer11)
    print()
    manager1.list_engineers()
    print()
    manager1.fire_engineer(engineer1)      #gorci out  
    print()
    manager1.list_engineers()     






