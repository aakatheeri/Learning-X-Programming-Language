def create_board(numberOfcells):

	intial = 0
	while intial < numberOfcells:
		print " --- " * numberOfcells
		print "|" + "    |" * numberOfcells
		intial+=1
	print " --- " * numberOfcells


print "*** Tic Tac Toe Game Board Creator ***"
numberOfRequiredCells = raw_input("How many cells do want to create? ")

create_board(int(numberOfRequiredCells))
