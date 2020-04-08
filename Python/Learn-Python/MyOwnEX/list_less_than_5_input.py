print "This script list numbers that less than 5, enter random 5 numbers: "

numbers = []

numbers.append(raw_input())
numbers.append(raw_input())
numbers.append(raw_input())
numbers.append(raw_input())
numbers.append(raw_input())

print "\nYour numbers that less than 5 are:"
for i in numbers:
	if int(i) < 5:
		print i

