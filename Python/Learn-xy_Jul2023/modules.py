################################################
#                Modules                       #
################################################

# You can import modules
import math
print( math.sqrt(16) ) # 4.0

# You can get specific functions from a module
from math import ceil, floor
print( ceil(3.7) )
print( floor(3.7) )

# You can import all functions from a module.
# Warning: this is not recommended
#from math import *

import math as m
print( math.sqrt(16) == m.sqrt(16) ) # => True

print()

# You can find out which functions and attributes
# are defined in a module.
import math
print( dir(math) )