# filename will be imported from CMD parameter (like > script.py filename)
from sys import argv
script, filename = argv

# open new file
fileContent = open(filename)

# create file content list
fileContentByLines = fileContent.readlines()

# create new file content variable
newFileContentList = []

# remove newline symbol from file content list items
for i in fileContentByLines:
	# append new item with removing newline symbol from it
	newFileContentList.append(i[:-1])

print '\nThe even numbers from file that you choose (%s) are:' % filename

# print numbers in new file content list
for i in newFileContentList:

	# check for even numbers from all numbers of new file content list
	if (int(i) % 2 == 0):

		# print even numbers
		print i

print ''
