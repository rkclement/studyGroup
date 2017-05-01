# Excerpt From: Taylor Arnold and Lauren Tilton, _Humanities Data in R_ 
# Chapter 4 Supplemental Questions

# 51. Produce a scatter plot of sepal length versus petal length in the iris 
# dataset.

plot(iris$Sepal.Length, iris$Petal.Width)

# 52. Add color to the scatter plot of sepal length versus petal length to 
# distinguish the three iris species. Use solid dots to highlight the colors.

species<-unique(iris$Species)
colVals<-c("purple","blue","red")
colors<-colVals[match(iris$Species,species)]
plot(iris$Sepal.Length, iris$Petal.Width,col=colors,pch=19)

# 53. Using the previous plot as a starting point, change the size of the points 
# based on the sepal width. Hint: A good way to get nice sizes is to divide the 
# sepal width by the median width.

plot(iris$Sepal.Length, iris$Petal.Width,col=colors,pch=19, 
     cex=(iris$Sepal.Width/median(iris$Sepal.Width)))

# 54. Change the plot to use the text of the species type instead of dots. You 
# can remove the sizing based on sepal width so that all of the text is of the 
# same size; however, it may help to make all the text points smaller than the 
# default to reduce overplotting.

plot(iris$Sepal.Length, iris$Petal.Width,col=colors,pch=19)
text(iris$Sepal.Length,iris$Petal.Width+0.1,labels=iris$Species,cex=.5)

# 55. Add a vertical and horizontal median to the scatter plot of sepal length 
# versus petal length.

plot(iris$Sepal.Length, iris$Petal.Width,col=colors,pch=19)
abline(v=median(iris$Sepal.Length))
abline(h=median(iris$Petal.Width))

# 56. Add by group vertical and horizontal medians to the scatter plot of sepal
# length versus petal length. There should be three vertical and three 
# horizontal lines. Color the lines and points based on species, and make the 
# lines dashed rather than solid.

plot(iris$Sepal.Length, iris$Petal.Width,col=colors,pch=19)
plotLineV<-tapply(iris$Sepal.Length,iris$Species,median)
abline(v=plotLineV,col=colVals, lty="dashed")
plotLineH<-tapply(iris$Petal.Width,iris$Species,median)
abline(h=plotLineH,col=colVals, lty="dashed")


# 57. Reconstruct the scatter plot of sepal length versus petal length with 
# species colors. Add text to show the medians of the three groups. Test out 
# different sizes for the points and text to make nice looking plot.



# 58. Construct a plot of petal length versus sepal width. The plot has two 
# large clusters of points (in the upper left and lower right) and one outlier 
# in the bottom left. Construct a coloring for these three groups. Produce a 
# side by side plot showing petal length versus sepal width next to sepal length 
# versus petal length. Use the new color scheme for both.



# 59. Create a scatter plot matrix (pairs plot) from the four numerical 
# variables in the iris dataset. You should reduce the margins to fit the entire 
# plot on the screen but do not need to directly replicate all of the tweaks 
# from Sect. 4.6.



# 60. Change the custom scatter plot matrix to have a histogram on the diagonal
# axis.



# 61. Take the InsectRepelant dataset and produce a single line plot of the
# data. It will be easiest going forward to do this by (1) plotting the data 
# with a white color, and (2) making a single call to the lines function.



# 62. The first row of the InsectRepelant dataset has a count of 10. Add to
# the plot a stack of solid points to represent this count between the 
# coordinates (1,1) and (1,10).



# 63. Now, replicate this for every row of data on a plot. Do not include the 
# line as it will no longer be needed. You can do this in several ways, though 
# the most straightforward is as a loop over the rows of the dataset. Hint: You 
# may need to create a special case for the two rows with a count of zero.



# 64. Duplicate the previous plot, but use the spray type as a text object (it 
# is a single letter between A and F) in place of the dots).



# 65. Add vertical bars to separate the groups. Do not do this manually, but use
# vectors to plot all the lines at once.



# 66. Using dots again instead of letters replicate the plot such that one dot 
# represents three counts. Do not plot any remainder, so a count of 5 should 
# have only one dot. Hint: The floor function will be helpful; it removes the 
# fractional part of a number.



# 67. Now, redo the plot such that the fractional part of the remainder is 
# represented by a smaller dot. So a remainder of 0.33 gets a dot with cex=0.33 
# and a remainder of 0.66 gets a dot with cex=0.66.



# 68. The object AirPassengers is a dataset which gives the number of 
# international airline passengers by month for 12 years of data. It is stored 
# by default in an atypical format but can be converted to a matrix easily:

ap <- matrix(as.numeric(AirPassengers),ncol=12)
rownames(ap) <- month.abb
colnames(ap) <- 1949:1960

# Calculate the total flyers for each year, and then calculate the total number 
# of flyers over each month. Are there any noticeable patterns?



# 69. Construct a line plot of the number of fliers for 1949. Use custom axes to
# label the months.



# 70. Construct a graphic with line plots for every year. Add a text label to 
# the data point for July to label the years. Hint: Use range(ap) to determine 
# the limits of the y-axis to capture all of the data



# 71. Produce a scatter plot of the 1949 data against the 1950 data. Use text to
# label the points. Remember to offset the labels from the points.



# 72. Produce a new dataset which shows the month percentage of flights for each
# year. In other words, each column should sum to 100. Save this as scaledAp.



# 73. Create a new line chart showing these standardized values for each year 
# over the months.



# 74. Create an empty plot with x and y ranges from 1 to 12. Create a dot at 
# each coordinate (i, j) to represent the value in the 12 by 12 matrix ap. Use 
# relative sizes to show the value. Construct useful custom axes (use the option 
# las=2 to make the axes look nicer).



# 75. Recreate the plot using the scaledAp data. Color points blue if they are 
# less than 100/12 and red if they are greater than 100/12 (we use this cut-off 
# as it represents a typical month).

