#################################################
#              Class Inheritance                #
#################################################

# Inheritance allows us to define a class that inherits all the methods and properties from another class

# Parent class is the class being inherited from, also called base class
# Child class is the class that inherits from another class, also called derived class

class Person:
    def __init__(self, fname, lname):
        self.firstname = fname
        self.lastname = lname

    def printname(self):
        print(self.firstname, self.lastname)

x = Person('John', 'Doe')
x.printname()

# inherit Student class from Person
'''
class Student(Person):
    pass # use pass when you don't want to add any values or properties to the class

x = Student('Mike', 'Olsen')
x.printname()
'''


### super() function will make the child class inherit all the methods and properties from its parent

class Student(Person):
    def __init__(self, fname, lname, grad_year):
        super().__init__(fname, lname)
        self.graduationyear = grad_year

    def welcome(self):
        print('Welcome', self.firstname, self.lastname, 'to the class of', self.graduationyear)

x = Student('Mike', 'John', 2023)
x.printname()
# print(x.graduationyear)
x.welcome()

print()