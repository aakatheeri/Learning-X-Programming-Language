
## Opening and Reading

# f = open('file.txt', 'r')
# print(f)

# print( f.readline() )

# print( f.readlines() )

# for line in f.readlines():
        # print( line.strip() )
        # print( line[:-1] )
        # print( line.replace('\n', ''))

## Writing files (w = write | a = append)
# f = open('another_file.txt', 'a')
# f.write('Line 3 \n')
# f.write('Line 4 \n')
# f.close()

with open('another_file.txt', 'a') as f:
    f.write('Another Line\n')
    f.write('You are Beautiful!\n')

print(f)
