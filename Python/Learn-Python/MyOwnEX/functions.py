# print the full name function
def print_full_name(firstname, lastname):
	print "%s %s" % (firstname, lastname)

# greeting the person function
def greeting(firstname, lastname, age=None):
	print "Hello %s %s, nice to see you!" % (firstname, lastname)

	if age is not None:
		print """
You are %s years old
I hope you are doing well!
		""" % age


# testing
print "Your name is",
print_full_name("Ahmed", "Alkatheeri")
greeting("Ahmed", "Alkatheeri")
