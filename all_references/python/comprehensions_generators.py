# over any iterable

# LISTS - Tuples and Matrix
nums = [12, 8, 21, 3, 16]
new_nums = [num + 1 for num in nums]

# funny, I did this before it came up in DataCamp!
squares = [num ** 2 for num in range(1, 10)]
# if in predicate
squares_e = [num ** 2 for num in range(1, 10) if num % 2 == 0]
squares_o = [num ** 2 for num in range(1, 10) if num % 2 != 0]
# if in output expression
squares_z = [num ** 2 if num % 2 == 0 else 0 for num in range(1, 10)]

pairs_tuples = [(num1, num2) for num1 in range(0, 2) for num2 in range(0, 2)]
pairs_matrix = [[num1, num2] for num1 in range(0, 2) for num2 in range(0, 2)]

matrix = [[col for col in range(5)] for row in range(5)]

# DICTIONARIES [dict comprehension]
# uses {}, k & v are seperated by :
pos_neg = {num: -num for num in range(9)}

# Generators
#    Does not store the resulting "list" in memory
#    If source is streaming, will include new information and read until all
#      data is read
test = 7
result = (num ** test for num in range(1, 10))
print(next(result))
print(list(result))


# generator functions
#    `yield`s a seq of values instead of `return`ing a value
def fib_seq(n):
    """Generates a fibonacci sequence of n length"""
    prev, current = 0, 1
    i = 0
    while i < n:
        yield current
        i += 1
        (prev, current) = (current, prev + current)


print(list(fib_seq(20)))
