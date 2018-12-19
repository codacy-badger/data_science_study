####
#Arrays
####

#Making an array
movie_vector <- c("Akira", "Toy Story", "Room", "The Wave", "Whiplash",
                  "Star Wars", "The Ring", "The Artist", "Jumanji")
movie_array <- array(movie_vector, dim = c(4, 3))
movie_array

#Retrive array values
movie_array[1, 2] #value first row second column
movie_array[1, ] #entire first row
movie_array[, 2] #entire second column

#statistics
dim(movie_array) #returns number of rows and then columns

#array math
movie_length_arr <- array(c(125, 81, 118, 81, 106, 121, 95, 100, 104),
                      dim = c(3, 3))
names(movie_length_arr) <- movie_vector #assign names to length
movie_length_arr + 5 # add 5 without changing values

#conditionals
movie_length_arr > 120 #show table of T/F
array(movie_vector, dim = c(3, 3))[movie_length_arr > 120] #use cond for subset

####
#Matrices
####

#Making a matrix
movie_matrix <- matrix(movie_vector, nrow = 3, ncol = 3) #assign to col first
movie_matrix <- matrix(movie_vector, nrow = 3, ncol = 3, byrow = TRUE)

#get values
movie_matrix[1, 2] #row 1 column 2
movie_matrix[2:3, 1:2] #row 2 thru 3 column 1 through 2

#statistics
class(movie_matrix) #matrix
mode(movie_matrix) #character

#convert a vector to a matrix
avg_rate <- c(8.3, 8.1, 7.9, 8)
avg_cost <- c(30, 10.4, 1, 15)
sb_matrix <- c(avg_rate, avg_cost) #has all listed consecutively
attr(sb_matrix, "dim") <- c(4, 2) # add dimension attribute to make matrix

####
#Lists
####

#Making lists
movie <- list("Toy Story", 1995, c("Animation", "Adventure", "Comedy"))
movie <- list(name = "Toy Story", year = 1995,
              genre = c("Animation", "Adventure", "Comedy"))

#get values
movie[2] #display second value
movie[2:3] #display 2nd through 3rd
movie$name #prints name
movie["name"] #prints name

#appending and updating and removing from lists
movie["age"] <- 5 #adds age and sets it to 5
movie["age"] <- 6 #rewrites age to be 6
movie["age"] <- NULL #removes age from the list
movie

#statistics
class(movie$name) #return type if exists
class(movie$foreign) #return NULL if doesn't exists
class(movie) #list
mode(movie) #list
mode(movie[[1]]) #character (e.g. name "Toy Story")
mode(movie[[2]]) #numeric (e.g. year 1995)

####
#Dataframes
####

#Making dataframes
movies <- data.frame(name = c("Toy Story", "Akira", "The Breakfast Club",
                              "The Artist", "Modern Times", "Fight Club",
                              "City of God", "The Untouchables"),
                     year = c(1995, 1998, 1985, 2011, 1936, 1999, 2002, 1987),
                     stringsAsFactors = FALSE)
movies$name #the names as a vector
movies[1] #table of the first column
movies[1, 2] #row one col 2

#dataframe statistics
str(movies) #structure of the dataframe
head(movies)
tail(movies)

# add column
movies["length"] <- c(81, 125, 97, 100, 87, 139, 130, 119)

#get only some columns
movies[1, c("name", "length")]

# add row
movies <- rbind(movies, c(name = "Dr Strangelove", year = 1964, length = 94))

# delete row
movies <- movies[-9, ]

#delete a column
movies["length"] <- NULL

movies

####
#Built in datasets
####

data() #may have to use in the CLI, might not work in an IDE
help(CO2) #same as above
CO2 #list all data in dataset
