list = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

'''for i in list:
    if (i < 5):
        print i'''
# create new filtered list
x = []

# check for each element in first list
for i in list:
    # check if element number is less than 5 and not available on x list
    if (i < 5 and i not in x):
        # append element number to x list
        x.append(i)

# print x list
print x
