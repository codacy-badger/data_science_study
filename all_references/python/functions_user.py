import pandas as pd
####
# basic function
####


def square(value):  # function headers w/parameter
    """Return the square of a value"""  # doc string
    new_value = value ** 2  # function body
    return new_value


print(square(3))  # function call with argument

####
# global scope
####
new_value = 10


def square():  # function headers w/parameter
    """Return the square of a value"""  # doc string
    new_value1 = new_value ** 2  # function body
    return new_value1


print(square())  # function call with argument
new_value = 20
print(square())  # function call with argument

####
# global scope - accessing from function
####


def square():  # function headers w/parameter
    """Return the square of a value"""  # doc string
    global new_value
    new_value = 1
    new_value1 = new_value ** 2  # function body
    return new_value1


print(square())  # function call with argument
new_value = 20
print(square())  # function call with argument

####
# Multi parameters
####


def raise_to_power(base, exp):  # function w/ multiple parameters
    """Return the value raised to a power"""
    new_value = base ** exp
    return new_value


print(raise_to_power(3, 3))  # function call with argument

####
# return multiple values
####


def raise_both(value1, value2):  # function headers w/parameter
    """Returns a tuple containing value1 to the power of value2 and
    value2 to the power of value1"""
    new_value1 = value1 ** value2
    new_value2 = value2 ** value1
    new_tuple = (new_value1, new_value2)
    return new_tuple


print(raise_both(4, 5))  # function call with argument

####
# Default arguement
####


def raise_to_power(base, exp=1):
    """Return the value raised to a power"""
    new_value = base ** exp
    return new_value


print(raise_to_power(3, 3))  # set power
print(raise_to_power(3))  # use default power

####
# flexible arguement number - SINGLE STAR
####


def add_all(*args):
    """Sum all values in *args"""
    sum_all = 0
    for value in args:
        sum_all += value

    return sum_all


add_all(1)
add_all(1, 2)
add_all(1, 2, 3)

####
# flexible arguement keys - DOUBLE STAR
####


def print_all(**kwargs):
    """Prints all key and value pairs in *kwargs"""
    for k, v in kwargs.items():
        print(k + ": " + v)


print_all(name="Hugo Browne-Anderson", employer="DataCamp")

####
# lambda - should only be used anonymously
####

# raise_to_power2 = lambda x, y: x ** y
# raise_to_power2(2, 3)

nums = [48, 6, 9, 21, 1]
square_all = map(lambda num: num ** 2, nums)
print(list(square_all))

####
# count entries in general dataframe of a general column
####


def count_entries(df, col_name):  # based on code from DataCamp exercise
    """Return dictionary with each unique item in the column and number of
    appearences of each value as key value pairs respectively."""
    item_count = {}  # dict to store counts
    for entry in df[col_name]:
        if entry in item_count.keys():  # if found, add one to key
            item_count[entry] = item_count[entry] + 1
        else:  # if not found, add entry and set key to 1
            item_count[entry] = 1
    return item_count


####
# count entries in general dataframe of an aritrary list of  general columns
####


def count_entries_variable_catch(df, *col_names):  # based on DataCamp code
    """Return dictionary with each unique item in the column and number of
    appearences of each value as key value pairs respectively."""
    item_count = {}  # dict to store counts
    try:
        for col_name in col_names:
            for entry in df[col_name]:
                if entry in item_count.keys():  # if found, add one to key
                    item_count[entry] = item_count[entry] + 1
                else:  # if not found, add entry and set key to 1
                    item_count[entry] = 1
        return item_count
    except KeyError:
        print('The DataFrame does not have a ' + col_name + ' column.')


####
# count entries in general dataframe of an aritrary list of  general columns
####


def count_entries_variable_raise(df, *col_names):  # based on DataCamp code
    """Return dictionary with each unique item in the column and number of
    appearences of each value as key value pairs respectively."""
    item_count = {}  # dict to store counts
    for col_name in col_names:
        if col_name not in df.columns:
            raise ValueError('The DataFrame does not have a '
                             + col_name + ' column.')
        for entry in df[col_name]:
            if entry in item_count.keys():  # if found, add one to key
                item_count[entry] = item_count[entry] + 1
            else:  # if not found, add entry and set key to 1
                item_count[entry] = 1
    return item_count


####
# count entries in general dataframe of an aritrary list of  general columns
# based on DataCamp code
####
# import pandas as pd


def count_entries_variable_cvs(csv_file, c_size, *col_names):
    """Return dictionary with each unique item in the column and number of
    appearences of each value as key value pairs respectively."""
    item_count = {}  # dict to store counts
    for chunk in pd.read_csv(csv_file, chunksize=12):
        for col_name in col_names:
            if col_name not in df.columns:
                raise ValueError('The DataFrame does not have a '
                                 + col_name + ' column.')
            for entry in df[col_name]:
                if entry in item_count.keys():  # if found, add one to key
                    item_count[entry] = item_count[entry] + 1
                else:  # if not found, add entry and set key to 1
                    item_count[entry] = 1
    return item_count

count_entries_variable_cvs("test_files/movies-db.csv", 12, "genre")
