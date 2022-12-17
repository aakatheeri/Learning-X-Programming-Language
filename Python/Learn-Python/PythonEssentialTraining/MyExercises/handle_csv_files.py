## Use CSV File

import csv

'''
with open('top_management_employees.csv', 'r') as f:
    reader = list(csv.reader(f, delimiter='\t'))
    # next(reader) # skip the line
    for row in reader[1:]: #skip the first line
        print( row )
# print( type(reader) )
'''

## Dictionary output reading
"""
with open('top_management_employees.csv', 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        print (row)
"""

## Filtering Data
"""
with open('top_management_employees.csv', 'r') as f:
    data = list(csv.DictReader(f))

primes = []
for number in range(2,99):
    for factor in range(2, int(number**0.5)):
        if number % factor == 0:
            break
        else:
            primes.append(number)

data = [row for row in data if int(row['ID']) in primes and row['Position'] == 'CEO']
print( len(data) )
"""

with open('top_management_employees.csv', 'r') as f:
    data = list(csv.DictReader(f))

data = [row for row in data if row['Position'][0:1] == 'C']

print (f'Number of Chiefs in company is {len(data)} within the CEO position.')

## Writing Data

"""
new_employees = [{
    'ID': '9',
    'Name': 'Saeed Ali',
    'Position': 'Director'
}]
with open('top_management_employees.csv', 'a') as f:
    writer = csv.writer(f)
    for employee in new_employees:
        writer.writerow([employee['ID'], employee['Name'], employee['Position']]);
"""
