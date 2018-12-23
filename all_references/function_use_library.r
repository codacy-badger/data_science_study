####
#Random
####

#use "random" data for box plot but fix seed
set.seed(1234)

#create "random" data sets [sd is standard deviation]
set_a <- rnorm(200, mean = 1, sd = 2)
set_b <- rnorm(200, mean = 0, sd = 1)
