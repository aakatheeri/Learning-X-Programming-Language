from sys import argv
script, nickname = argv

print "From %s, I want to say hello %s!" % (script, nickname)

first_name = raw_input("What's your first name? ")
last_name = raw_input("What's your last name? ")
age = raw_input("How old are you? ")

print "[[[These are your imformation]]]"
print '*' * len("[[[These are your imformation]]]")

print """
Your name is %s %s, and you are %s years old

			Nich to meet you!
""" % (first_name, last_name, age)

print '*' * len("[[[These are your imformation]]]")
