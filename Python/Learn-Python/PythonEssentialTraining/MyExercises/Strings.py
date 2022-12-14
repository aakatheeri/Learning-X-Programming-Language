
## Slicing

name = 'My name is Ryan Mitochell'
# print( name[0] )
# print( name[1] )
#
# print (name[0:7])
# print (name[:7])
# print (name[11:])

my_list = [1,2,3,4,5,6]
# print ( my_list[2:4] )
#
# print (len(name));
# print (len(my_list))

## Formating

print( 'My number is: ' + str(5) )
print( f'My number is: {5}' )
print( f'My number is: {5} and twice that is {2*5}' )

import math
print( f'Pi is: {math.pi:.2f}' )
print( 'Pi is: {}'.format(math.pi) )


## Multi-line String

myString = '''
Here is a long block of text
I can add newlines
the text doesn't stop until sees \'\'\'

'''

print( myString )
