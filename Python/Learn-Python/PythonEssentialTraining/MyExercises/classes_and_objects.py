
## Classes

class Dog:
    def __init__(self, name):
        self.name = name
        self.age = 4

    def speak(self):
        print(self.name + ' says: Bark!')

my_dog = Dog('Golf')
my_dog.speak();
