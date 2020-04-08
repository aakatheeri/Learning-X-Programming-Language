class Animal(object):
	def __init__(self, name):
		self.name = name

	def talk(self):
		print "Generic Animal Sound"

class Cat(Animal):
	def talk(self):
		print '%s says, "Meow!"' % (self.name)

cat = Cat("Groucho")
cat.talk() #invoke method