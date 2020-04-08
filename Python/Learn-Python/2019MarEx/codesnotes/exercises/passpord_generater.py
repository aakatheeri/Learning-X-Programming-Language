import random

# generate passpord method
def generate_password(length):
    password = []
    for i in range(0,length):
        password.append( random.choice('ABCDEFGHIJKLMNabcdefgfigklmn!@#$%^&*()1234567890') )

    return ''.join(password)

# keep asking user
status = True
while status == True:

    # ask user if he want new password
    ask = raw_input('Do you want new password? Y/N \n > ')

    # if he ask, generate new password, and ask again
    if ask == 'Y' or ask == 'y':
        print 'New Password ==>', generate_password(14)
    # if he don't want, leave him alone! (stop the loop)
    elif ask == 'N' or ask == 'n':
        print 'Nice to meet you!'
        status = False
    # if answer other than Y and N, stop the loop
    else:
        print 'Please run program again!'
        status = False
