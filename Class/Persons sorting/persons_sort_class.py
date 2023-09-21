class Person:
    def __init__(self,name,surname,age):
        self.name = name
        self.surname = surname
        self.age = age

    def __str__(self):
        return f"{self.name},{self.surname},{self.age}"

class PersonManager(Person):
    def __init__(self,filename):
        self.filename = filename
        self.persons = self.read_persons_from_file()

    def read_persons_from_file(self):
        persons = []
        with open(self.filename, 'r') as file:
            for i in file:
                parts = i.strip().split(',')
                if len(parts) == 3:
                    name,surname,age = parts
                    age = int(age)
                    person = Person(name.strip(), surname.strip(), age)
                persons.append(person)
        return persons

    def sort_persons_by_age(self):
        return sorted(self.persons, key=lambda person: person.age)

    def print_sorted_persons(self):
        sorted_persons = self.sort_persons_by_age()
        print("Sorted Persons by Age")
        for i in sorted_persons:
            print(i)

if __name__ == "__main__":
    filename = "persons.txt"
    manager = PersonManager(filename)
    manager.print_sorted_persons()
