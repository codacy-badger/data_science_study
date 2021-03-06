import pandas as pd
import numpy as np
# high level data manipulation tool

# dictionary method
dict = {"country": ["Brazil", "Russia", "India", "China", "South Africa"],
        "capital": ["Brasilia", "Moscow", "New Delhi", "Beijing", "Pretoria"],
        "area": [8.516, 17.10, 3.286, 9.567, 1.221],
        "population": [200.4, 143.5, 1252, 1357, 52.98]}

brics = pd.DataFrame(dict)
brics.index = ["BR", "RU", "IN", "CH", "SA"]

print(brics)
brics.head(2)  # default is 5

# import csv method
movies = pd.read_csv("testfiles/movies-db.csv")
movies = pd.read_csv("testfiles/movies-db.csv", index_col=0)

# by chunk
result = []
for chunk in pd.read_csv("testfiles/movies-db.csv", chunksize=12):
    result.append(sum(chunk["length_min"]))
print(sum(result))

# OR
df_reader = pd.read_csv("testfiles/movies-db.csv", chunksize=4)
print(next(df_reader))
print(next(df_reader))

# OR
df_reader = pd.read_csv("testfiles/movies-db.csv", chunksize=4)
data = pd.DataFrame()
for df_movies in df_reader:
    df_movies_comedy = df_movies[df_movies["genre"] == "Comedy"]
    data = data.append(df_movies_comedy)
print(data)

####
# Selecting
####

# square brackets - col by name, row by slice only
brics["country"]  # returns pandas...Series - 1D labelled array
brics[["country"]]  # returns pandas...DataFrame
brics[["country", "capital"]]  # returns pandas...DataFrame
brics[1:4]  # row by slice
# loc - label based - col or row by names
brics.loc["RU"]  # returns pandas...Series - 1D labelled array
brics.loc[["RU"]]  # returns pandas...DataFrame
brics.loc[["RU", "IN", "CH"]]  # returns pandas...DataFrame
brics.loc[["RU", "IN", "CH"], ["country", "capital"]]  # pandas...DataFrame
brics.loc[:, ["country", "capital"]]  # pandas...DataFrame
# iloc - position based
brics.iloc[1]
brics.iloc[[1]]
brics.iloc[[1, 2, 3]]  # all columns
brics.iloc[[1, 2, 3], [0, 1]]  # first two columns
brics.iloc[:, [0, 1]]  # first two columns

# comparison - need panda series
#   step 1 - get column as **series** - brics["area"]
#   step 2 - compare              - brics["area"] > 8
#   step 3 - get result columns
brics[brics["area"] > 8]
brics[np.logical_and(brics["area"] > 8, brics["area"] < 10)]

# iteration
#   rows
for lab, row in brics.iterrows():
    print(lab)  # label
    print(row)  # row as panda series
for lab, row in brics.iterrows():
    print(lab + ": " + row["capital"])
for lab, row in brics.iterrows():  # bad(@ big) - creates series on every iter
    brics.loc[lab, "name_length"] = len(row["country"])
brics["name_length"] = brics["country"].apply(len)  # better
# get the country column, apply the length function with country name as
#    input and store into name_length

#          country    capital    area  population
# BR        Brazil   Brasilia   8.516      200.40
# RU        Russia     Moscow  17.100      143.50
# IN         India  New Delhi   3.286     1252.00
# CH         China    Beijing   9.567     1357.00
# SA  South Africa   Pretoria   1.221       52.98
