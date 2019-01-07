####
# Misc
####

# Exponentation (2^4)
print(2 ** 4)

# variables
height = 1.79  # meters
weight = 74.2  # kg

bmi = weight / (height ** 2)
print(bmi)

type(bmi)

round(1.68, 1)  # 1.7
round(1.68, 1)  # 2
help(round)

# comparison - Not has higher prio than and/or
x = 13
x > 5 and x < 18
x < 5 or x > 10
not(x < 5)

# loops
z = 6
if z % 2 == 0:
    print("checking " + str(z))
    print("z is even")
elif z % 3 == 0:  # never reached if also even
    print("z is divisible by 3")
else:
    print("z is odd")
