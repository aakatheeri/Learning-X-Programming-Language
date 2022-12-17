import json
from json import JSONDecodeError, JSONEncoder
## Loading JSON
jsonString = '{"a": "apple", "b": "bear", "c": "cat"}'

try:
    print( json.loads(jsonString) )
except JSONDecodeError:
    print('Could not parse JSON!')


## Dumping JSON
pythonDict = {
    'a': 'apple',
    'b': 'bear',
    'c': 'cat'
}
print(json.dumps(pythonDict))

## Custom JSON Decoders
class Animal:
    def __init__(self, name):
        self.name = name

class AnimalEncoder(JSONEncoder):
    def default(self, o):
        if type(o) == Animal:
            return o.name
        return super().default(o)

pythonDict = {
    'a': Animal('arnold'),
    'b': Animal('bear'),
    'c': Animal('cat')
}
print( json.dumps(pythonDict, cls=AnimalEncoder) )
