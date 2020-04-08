## Animal is-a object (yes, sort of confusing) look at the extra credit
class Animal(object):
    pass

## Dog is-a object | instance of Animal
class Dog(Animal):

    def __init__(self, name):
        self.name = name

## Cat is-a object
class Cat(Animal):

    def __init__(self, name):
        self.name = name

class Person(object):

    def __init__(self, name):
        self.name = name

        self.pet = None

class Employee(Person):

    def __init__(self, name, salary):

        super(Employee, self).__init__(name)
        self.salary = salary

class Fish(object):
    pass

class Salmon(Fish):
    pass

class Halibut(Fish):
    pass

## rover is-a Dog
rover = Dog("Rover")

## Satan is-a Cat
satan = Cat("Satan")

## Mary is-a Person
mary = Person("Mary")

mary.pet = satan

## Frank is-a Employee
frank = Employee("Frank", 120000)
frank.pet = rover

## Ahmed is-a Employee
ahmed = Employee("Ahmed", 140500)

flipper = Fish()

crouse = Salmon()

harry = Halibut()
