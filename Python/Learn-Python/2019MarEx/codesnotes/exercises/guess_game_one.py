import random

# create random number between 1 and 9 (including 1 & 9)
number = int( random.randint(1,9) )

# ask user to guess the number program choose
print 'We choose a random number, and we want from you to guess that number!\n'
guess_number = int( raw_input('What is that number? \n > ') )

# check if number is correct or not, is it near or away from random number
if guess_number == number:
    print 'Exactly! your guessed number is %d, and our number is %d' % (guess_number, number)
elif guess_number < 1 or guess_number > 9:
    print 'Out of range!'
elif guess_number > number and guess_number <= number+2:
    print 'Little high! your guessed number is %d, and our number is %d' % (guess_number, number)
elif guess_number > number and guess_number >= number+2:
    print 'Going high! your guessed number is %d, and our number is %d' % (guess_number, number)
elif guess_number < number and guess_number >= number-2:
    print 'Little low! your guessed number is %d, and our number is %d' % (guess_number, number)
elif guess_number < number and guess_number <= number-2:
    print 'Going low! your guessed number is %d, and our number is %d' % (guess_number, number)
else:
    print 'Something wrong! - guess number: %d| our number: %d' % (guess_number, number)
