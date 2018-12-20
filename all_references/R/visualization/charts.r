# install.packages("ggplot2") run on CLI
library(ggplot2)

####
#Barcharts
####

barplot(table(mtcars$cyl))

qplot (mtcars$cyl,
  geom = "bar",
  fill = I("black"),
  color = I("red"), #if no color, the value of fill will be used
  xlab = "Cylinders",
  ylab = "Number of Vehicles",
  main = "Cyclinders in mtcars")

####
#Histograms
####

qplot (mtcars$hp,
  geom = "histogram",
  binwidth = 25,
  xlim = c(50, 350),
  color = I("black"),
  alpha = I(0),
  xlab = "Horsepower",
  ylab = "Number of Vehicles",
  main = "Horsepower Histogram")

# ggplot(data = mtcars, aes(mtcars$hp))  +
#   geom_histogram(breaks = seq(40, 350, by = 25),
#     colour = I("black"),
#     aes(fill = ..count..))

####
#Piechart
####

ggplot(mtcars, aes(x = 1, y = sort(mtcars$carb), fill = sort(mtcars$carb))) +
  #geom_bars helps to stack bars
  geom_bar(stat = "identity") +
  #shift into circle, theta keeps axis from warping
  coord_polar(theta = "y") +
  labs(y = "Carburetors") +
  theme(
    axis.line = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.y = element_blank(),
    panel.background = element_blank())
