# ask user for a number
number = int( raw_input("Enter a number to know is it Odd or Even > \n ") )


# check if input number has positive number when be devided by 2
# if number is 1 then it's odd, if 0 then it's even, print result to the user
if number % 4 == 0:
    print 'The number (%d) is even and can be multiplied by 4' % number
elif number % 2 == 1:
    print 'The number (%d) is odd!' % number
elif number % 2 == 0:
    print 'The number (%d) is even!' % number
