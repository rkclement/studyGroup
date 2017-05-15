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
# iris, [https://en.wikipedia.org/wiki/Iris_flower_data_set], and one called 
# diamonds [http://ggplot2.tidyverse.org/reference/diamonds.html]. Let's take a 
# look at iris first. 

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

# This isn't a problem with ggplot, where the graph is an "object" that can be 
# changed and manipulated. Let's make our first ggplot graph.

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() + 
  geom_point(aes(x = Petal.Length, y = Petal.Width), col = "red")

# As you can see, our graph size changes. Still no legend though! But that's 
# because, even though the method above makes a graph, it's NOT THE RIGHT WAY
# TO DO IT. First we need to talk about the Grammar of Graphics, and tidy data.

# The Grammar of Graphics talks about 7 layers visualizations use: (1) Data, 
# (2) Aesthetic Mappings, (3) Geometric Objects, (4) Scales, (5) Faceting, 
# (6) Statistical Transformations, and (7) Coordinate Systems. For any ggplot 
# visualization, you MUST specify the first 3 of these. If you don't specify
# the others, ggplot will take care of them for you with defaults. 

# Start with the data, and aesthetic mappings.

g <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species))

# Add a geometric object

g + geom_point()

# Add facets, if you want

g + geom_point() + facet_wrap(~Species)

# Add a statistical transformation

g + geom_point() + facet_wrap(~Species) + stat_smooth(method = lm)

# And so on. So how do we make the graph from above of Sepal and Petal Length
# vs Sepal and Petal Width properly?

# If you look again at the head(iris), you'll see that the data has 4 columns 
# which actually contain three values each. For example, Sepal Length stores
# not only the value (the length), but also the fact that the measurement is
# length, and the flower part is the sepal. Transforming the data into tidy
# data, with one variable per column, as below, can give us access to ALL of 
# our data in order to make the plots we're trying to make. Transforming iris 
# into a different form of wide data, also as below, can also give us access to 
# plot something other than we originally could.

#############################
#### CLEANING IRIS DATA #####
#############################

# Making iris_tidy by using tidyr functions gather() and separate(). Gathers
# all non-categorial headers into one column, key, and then associates them 
# with their previous values, which it puts into the Value column. You can just
# run this code.

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

head(iris_tidy)
head(iris_wide)

# Now we can use these differently formatted versions of the iris data to make 
# better graphs using ggplot. This highlights two things: first, ggplot tries
# to be very unrestrictive in what you are allowed to do with it - if it uses 
# the correct syntax, ggplot will execute it and make something. Also, data 
# manipulation is very necessary when working with data visualization. 
# Sometimes you need to manipulate your data in order to make the visualization 
# you have in mind.


# Plot length vs width, colored by part (sepal or petal) using iris_wide.


# Plot length vs width, colored by part (sepal or petal) using iris_wide, but 
# this time make a separate graph for each species


# Use iris_tidy to make a point graph of the measurements of each different part 
# colored by whether they are length or width, and faceted by species. Then make
# the same graph as boxplots.



#####################################
# More ggplot functionality and fun #
#####################################

str(diamonds)
head(diamonds)

# Geometries (such as a bar) that rely on statistical transformations (e.g. a 
# "count") of occurences as a below, can be substituted with the same stat 
# transformation.


# You can also use "identity" as a stat transformation if the "count" is present
# in your data itself.

cut_freq <- count(diamonds, cut)
cut_freq


# Different positions for bars in charts


# Different coordinate systems


# Plotting lines fitted to the data


################################################################################
# To learn more about using ggplot2 and the rest of the tidyverse packages,    #
# see Hadley Wickham & Garrett Grolemund's book (available online) _R for Data #
# Science_ (http://r4ds.had.co.nz/). For a more in-depth look just at ggplot2, #
# see the book by Wickham, _ggplot2: elegant graphics for data analysis_       #
# (http://amzn.com/0387981403?tag=ggplot2-20, also available as an ebook for   #
# Midd affiliates.                                                             #
#                                                                              #
# ggplot2 cheat sheet available at:                                            #
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf    # 
################################################################################