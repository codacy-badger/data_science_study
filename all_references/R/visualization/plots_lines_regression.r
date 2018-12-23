#can be assigned to variables and displayed later with #print

####
#Scatter Plot
####

if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
  install.packages("ggplot2")
}
library(ggplot2)

qplot (
  mpg,
  wt,
  data = mtcars,
  xlab = "Miles per Gallon",
  ylab = "Weight",
  main = "Weight vs MPG"
)

ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point(shape = 1, color = "blue") #19 solid circles, 1 open circles

ggplot(mtcars, aes(x = mpg, y = wt, color = factor(mtcars$cyl),
  shape = factor(mtcars$cyl))) +
  geom_point() +
  labs(x = "Miles per Gallon", y = "Weight") +
  labs(color = "Cylinders", shape = "Cylinders") +
  ggtitle("Scatterplot")

####
#Line Plot
####

if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
  install.packages("ggplot2")
}
library(ggplot2)

eustock_df <- as.data.frame(EuStockMarkets)

ggplot(eustock_df, aes(x = c(1:nrow(eustock_df)), y = DAX)) +
  geom_line(size = 0.5, color = "blue") +
  labs(x = "Time", y = "Stocks")

ggplot() +
  geom_line(data = eustock_df, aes(x = c(1:nrow(eustock_df)), y = DAX),
    size = 0.5, color = "blue") +
  geom_line(data = eustock_df, aes(x = c(1:nrow(eustock_df)), y = SMI),
    size = 0.5, color = "red") +
  geom_line(data = eustock_df, aes(x = c(1:nrow(eustock_df)), y = CAC),
    size = 0.5, color = "purple") +
  geom_line(data = eustock_df, aes(x = c(1:nrow(eustock_df)), y = FTSE),
    size = 0.5, color = "green") +
  labs(x = "Days", y = "Price") +
  ggtitle("EU Stocks")

####
#Linear Regression
####

if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
  install.packages("ggplot2")
}
library(ggplot2)

ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point(shape = 19, color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") + #method: linear method
  ggtitle("Linear Regression")

ggplot(mtcars, aes(x = mpg, y = wt, color = factor(mtcars$cyl))) +
  geom_point(shape = 19) +
  geom_smooth(method = "lm", se = TRUE, color = "red") + #se:confidence interval
  labs(x = "Miles per Gallon", y = "Weight") +
  ggtitle("Linear Regression with confidence intervals")

ggplot(mtcars, aes(x = mpg, y = wt, color = factor(mtcars$cyl))) +
  geom_point(shape = 19) +
  geom_smooth(method = "auto", se = TRUE, color = "red") + #method: gaussian
  labs(x = "Miles per Gallon", y = "Weight") +
  ggtitle("Gaussian Regression with confidence intervals")

####
#Box Plot
####

if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
  install.packages("ggplot2")
}
library(ggplot2)

qplot(factor(cyl), mpg, data = mtcars, geom = "boxplot")

ggplot(mtcars, aes(factor(cyl), mpg)) + geom_boxplot()
