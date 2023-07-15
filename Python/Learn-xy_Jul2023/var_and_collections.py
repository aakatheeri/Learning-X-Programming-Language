# Python has a print function
print("I'm Python. Nice to meet you!")

# By default the print function also prints out a newline at the end.
# Use the optional argument and end to hange the end string.
print("Hello, World", end="!")
print("Hello " "World!")
print("Another one")

# Simple way to get input data from console
# input_string_var = input("Enter some data: ")
# print(input_string_var)
text = "yay!" if 0 > 1 else "nay!"
print(text)

##################################
#      Lists store sequences     #
##################################

names = []
names.append('Ahmed')
names.append('Salem')
print(names)
names.pop()
print(names)

another_list = ['One', 2, 'Another one', 5]
print(another_list)
print(another_list[1]) # 2
print(another_list[1:3]) # 2, 'Another one'
print(another_list[:2]) # 'One', 2
print(another_list[1:]) # 2, 'Another one', 5
print(another_list[::2]) # select every second entry
print(another_list[::-1]) # return the list on reverse order
li = another_list[:] # deep copy
print(li)

del li[1] # remove 2 from the list
print(li)

li.remove('Another one')
print(li)
print(another_list)
li.insert(1,'x3') # insert element before index
print(li)

print(len(li)) # examine the length of list

###################################################
#      Tuble (): like lists but are immutable     #
###################################################

tup = (1, 2, 3)
print(tup[0])

# type of data
print( type(1) )
print( type(1,) )
print( type(()) )
print( type({}) )
print( type('a') )

# length of tuple
print( len(tup) )

# unpack tuples (or lists) into variables
a, b, c = (1, 2, 3)
print(a, b, c)
print(b)

###################################################
#        Dictionary  { key: value}                #
###################################################
# Dictionaries store mappings from keys to values
empty_dict = {}
filled_dict = {"one": 1, "two": 2, "three": 3}
another_dict = {(1,2,3):[1,2,3]} # values can be any types
print( filled_dict )
print( another_dict )
print( another_dict.keys() )
print( list(another_dict.keys()) ) # convert keys of dictionary to list

# print specific element of dictionary
print(filled_dict["two"]) # 2
print( filled_dict.get("one") )

# adding to a dictionary
filled_dict.update({"four": 4})
print(filled_dict)

# removing an element on dictionary
del filled_dict['four']
print(filled_dict)

###################################################
#          sets {value, value, value}             #
###################################################

empty_set = set()
some_set = {1, 1, 2, 2, 3, 4}
print(some_set)
filled_set = some_set.copy() # deep copy of set
print(filled_set)