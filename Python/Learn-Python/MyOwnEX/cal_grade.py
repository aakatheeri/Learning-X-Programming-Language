# calculate grades function
def calculate_grade(grade):
	if grade <= 100 and grade >= 90:
		return 'A'
	elif grade <= 89 and grade >= 80:
		return 'B'
	elif grade <= 79 and grade >= 70:
		return 'C'
	elif grade <= 69 and grade >= 60:
		return 'D'
	else:
		return 'F'

# asking a user about its grade
user_grade = raw_input("What is your grade form 100? ")
print "Your grade is %s " % calculate_grade(int(user_grade))
