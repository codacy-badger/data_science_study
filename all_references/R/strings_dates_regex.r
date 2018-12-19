####
#Strings
#

library(stringr) #needed for str_sub

lines <- readLines("movie-text.txt")

#character manipulation
toupper(lines[1]) #uppercase
tolower(lines[1]) #lower
chartr(" ", "-", lines[1]) #replaces T with B

#get words
words <- strsplit(lines[1], " ") #returns a `list`
words <- unlist(words) #converts `list` to `char vector`
words <- unlist(strsplit(lines[1], " ")) #same but all in one
paste(sort(words), collapse = " ") #pastes back into a single string

#get parts of string
substr(lines[1], start = 2, stop = 10) #subset by character
trimws(substr(lines[1], start = 2, stop = 10)) #trim whitespace
str_sub(lines[1], -9, -2) #9th from last to 2nd to last

####
#Dates
####

date1 <- 18000; #NUMERIC 5 hours, in EST gives 1970-01-01
date1 <- as.POSIXct(date1, origin = "1970-01-01") #class is POSIXcs
date1 <- as.Date(date1) #class is Date

date2 <- "2018-09-02" #date is character
date2 <- as.Date(date2, "%Y-%m-%d") #date is Date

date2 - date1
date2 + (365 / 2)
date2 > date1

Sys.Date() #today's date as Date
date() #now as char
Sys.time() #now as POSIXct

weekdays(date2)
months(date2)
quarters(date2)

julian(date2)

# Example Monday January 7th, 2019
# %a Mon
# %A Monday
# %b Jan
# %B January
# %d 07
# %m 01
# %y 19
# %Y 2019

####
#Regular Expression
####
names <- c("John Doe", "Jane Doe", "Mark Mann", "Sally Seashell")
emails <- c("doej@example.com", "jadoe@sample.ca", "mmann@example.ca", "none")

contacts <- data.frame(Name = names, Email = emails, stringsAsFactors = FALSE)
contacts

grep("@.*\\.",  emails)
grep("@.*\\.",  emails, value = TRUE)
gsub("@.*", "@newdomain.com", emails)

contacts <- contacts[-4, ] #only works if number of rows match
matches <- regexpr("@.*\\.", contacts[, "Email"])
contacts[, "Domain"] <- regmatches(contacts[, "Email"], matches)

#frequency table of domains
table(contacts[, "Domain"])
