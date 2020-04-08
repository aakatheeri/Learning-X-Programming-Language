from sys import argv

def print_out_summary(first_name, last_name, age):
	print """
	Hi %s %s, nice to see you again!
	You are %s years old!
	""" % (first_name, last_name, age)

script, first_name, last_name, age = argv 

print_out_summary(first_name, last_name, age)

print "%s script is finished..." % script
