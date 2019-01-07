import pandas as pd
# high level data manipulation tool

# dictionary method
dict = {"country": ["Brazil", "Russia", "India", "China", "South Africa"],
        "capital": ["Brasilia", "Moscow", "New Delhi", "Beijing", "Pretoria"],
        "area": [8.516, 17.10, 3.286, 9.567, 1.221],
        "population": [200.4, 143.5, 1252, 1357, 52.98]}

brics = pd.DataFrame(dict)
brics.index = ["BR", "RU", "IN", "CH", "SA"]

print(brics)

# import csv method
movies = pd.read_csv("testfiles/movies-db.csv")
movies = pd.read_csv("testfiles/movies-db.csv", index_col=0)

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
