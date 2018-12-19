####
#Reading
####

#CSV
mycsv <- read.csv("movies-db.csv")

#EXCEL
# install[dot]packages("readxl") run on CLI
library(readxl) #load library
myxls <- read_excel("movies-db.xls") #read file

#Text
lines <- readLines("movie-text.txt")
words <- scan("movie-text.txt", "")
length(lines) #number of lines in file
nchar(lines) #num of chars per line
file.size("movie-text.txt") #file size in bytes

#RData - R object file
if (exists("movie")) rm(movie)
load(file = "output/varlist.RData") #load movie object

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
movie <- list("Toy Story", 1995, c("Animation", "Adventure", "Comedy"))
save(movie, file = "output/varlist.RData") #save movie to file
rm(movie) #remove movie
load(file = "output/varlist.RData") #load movie back
movie
