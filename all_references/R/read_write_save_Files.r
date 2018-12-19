####
#Reading
####

#CSV
mycsv <- read.csv("testfiles/movies-db.csv")

#EXCEL
# install[dot]packages("readxl") run on CLI
library(readxl) #load library
myxls <- read_excel("testfiles/movies-db.xls") #read file

#Text
lines <- readLines("testfiles/movie-text.txt")
words <- scan("testfiles/movie-text.txt", "")
length(lines) #number of lines in file
nchar(lines) #num of chars per line
file.size("testfiles/movie-text.txt") #file size in bytes

#RData - R object file
if (exists("movie_list")) rm(movie_list)
load(file = "output/varlist.RData") #load movie_list object

#R Data Structures
if (exists("movie_df")) rm(movie_df)
movie_df <- readRDS("output/df_as_rda.Rda")

#Loading all data structures in current R workspace
load("output/all_data_structures.Rds")

####
#Writing
####

mymatrix <- matrix(c(1, 2, 3, 4, 5, 6), 2, 3)
#write to text file with spaces as seperator
write(mymatrix, file = "output/matrix_as_text.txt", ncolumns = 3, sep = " ")

#write to csv with header and without row numbering
write.csv(mycsv, file = "output/datafile_as_csv.csv", row.names = FALSE)

#write to csv without header and without row numbering
write.table(mycsv, file = "output/datafile_as_csv.csv", row.names = FALSE,
  col.names = FALSE, sep = ",")

#write to excel
# install[dot]packages("xlsx") run on CLI
library(xlsx)
write.xlsx(mycsv, file = "output/datafile_as_xlsx.xlsx", sheetName = "Sheet1",
  col.names = TRUE, row.names = FALSE)

#write and load R objects
movie_list <- list("Toy Story", 1995, c("Animation", "Adventure", "Comedy"))
save(movie_list, file = "output/list_as_rdata.RData") #save movie_list to file

#R Data Structures
movie_df <- data.frame(name = c("Toy Story", "Akira", "The Breakfast Club",
                              "The Artist", "Modern Times", "Fight Club",
                              "City of God", "The Untouchables"),
                     year = c(1995, 1998, 1985, 2011, 1936, 1999, 2002, 1987),
                     stringsAsFactors = FALSE)
saveRDS(movie_df, file = "output/df_as_rda.Rda")

#Saving all data structures in current R workspace
save.image("output/all_data_structures.Rds")
