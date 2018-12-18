genre_vector <- c("Comedy", "Animation", "Crime", "Comedy", "Animation")
genre_factor <- factor(genre_vector)
genre_factor
summary(genre_vector)
summary(genre_factor)
genre_ordered_factor <- factor(genre_vector, ordered = TRUE,
  levels = c("Comedy", "Animation", "Crime"))

genre_ordered_factor

year <- c(1985, 1999, 2010, 2002)
names(year) <- c("The BC", "AB", "BS", "C")

year["AB"]

#statistics
length(year)
sort(year)
min(year)
max(year)
sum(year)
mean(year)
summary(year)

#retrieve elements
year[2] #return second
year[c(2, 4)]  #return 2nd and 4th
year[2:4] #return 2nd through 4th
year[-2] #return all but 2nd

#comparisons
year > 2000
year[year > 2000]

#vector math
c(1:5) * c(2, 1, 2, 1, 2) # 2 2 6 4 10
c(1:5) * 2                # 2 4 6 8 10
