# read a csv file - use getwd() to find out what root working directory is
movies_data <- read.csv("cognitiveclass/1_r101/mod3/movies-db.csv",
  header = TRUE, sep = ",")

movie_year <- 2002

# If Movie_Year is greater than 2000...
if (movie_year > 2000){

    # ...we print a message saying that it is greater than 2000.
    print("Movie year is greater than 2000")

}

movie_year <- 2010

# If Movie_Year is greater than 2000...
if (movie_year > 2000){
    print("Movie year is greater than 2000")
} else {
    print("Movie year is not greater than 2000")
}

# Get the data for the "year" column in the data frame.
years <- movies_data["year"]

# For each value in the "years" variable...
# Note that "val" here is a variable -- it assumes the value of one of the data points in "years"!
for (val in years) {
    # ...print the year stored in "val".
    print(val)
}
