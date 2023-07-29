
#################################################
#               Functions                       #
#################################################

# use 'def' to create new functions
def add(x, y):
    print('x is {} and y is {}'.format(x, y))
    return x + y

# Calling functions with parameters
add(5, 6) # => prints out "x is 5 and y is 6"

add(y=6, x=5)

print()

# You can define functions that take a cariable number of positional arguments
def varargs(*args):
    return args



print(varargs(1, 2, 3))
print()

# You can define functions that take a variable number of keyword arguments as well
def keyword_args(**kwargs):
    return kwargs

print( keyword_args(big='foot', loch='ness') )

print()

# global scope
x = 5
def set_x(num):
    x = num
    print(x)

set_x(43)
print()

# Python has first class functions
def create_adder(x):
    def adder(y):
        return x + y
    return adder

add_10 = create_adder(10)
print( add_10(3) )