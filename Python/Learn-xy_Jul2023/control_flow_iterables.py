
# Let's just make a variable
some_var = 5

# Here is an if statement. Indentation is significant in Python!

if some_var > 10:
    print('some_var is totally bigger than 10.')
elif some_var < 10:
    print('some_var is smaller than 10.')
else:
    print('some_var is indeed 10.')

"""
    Multiple line comments

    For loops interate over lists prints:
        dog is a mammal
        cat is a mammal
        mouse is a mammal
"""
for animal in ['dog', 'cat', 'mouse']:
    # You can use format() to interpolate formatted
    print("{} is a mammal".format(animal))

print()

"""
    range (lower, upper) returns an iterable of numbers from the lower number to the uppoer number prints:
        4
        5
        6
        7
"""

for i in range(4,8):
    print(i)

print()

for i in range(4):
    print(i)

print()

"""
range (lower, upper, step) returns an iterable of numbers from the lower number to the uppoer number, while incrementing by step. If step is not indicated, the default value is 1.
prints:
    4
    6
"""

for i in range (4, 8, 2):
    print(i)

print()

animals = ['dog', 'cat', 'mouse']
for i, value in enumerate(animals):
    print(i, value)

print()
"""
While loops go until a condition is no longer met.
prints:
    0
    1
    2
    3
"""
x = 0
while x < 4:
    print(x)
    x += 1 # Shorthand for x  = x + 1

print()

# Handle exceptions with a try / except block
try:
    # use 'raise' to raise an error
    raise IndexError('This is an index error')
except IndexError as e:
    pass    # Refrain from this, provide a recovery (next eaxmple)
except (TypeError, NameError):
    pass    # Multiple exceptions canb e processed jointly.
else:
        print('All good!')
        
finally:    # Execute under all
    print('We can clean up resouerces here')

