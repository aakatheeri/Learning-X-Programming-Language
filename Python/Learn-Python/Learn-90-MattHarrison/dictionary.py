# dictionary bring key and value for each item
age = {}
age['george'] = 10
age['fred'] = 12
age['henry'] = 10
print age['george']

# check if key exist on dictionary
print 'george' in age

# get value of key of existing dictionary
print age.get('georged', 'Not Found')

# delete dictionary item
del age['henry']
print age