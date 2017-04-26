# Excerpt From: Taylor Arnold and Lauren Tilton, _Humanities Data in R_ 
# Chapter 4 Supplemental Questions

# 51. Produce a scatter plot of sepal length versus petal length in the iris 
# dataset.

plot(iris$Sepal.Length, iris$Petal.Length)

# 52. Add color to the scatter plot of sepal length versus petal length to 
# distinguish the three iris species. Use solid dots to highlight the colors.

plot(iris$Sepal.Length, iris$Petal.Length, pch = 19,
     col = ifelse(iris$Species == "setosa", "red", 
                  ifelse(iris$Species == "versicolor", "blue", "green")))

# 53. Using the previous plot as a starting point, change the size of the points 
# based on the sepal width. Hint: A good way to get nice sizes is to divide the 
# sepal width by the median width.

sizes <- iris$Sepal.Width/median(iris$Sepal.Width)
plot(iris$Sepal.Length, iris$Petal.Length, pch = 19,
     col = ifelse(iris$Species == "setosa", "red", 
                  ifelse(iris$Species == "versicolor", "blue", "green")),
     cex = sizes)

# 54. Change the plot to use the text of the species type instead of dots. You 
# can remove the sizing based on sepal width so that all of the text is of the 
# same size; however, it may help to make all the text points smaller than the 
# default to reduce overplotting.

plot(iris$Sepal.Length, iris$Petal.Length, 
     pch = 19,
     col = "white")
text(iris$Sepal.Length, iris$Petal.Length, iris$Species,
     col = ifelse(iris$Species == "setosa", "red", 
                  ifelse(iris$Species == "versicolor", "blue", "green")),
     cex = 0.5)

# 55. Add a vertical and horizontal median to the scatter plot of sepal length 
# versus petal length.

plot(iris$Sepal.Length,iris$Petal.Length, pch = 19,
     col = ifelse(iris$Species == "setosa", "red", 
                  ifelse(iris$Species == "versicolor", "blue", "green")))
abline(v = median(iris$Sepal.Length))
abline(h = median(iris$Petal.Length))

# 56. Add by group vertical and horizontal medians to the scatter plot of sepal
# length versus petal length. There should be three vertical and three 
# horizontal lines. Color the lines and points based on species, and make the 
# lines dashed rather than solid.

plot(iris$Sepal.Length,iris$Petal.Length, pch = 19,
     col = ifelse(iris$Species == "setosa", "red", 
                  ifelse(iris$Species == "versicolor", "blue", "green")))

colVals <- c("red", "blue", "green")
vertVals <- tapply(iris$Sepal.Length, iris$Species, median)
horzVals <- tapply(iris$Petal.Length, iris$Species, median)
abline(v = vertVals, 
       col = colVals,
       lty = "dashed")
abline(h = horzVals, 
       col = colVals,
       lty = "dashed")

# 57. Reconstruct the scatter plot of sepal length versus petal length with 
# species colors. Add text to show the medians of the three groups. Test out 
# different sizes for the points and text to make nice looking plot.

species <- unique(iris$Species)
plot(iris$Sepal.Length,iris$Petal.Length, pch = 19,
     col = ifelse(iris$Species == "setosa", "red", 
                  ifelse(iris$Species == "versicolor", "blue", "green")))

colVals <- c("red", "blue", "green")
vertVals <- tapply(iris$Sepal.Length, iris$Species, median)
horzVals <- tapply(iris$Petal.Length, iris$Species, median)
text(vertVals, horzVals, species, cex = 1.5)

# 58. Construct a plot of petal length versus sepal width. The plot has two 
# large clusters of points (in the upper left and lower right) and one outlier 
# in the bottom left. Construct a coloring for these three groups. Produce a 
# side by side plot showing petal length versus sepal width next to sepal length 
# versus petal length. Use the new color scheme for both.

plot(iris$Petal.Length, iris$Sepal.Width)

groups = rep(2L,nrow(iris))
groups[iris$Petal.Length < 2] = 1L
groups[iris$Petal.Length < 2 & iris$Sepal.Width < 2.5] = 3L

