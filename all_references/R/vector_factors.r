####
#Vectors and Factors
####

#combine function to make a vector (1-D Array)
ratings <- c(81, 125) #assign vector to variable
ratings <- c(ratings, 42, 96) #append
c(1:10) #sequential list
as.integer(c(1, 2, 3)) #integer vector as numeric is default

#factors and ordered factors
factor(c("a", "a", "b", "c", "d", "b", "d"))
factor(c("a", "a", "b", "c", "d", "b", "d"), ordered = TRUE,
       levels = c("c", "d", "a", "b"))

#names
ratings <- c(81, 125, 42, 96)
names(ratings) <- c("Sam", "Tom", "Curt", "Sally") #assign names to vector
ratings["Sam"] #recall vector value

#statistics
summary(c("a", "a", "b", "c", "d", "b", "d")) #char vector=lenth class and mode
summary(factor(c("a", "a", "b", "c", "d", "b", "d"))) #factor=list count of each
length(c("a", "a", "b", "c", "d", "b", "d"))
nchar(ratings) #2 3 2 2
sort(c("a", "a", "b", "c", "d", "b", "d"))
sort(ratings)
sort(ratings, decreasing = TRUE)
min(ratings)
max(ratings)
sum(ratings)
mean(ratings) #'avg'
summary(ratings) #on numbers gives min, 1q, med, 3q, max and avg(mean)
ratings <- c(ratings, 100, 92, 146, 78, 107, 122)
head(ratings) #first 6
tail(ratings) #last 6
head(ratings, n = 2) #first 2
head(ratings, 2) #same as above

#subset vectors
ratings[2] #return second
ratings[c(2, 4)]  #return 2nd and 4th
ratings[2:4] #return 2nd through 4th
ratings[-2] #return all but 2nd

#comparisons
c(81, 125, 42, 96) > 81 # FALSE TRUE FALSE TRUE
c(81, 125, 42, 96) >= 81 # TRUE TRUE FALSE TRUE
ratings[ratings > 85] #subset of those greater than 85
c(81, 125, 42, 96) == 42 # FALSE FALSE TRUE FALSE
c(81, 125, 42, 96) != 42 # TRUE TRUE FALSE TRUE

#vector math
c(1:5) * c(2, 1, 2, 1, 2) # 2 2 6 4 10
c(1:5) * 2                # 2 4 6 8 10

#NA
age_restric <- c(14, 12, 10, NA, 18, NA)
is.na(age_restric) #FALSE FALSE FALSE TRUE FALSE TRUE
!is.na(age_restric) #TRUE TRUE TRUE FALSE TRUE FALSE
