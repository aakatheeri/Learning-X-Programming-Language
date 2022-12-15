
## List comprehensions
myList = [1,2,3,4,5]
# print( [2*item for item in myList] )

## List comprehensions with filters
myList = list(range(100))
filteredList = [item for item in myList if item % 10 == 0]
# print (filteredList)

## List comprehensions with functions
myString = 'My name is Ryan Mitchell. I live in Boston.'
# print ( myString.split() )

def cleanWord(word):
    return word.replace('.', '').lower()

# print( [ cleanWord(word) for word in myString.split() ] )

## Nested list comprehensions
print( [ [cleanWord(word) for word in sentence.split()] for sentence in myString.split('.') ] )
