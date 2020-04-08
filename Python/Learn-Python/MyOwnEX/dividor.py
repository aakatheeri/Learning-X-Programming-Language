print "This progarm take numbers from user and list the number than can be divided by another number."

print "Enter 5 random numbers:"

number_1 = raw_input("")
number_2 = raw_input("")
number_3 = raw_input("")
number_4 = raw_input("")
number_5 = raw_input("")

print "Your divisors are:"

numbers = [int(number_1), int(number_2), int(number_3), int(number_4), int(number_5)]
new_numbers = []
for x in numbers:
	if x/26:
		new_numbers.append(x)
		print x
