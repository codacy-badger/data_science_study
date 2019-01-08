def square(value):  # function headers w/parameter
    """Return the square of a value"""  # doc string
    new_value = value ** 2  # function body
    return new_value


print(square(3))  # function call with argument

new_value = 10


def square():  # function headers w/parameter
    """Return the square of a value"""  # doc string
    new_value1 = new_value ** 2  # function body
    return new_value1


print(square())  # function call with argument
new_value = 20
print(square())  # function call with argument


def square():  # function headers w/parameter
    """Return the square of a value"""  # doc string
    global new_value
    new_value = 1
    new_value1 = new_value ** 2  # function body
    return new_value1


def raise_to_power(base, exp):  # function w/ multiple parameters
    """Return the value raised to a power"""
    new_value = base ** exp
    return new_value


print(raise_to_power(3, 3))  # function call with argument


def raise_both(value1, value2):  # function headers w/parameter
    """Returns a tuple containing value1 to the power of value2 and
    value2 to the power of value1"""
    new_value1 = value1 ** value2
    new_value2 = value2 ** value1
    new_tuple = (new_value1, new_value2)
    return new_tuple


print(raise_both(4, 5))  # function call with argument


# Define count_entries()
def count_entries(df, col_name):
    """Return a dictionary with counts of
    occurrences as value for each key."""
    # Initialize an empty dictionary: langs_count
    langs_count = {}
    # Extract column from DataFrame: col
    col = df[col_name]
    # Iterate over lang column in DataFrame
    for entry in col:

        # If the language is in langs_count, add 1
        if entry in langs_count.keys():
            langs_count[entry] = langs_count[entry] + 1
        # Else add the language to langs_count, set the value to 1
        else:
            langs_count[entry] = 1

    # Return the langs_count dictionary
    return langs_count
