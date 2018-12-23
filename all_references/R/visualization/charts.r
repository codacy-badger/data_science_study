#can be assigned to variables and displayed later with #print

####
#Barcharts
####

if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
  install.packages("ggplot2")
}
library(ggplot2)

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

if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
  install.packages("ggplot2")
}
library(ggplot2)

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

if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
  install.packages("ggplot2")
}
library(ggplot2)

ggplot(mtcars, aes(x = 1, y = sort(mtcars$carb), fill = sort(mtcars$carb))) +
  #geom_bars helps to stack bars
  geom_bar(stat = "identity") +
  #shift into circle, theta keeps axis from warping
  coord_polar(theta = "y") +
  labs(y = "", fill = "Carburetors") +
  ggtitle("Pie Chart") +
  theme(
    axis.line = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.y = element_blank(),
    panel.background = element_blank())

ggplot(mtcars, aes(x = 1, y = factor(mtcars$cyl), fill = factor(mtcars$cyl))) +
  #geom_bars helps to stack bars
  geom_bar(stat = "identity") +
  #shift into circle, theta keeps axis from warping
  coord_polar(theta = "y") +
  labs(y = "", fill = "Carburetors") +
  ggtitle("Pie Chart") +
  theme(
    axis.line = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.y = element_blank(),
    panel.background = element_blank())

####
#Radar Charts
####

if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
  install.packages("ggplot2")
}
library(ggplot2)
if ("ggradar" %in% rownames(installed.packages()) == FALSE) {
  print("install from R command line https://github.com/ricardo-bion/ggradar")
}
library(ggradar)
if ("dplyr" %in% rownames(installed.packages()) == FALSE) {
  install.packages("dplyr") #to pipe commands   %>%
}
library(dplyr)
if ("scales" %in% rownames(installed.packages()) == FALSE) {
  install.packages("scales") #to label axis and legends
}
library(scales)

#select dataset
mtcars %>%
  #attribute rownames to a variable
  add_rownames(var <- "group") %>%
  #assign each variable to their related variables
  mutate_each(funs(rescale), -group) %>%
  #select data to plot
  head(3) %>% select(1:10) -> mtcars_radar

# options paren warn = -1 paren
ggradar(mtcars_radar)

####
#Waffle Charts
####

if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
  install.packages("ggplot2")
}
library(ggplot2)
if ("waffle" %in% rownames(installed.packages()) == FALSE) {
  install.packages("waffle")
}
library(waffle)

#create vector with data
expenses <- c("Health ($43,212)" = 43212, "Education ($113,412)" = 113412,
  "Transportation ($20,231)" = 20231, "Entertainment ($28,145)" = 28145)

waffle(expenses / 1235, rows = 5, size = 0.3, colors = c("#c7d4b6", "#a3aabd",
  "#a0d0de", "#97b5cf"), title = "Imaginary Household Expenses Each Year",
  xlab = "1 square = $934")