par(mfrow = c(1, 2))
colVals <- c("red", "blue", "green")
plot(iris$Petal.Length, iris$Sepal.Width, col = colVals[groups], pch = 19)
plot(iris$Sepal.Length,iris$Petal.Length, col = colVals[groups], pch = 19)

# 59. Create a scatter plot matrix (pairs plot) from the four numerical 
# variables in the iris dataset. You should reduce the margins to fit the entire 
# plot on the screen but do not need to directly replicate all of the tweaks 
# from Sect. 4.6.

par(mfrow=c(4,4))
par(mar=c(1,1,1,1))
par(oma=c(2,2,2,2))
for (i in 1:4) {
  for (j in 1:4) {
    plot(iris[,i], iris[,j], pch=19, cex=0.5)
  }
}

# 60. Change the custom scatter plot matrix to have a histogram on the diagonal
# axis.

# added extra color
par(mfrow=c(4,4))
par(mar=c(1,1,1,1))
par(oma=c(2,2,2,2))
for (i in 1:4) {
  for (j in 1:4) {
    if (i != j) plot(iris[,i], iris[,j], pch=19, cex=0.5, 
                     col = ifelse(iris$Species == "setosa", "red", 
                      ifelse(iris$Species == "versicolor", "blue", "green")))
    if (i == j) hist(iris[,i], main="", col = "gray")
  }
}

# 61. Take the InsectRepelant dataset and produce a single line plot of the
# data. It will be easiest going forward to do this by (1) plotting the data 
# with a white color, and (2) making a single call to the lines function.

plot(InsectSprays$count, col = "white")
lines(InsectSprays$count)

# 62. The first row of the InsectRepelant dataset has a count of 10. Add to
# the plot a stack of solid points to represent this count between the 
# coordinates (1,1) and (1,10).

plot(InsectSprays$count, col = "white")

lines(InsectSprays$count)

points(rep(1, 10), 1:10, pch = 19)

# 63. Now, replicate this for every row of data on a plot. Do not include the 
# line as it will no longer be needed. You can do this in several ways, though 
# the most straightforward is as a loop over the rows of the dataset. Hint: You 
# may need to create a special case for the two rows with a count of zero.

plot(InsectSprays$count, col = "white")

for (i in 1:nrow(InsectSprays)) {
  thisCount = InsectSprays$count[i]
  if (thisCount > 0) points(rep(i, thisCount), 1:thisCount, pch = 19)
}

# 64. Duplicate the previous plot, but use the spray type as a text object (it 
# is a single letter between A and F) in place of the dots).

plot(InsectSprays$count, col = "white")

for (i in 1:nrow(InsectSprays)) {
  thisCount = InsectSprays$count[i]
  thisSpray = InsectSprays$spray[i]
  if (thisCount > 0) text(rep(i, thisCount), 1:thisCount, thisSpray)
}

# 65. Add vertical bars to separate the groups. Do not do this manually, but use
# vectors to plot all the lines at once.

plot(InsectSprays$count, col = "white")

for (i in 1:nrow(InsectSprays)) {
  thisCount = InsectSprays$count[i]
  thisSpray = InsectSprays$spray[i]
  if (thisCount > 0) text(rep(i, thisCount), 1:thisCount, thisSpray)
}

abline(v=seq(0.5,72.5,by=12))

# 66. Using dots again instead of letters replicate the plot such that one dot 
# represents three counts. Do not plot any remainder, so a count of 5 should 
# have only one dot. Hint: The floor function will be helpful; it removes the 
# fractional part of a number.

plot(floor(InsectSprays$count/3))

for (i in 1:nrow(InsectSprays)) {
  thisCount = floor(InsectSprays$count/3)[i]
  if (thisCount > 0) points(rep(i, thisCount), 1:thisCount, pch = 19)
}

# 67. Now, redo the plot such that the fractional part of the remainder is 
# represented by a smaller dot. So a remainder of 0.33 gets a dot with cex=0.33 
# and a remainder of 0.66 gets a dot with cex=0.66.

plot(floor(InsectSprays$count/3),col="white")

