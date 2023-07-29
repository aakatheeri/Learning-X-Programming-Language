# import json
# # Writing to a file
# contents = {'aa': 12, 'bb': 21}
# with open('myfile1.txt', 'w+') as file:
#     file.write(str(contents))


# with open('myfile2.txt', 'w+') as file:
#     file.write(json.dumps(contents)) # write an object to a file



#reading from a file
with open('myfile1.txt', 'r+') as file:
    contents = file.read() # reads a string from file

print(contents)

import json
with open('myfile2.txt', 'r+') as file:
    contents = json.load(file)

print(contents)