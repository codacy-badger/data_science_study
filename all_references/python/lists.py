####
# Lists
####

# Compound data type: Can contain different types
fam = [["liz", 1.73], ["emma", 1.68], ["mom", 1.71], ["dad", 1.89]]
names = [fam[0][0], fam[1][0], fam[2][0], fam[3][0]]
type(fam)

# Lists are zero index
fam[0]
fam[1][0]

# Negative values go from end
fam[-1]

# slicing First Inclusive : end Exclusive
parents = fam[2:4]
parents = fam[2:]
kids = fam[0:2]
kids = fam[:2]

# changing elements
fam[-1][1] = 1.86
fam[0:1] = [["lisa", 1.74]]

# adding pastes lists
fam = kids + parents
extended_fam = fam + [["gran", 1.59]]
del(extended_fam[4])
extended_fam.append(["gran", 1.59])

# Lists are stored by reference
# copy by reference
fam = extended_fam
# copy by value
fam = list(extended_fam)  # OR
fame = extended_fam[:]

# get index
names.index("mom")
names[names.index("mom")].capitalize().replace("m", "mmy")
