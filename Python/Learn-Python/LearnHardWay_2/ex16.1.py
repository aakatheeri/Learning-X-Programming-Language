from sys import argv

# set arguments variable
script, file_name = argv

# get confirmation to overwrite of file content from user
confirm = raw_input("Are you sure you want to overwrite on %s file? "% file_name) 

# make sure the user is agree to overwrite on the file he choose
if (confirm == 'yes'):

	# overwrite the file to recieve the content
	file_source = open(file_name, 'w')
	file_source.truncate()

	# get new content of file from user
	print "Type the lines that you want to write on %s file" % file_name
	line1 = raw_input('-> ')
	line2 = raw_input('-> ')
	line3 = raw_input('-> ')

	# display new content of file
	print "\nThis is a content of the file you choose:"
	print "%s\n%s\n%s" % (line1, line2, line3)

	# write content to file
	file_source.write(line1)
	file_source.write("\n")
	file_source.write(line2)
	file_source.write("\n")
	file_source.write(line3)
else:
	print ''


