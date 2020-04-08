from datetime import date

print "This script give you the year when you will be 100 years old .."

name = raw_input("What's your name? ")
age = raw_input("How old are you? ")

year_you_will_be = (date.today().year - int(age)) + 100

print """
Hi %s, will be 100 years old in %s
""" % (name, year_you_will_be)