for (i in 1:nrow(InsectSprays)) {
  thisCount = floor(InsectSprays$count/3)[i]
  thisSpray = InsectSprays$spray[i]
  if (thisCount > 0) points(rep(i,thisCount), 1:thisCount, pch = 19)
  fracPart = (InsectSprays$count/3)[i] -
    floor(InsectSprays$count/3)[i]
  points(i,thisCount+1, pch = 19, cex = fracPart, col = "gray")
}

# 68. The object AirPassengers is a dataset which gives the number of 
# international airline passengers by month for 12 years of data. It is stored 
# by default in an atypical format but can be converted to a matrix easily:

ap <- matrix(as.numeric(AirPassengers), ncol = 12)
rownames(ap) <- month.abb
colnames(ap) <- 1949:1960

# Calculate the total flyers for each year, and then calculate the total number 
# of flyers over each month. Are there any noticeable patterns?

flyers_year <- apply(ap, 2, sum)
flyers_month <- apply(ap, 1, sum)

# 69. Construct a line plot of the number of fliers for 1949. Use custom axes to
# label the months.

plot(1:12, ap[,1], col = "white", axes = FALSE)
axis(2)
axis(1, at = 1:12, rownames(ap))
lines(1:12, ap[,1])

# 70. Construct a graphic with line plots for every year. Add a text label to 
# the data point for July to label the years. Hint: Use range(ap) to determine 
# the limits of the y-axis to capture all of the data

plot(1:12, ap[,1], col = "white", axes = FALSE, ylim = range(ap))
axis(2)
axis(1, at = 1:12, rownames(ap))
for (j in 1:nrow(ap))
  lines(1:12, ap[,j])
text(rep(7,12), ap[7,], colnames(ap))

# 71. Produce a scatter plot of the 1949 data against the 1950 data. Use text to
# label the points. Remember to offset the labels from the points.

plot(ap[,1], ap[,2], pch = 19, ylim = c(100, 180))
text(ap[,1], ap[,2] + 3, rownames(ap))

# 72. Produce a new dataset which shows the month percentage of flights for each
# year. In other words, each column should sum to 100. Save this as scaledAp.

perc_ap <- round(t(t(ap) / apply(ap, 2, sum) * 100), 2)

# 73. Create a new line chart showing these standardized values for each year 
# over the months.

perc_ap <- round(t(t(ap) / apply(ap, 2, sum) * 100), 2)

plot(1:12, perc_ap[,1], col = "white", axes = FALSE, ylim = c(0, 15))
axis(2)
axis(1, at = 1:12, rownames(perc_ap))
for (j in 1:nrow(perc_ap))
  lines(1:12, perc_ap[,j])
text(rep(7,12), perc_ap[7,], colnames(perc_ap), cex = 0.5)

# 74. Create an empty plot with x and y ranges from 1 to 12. Create a dot at 
# each coordinate (i, j) to represent the value in the 12 by 12 matrix ap. Use 
# relative sizes to show the value. Construct useful custom axes (use the option 
# las=2 to make the axes look nicer).

plot(0,0,xlim=c(1,12),ylim=c(1,12), col="white",
     axes=FALSE, main="", xlab="", ylab="")

box()
axis(1, at = 1:12, colnames(ap), las = 2)
axis(2, at = 1:12, rownames(ap), las = 2)

for (i in 1:12) {
  points(rep(i, 12), 1:12, cex = ap[,i]/mean(ap), pch = 19)
}

# 75. Recreate the plot using the scaledAp data. Color points blue if they are 
# less than 100/12 and red if they are greater than 100/12 (we use this cut-off 
# as it represents a typical month).

perc_ap <- round(t(t(ap) / apply(ap, 2, sum) * 100), 2)

plot(0,0,xlim=c(1,12),ylim=c(1,12), col="white",
     axes=FALSE, main="", xlab="", ylab="")

box()
axis(1, at = 1:12, colnames(perc_ap), las = 2)
axis(2, at = 1:12, rownames(perc_ap), las = 2)

cols = matrix("blue", nrow=12, ncol=12)
cols[perc_ap > 1/12 * 100] <- "red"

for (i in 1:12) {
  points(rep(i,12), 1:12, cex = perc_ap[,i] / mean(perc_ap),
         pch = 19, col = cols[,i])
}
