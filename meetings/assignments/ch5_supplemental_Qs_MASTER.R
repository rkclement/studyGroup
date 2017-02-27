# Excerpt From: Taylor Arnold and Lauren Tilton, _Humanities Data in R_ 
# Chapter 5 Supplemental Questions

# 76. The dataset ChickWeight contains several time series showing the weight
# of young chickens feed one of four different diets. Produce a series of line
# plots using categorical colors. Use the colorspace package for the colors.



# 77. Remove the five chicks with incomplete data. Normalize the weights of each
# chick such that each weighs 0 on the first day and 1 on the last day.



# 78. Construct a matrix with one row for each chick showing the growth rate, 
# (new weight−old weight/old weight) for each day. This will have 11 columns and
# a row for each chick.



# 79. Plot the chick ids against the growth rates.



# 80. Change labels from the previous plot into text commands giving the day in
# time for a random sample set of 3 days selected for each chick.



# 81. Repeat the previous plot with solid dots, where a sequential palette is 
# used to indicate time.



# 82. Create and place a legend decoding the colors from the previous plot. You
# will have to increase the size of the plot and perhaps make the legend smaller
# than the default to fit everything. What do you notice about typical growth
# rates from this plot now?



# 83. Take AirPassengers dataset and plot the 1949 counts against the 1950
# counts, using a categorical palette to distinguish the four seasons of the 
# data.



# 84. Redo the previous plot using a sequential heat palette to show the months 
# and include a legend to explain the colors.



# 85. Plot two randomly chosen numeric variables from the iris dataset.



# 86. A previous question asked to plot the sepal length versus petal length for 
# the iris data, where each point is labeled with text giving the plant species. 
# Redo this plot using subsampling to reduce the over plotting. Use a color 
# palette to select the colors for the plot.



# 87. Now, redo the plot of sepal length versus petal length using a sequential 
# color palette to display sepal width, using five buckets for the bins.



# 88. Add a helpful legend for the colors in the previous plot to describe the 
# coloring of the points.



# 89. Reconstruct the scaledAp data, but this time subtract the 100/12 from 
# every entry. Create a histogram of the results. The average value should be 
# zero, but the median of the scaled results will be negative.



# 90. Create a divergent palette with 21 bins from the scaledAp. Recall that 
# this requires two sets of bins. Use this to plot the entire dataset as a 
# single time series; add a line through the data points to improve readability.



# 91. Edit the previous line plot to have a legend off to the right of the 
# entire plot, and add custom x-axis labels showing the years.



# 92. Write a for loop that cycles over the numbers 1–100. For each iteration of 
# the loop, if the number is divisible by 3, print “fizz” to the console, and if 
# divisible by 5, print “buzz”. Otherwise print the number itself. (This is a 
# well-known intro interview question for new programmers called FizzBuzz).



# 93. Repeat FizzBuzz using a vector in place of a loop. The return value will 
# be a character vector.



# 94. Create a function which asks the user for how many letters they would like
# their password to be and then generates a random string of letters/numbers
# of that length as a random password. Hint: R has the objects letter and
# LETTERS built in a default object.



# 95. Sample 1000 points from the set containing just 1 and −1. Calculate the 
# cumulative sum of this sample. This simulates a mathematical model known as a
# random walk.



# 96. Plot the cumulative sum of the random walk over time as a line plot. Run
# it several times to see different random outputs. What does the plot remind
# you of?



# 97. R provides the function Sys.sleep, which causes the program to wait for
# a given number of seconds before proceeding. Combine this with a short
# time period (0.1 seconds is a good first guess) to animate the previous plot 
# by waiting in-between drawing each line segment.



# 98. Calculate 10,000 separate random walks, saving the 500th and 1000th step
# from each. Take the result and create a scatter plot of the results; use a 
# color with an alpha channel to reduce the effects of over plotting. What 
# patterns do you see in the plot?



# 99. Calculate side-by-side histograms of the 500th and 1000th positions from 
# the previous simulation. What patterns do you notice here?



# 100. Write a function to simulate the game “rock-scissors-paper”. You should 
# ask the user to select one of these by name, generate a random response, and
# indicate who won.