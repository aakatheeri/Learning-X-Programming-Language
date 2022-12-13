
## Lists
my_list = [1, 2, 3, 4]
# print(my_list)
my_list.append(5)
# print(my_list)

second_list = ['first', 'another one'];
# print(second_list)

another_one = [1, 'second', False, []]
list_of_list = [[1,2,3], [True, False], []] # list of lists

# print(list_of_list)
# print(len(list_of_list), '\n') # print length of list

## Sets (should be unique)
my_set = {1, 2, 3, 4}
# print(my_set)
# print( type(my_set) ) # set
# print( len(my_set) ) # length

my_set = {1,1,2,2}
# print( len(my_set) ) # 2
# print(my_set)

# print( [1,2] == {2,1} ) # False
# print( {1,2} == {2,1} ) # True - should be a same data type

## Tubles |
    # once it added can't be changed or add another value to it |
    # momery effient,
    # good for lots of little things

my_tuble = (1, 2);
# print(my_tuble)
# print( (1,2) == (2,1)) # False - should be same data type, same value, same key index

## Dictionaries
profile_dic = {
    'name': 'Ahmed',
    'age': 20
}
print(profile_dic['name'])

###
# Sets and Dictionaries
#   Both are defined with curly brackets
#   Sets have unique values, Dictionaries have unique keys
#   The order doesn't matter
###
