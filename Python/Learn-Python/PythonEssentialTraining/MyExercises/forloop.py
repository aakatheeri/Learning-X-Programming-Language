
## For
myList = [1,2,3,4,5]
# for item in myList:
#     print(item)


## Pass
animalLookup = {
    'a': ['aavb', 'antelope'],
    'b': ['bear'],
    'c': ['cat'],
    'd': ['dog']
}
# for letter, animals in animalLookup.items():
#     pass

## Continue
# for letter, animals in animalLookup.items():
#     if (len(animals) > 1):
#         continue
#     print(f'Only one animal: {animals[0]}')


## Break
for letter, animals in animalLookup.items():
    if (len(animals) > 1):
        print(f'Found {len(animals)}: {animals}')
        break
    # print(f'Only one animal: {animals[0]}')

## For / Else
