# create variables
first_name = 'Ahmed'
last_name = 'Alkatheeri'
fullname = first_name + ' ' + last_name
age = 27

# print greeting
greeting_text = 'My name is %s, and I\'m %d years old'
greeting_parameters = (fullname, age)
print greeting_text % greeting_parameters
