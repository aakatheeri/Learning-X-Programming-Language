
# variables
x = "There are %d types of people." % 10
binary = "binary"
do_not = "don't"
y = "Those who know %s and those who %s." % (binary, do_not)

# printing
print x
print y

print "I said: %r." % x
print "I also said: '%s'." % y

# variables
hilarious = False
joke_evaluation = "Isn't that joke so funny?! %r"

# printing
print joke_evaluation % hilarious

# variables
w = "This is the left side of ..."
e = "a string with a right side."

# printing
print w + e
