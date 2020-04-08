# define some string variables
x = "There are %d types of people" % 20
binary = "binary"
do_not = "don't"
y = "Those who know %s and those who %s" % (binary, do_not)

# print string statements
print x
print y

# more print of string statements
print "I said: %r." % x
print "I also said: '%s'" % y

# define other variables
hilarious = False
joke_evaluation = "Isn't that joke so funny?! %r"

# print another one
print joke_evaluation % hilarious

# print string statements from variables
w = "This is the left side of..."
e = "a string with a right side."
print w + e
