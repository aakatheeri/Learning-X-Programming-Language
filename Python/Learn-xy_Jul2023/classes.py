# We use the 'class' statemetn to create a class
'''
class Human:
    
    # property
    species = 'H. sapiens'

    # instance method
    def __init__(self, name):

        self.name = name

        # Initialize property
        self._age = 0

    def say(self, msg):
        print('{name}: {message}'.format(name=self.name, message=msg))

ahmed = Human('Ahmed Alkatheeri')
ahmed.say('Hello!')

'''

class Person:

    def __init__(self, name, age):
        self.name = name
        self.age = age

    # the __str__() function controls what should be returned when the class object is represented as a string
    # If the __str__() function is not set, the string representation of the object is returned.
    def __str__(self):
        return f"{self.name}({self.age})"

p1 = Person('John', 36)
print(p1)
