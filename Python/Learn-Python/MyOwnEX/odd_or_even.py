print "This script check if the number you put is even or odd!"

user_number = raw_input("Enter the number you want to check if it's even or odd: ")
result = ""

if int(user_number) % 2 == 0:
	result = "Even"
else:
	result = "Odd"

print "Your number that you choose (%s) is => %s" % (user_number, result)
