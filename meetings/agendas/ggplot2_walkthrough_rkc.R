# This script was used during an introductory workshop for ggplot2 in Spring 
# 2017 as part of the Middlebury Data Study Group. For more information on the 
# group, visit our website at http://go.middlebury.edu/studygroup. This workshop
# was created and run by Ryan Clement, Data Services Librarian. 

# Install and load necessary packages for the workshop. 
install.packages("tidyverse")
library(tidyverse)

##############################################################
# Super Quick Intro to R functionality for complete newbies. #
##############################################################

# See your working directory
getwd()

# Set your working directory
setwd("~/experiements/studyGroup/meetings/agendas")
getwd()

# Use R as a calculator
2 + 2
2 * 2
2.0/2.1
2^2*((3/4) + 6)
3%%2

# Assign a value to a variable
x <- 3
x**2
x
y <- x**2
x + y

# Scalars, vectors, and matrices. You've seen scalars above, such as x <- 3. 
# Vectors are assigend the same way, use the concatenate function c():
x <- c(3, 4, 6, 7, 2)
x

# You can still use arithmetic, etc. on vectors
x <- c(3, 4, 6, 7, 2)
x * 3

# Matrices are two-dimensional vectors.
x <- matrix(c(3, 4, 6, 7, 2, 1), ncol = 2)
x

# Data frames are matrices with names for rows/columns.
x <- matrix(c(3, 4, 6, 7, 2, 1), ncol = 2)
as.data.frame(x)

# Again, you can still use arithmetic, etc. on matrices and data frames
x <- matrix(c(3, 4, 6, 7, 2, 1), ncol = 2)
x*3
as.data.frame(x) * 3

# This has just been the briefest intro to R - there are many great resources 
# for learning the basics, such as ...

# R has many packages for many different types of statistical and visual 
# analysis. We're going to look at one of the most popular and powerful packages
# for visualization, ggplot2. First, let's take a look at the base R 
# visualization tools. We're going to use two datasets from R today, one called 
# iris, [CITATION], and one called diamonds [CITATION]. Let's take a look at 
# iris first. 

str(iris)
head(iris)

# We can use base R plot() function to make a simple scatterplot.

plot(iris$Sepal.Length, iris$Petal.Length)

# We can add colors based on the species variable, size the points based on 
# a formula, and change the symbology.

plot(iris$Sepal.Length, iris$Petal.Length, 
     col = iris$Species, 
     pch = 19,
     cex = iris$Sepal.Width/median(iris$Sepal.Width))

# However, we're missing a legend! In base R plotting, you need to add legends 
# and proper labels yourself.

plot(iris$Sepal.Length, iris$Petal.Length, 
     col = iris$Species, 
     pch = 19,
     xlab = "Sepal Length",
     ylab = "Petal Length", 
     main = "Iris Species Sepal Length vs Petal Length")
legend(7.5, 2.5, 
       c("Setosa", "Virginica", "Versicolor"), 
       pch = 19, 
       col = c("black", "red", "green"))

# You can also add other annotations like median lines to a basic plot.

abline(v = median(iris$Sepal.Length), h = median(iris$Petal.Length) )
text(4.5, median(iris$Petal.Length) + 0.15, 
     paste("Median Petal Length =", median(iris$Petal.Length)),
     cex = 0.7)
text(median(iris$Sepal.Length) + 0.35, 2.5, 
     paste("Median Sepal Length =", median(iris$Sepal.Length)),
     cex = 0.7)


# BUT THERE IS AN EASIER WAY! Using the ggplot2 package, part of the 
# "tidyverse," we can more easily make graphs that look great. ggplot2 handles
# a lot of the decisions, such as making labels, for you! It also makes objects, 
# not static plots, so we can manipulate them rather than just building them up 
# by drawing over the already made plots.

# For example, in base plot, if we go back to our basic scatterplot:

plot(iris$Sepal.Length, iris$Sepal.Width)

# and then decide we want to add the width data as well, we can do that like 
# this:

plot(iris$Sepal.Length, iris$Sepal.Width, pch = 19)
points(iris$Petal.Length, iris$Petal.Width, pch = 19, col = "red")

# What's wrong with this? The new points (the red ones) were simply added onto 
# the existing plot. So, in addition to having no legend, our plot is cut off at 
# the bottom.


#############################
#### CLEANING IRIS DATA #####
#############################

# Making iris_tidy by using tidyr functions gather() and separate(). Gathers all
# non-categorial headers into one column, key, and then associates them with 
# their previous values, which it puts into the Value column. You can just run 
# this code.

iris_tidy <- iris %>%
  gather(key, Value, - Species) %>%
  separate(key, c("Part", "Measure"), "\\.") 

# Making iris_wide uses the same tidyr functions as above, plus the function 
# spread(). First, so that we can keep track of which measures belong to which 
# flower, we need to add a unique identifier in a column called Flower.

iris$Flower <- 1:nrow(iris)

iris_wide <- iris %>%
  gather(key, value, -Species, -Flower) %>%
  separate(key, c("Part", "Measure"), "\\.") %>%
  spread(Measure, value)