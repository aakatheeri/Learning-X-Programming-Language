###################################################
#                   Advanced                      #
###################################################

# Generators help you make lazy code
def double_numbers(iterable):
    for i in iterable:
        yield i + i


# You can also cast a generator comprehension directly to a list
values = (-x for x in [1,2,3,4,5])
gen_to_list = list(values)
print(gen_to_list) # => [-1, -2, -3, -4, -5]