# Create dictionary
dict = {"key1": "value1", "key2": "value2", "key3": "value3", "key4": "value4"}

# Print dictionary keys
print(dict.keys())  # dict_keys(['key1', 'key2', 'key3', 'key4'])

# Print value of a key
print(dict["key1"])  # value1

# Verify value is in dictionary
"key1" in dict  # True
"key55" in dict  # False

# Add item
dict["key7"] = "value7"

# Remove item
del(dict["key4"])

# iteration - order is arbitrary
for key, value in dict.items():
    print(key + " -- " + value)
