a = [1,2,3,4,5,6,7]
b = [5,6,7,7,8,9,10,11,12]
overlap = []

for x in b:
	if x in a and x not in overlap:
		overlap.append(x)

print "Duplicated numbers between two arrays: "
print overlap
