class Animal(object):
	def __init__(self, name):
		self.name = name

	def talk(self):
		print "Generic Animal Sound"

animal = Animal("thing")
animal.talk()