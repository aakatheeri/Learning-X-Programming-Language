
## Dictionary Comprehensions
animalList = [('a', 'aardvark'), ('b', 'bear'), ('c', 'cat'), ('d', 'dog')]
# animals = { item[0]: item[1] for item in animalList }
animals = { key: value for key, value in animalList }

# print ( animals )
# print( animals.items() )
print( [{
    'letter': key,
    'name': value
} for key, value in animals.items()])
