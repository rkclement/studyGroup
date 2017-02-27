# Excerpt From: Taylor Arnold and Lauren Tilton, _Humanities Data in R_ 
# Chapter 3 Supplemental Questions

# 26. The dataset iris is a very well-known statistical data from the 1930s. It
# gives several measurements of iris sepal and petal lengths (in centimeters)
# for three species. Construct a table of sepal length rounded to the nearest
# centimeter versus Species.



# 27. Construct the same table, but rounded to the nearest half centimeter.



# 28. Plot a histogram of the sepal length for the entire iris dataset.



# 29. Replicate the previous histogram, but manually specify the break points for
# the histogram and add a custom title and axis labels.



# 30. Plot three histograms showing the sepal length separately for each species.
# Make sure the histograms use the same break points for each plot (Hint: use
# the same as manually set in the previous question). Add helpful titles for the
# plots, and make sure to set R to display three plots at once.



# 31. Calculate the deciles of the petal length for the entire iris dataset.



# 32. Construct a table showing the number of samples from each species with 
# petal length in the top 30 % of the dataset. How well does this help 
# categorize  the dataset by species?



# 33. Now bin the iris dataset into deciles based on the petal length. Produce a 
# table by species. How well does this categorize the dataset by species?



# 34. We can get a very rough estimate of the petal area by multiplying the 
# petal length and width. Calculate this area, bin the dataset into deciles on 
# area,  and compute table of the petal length deciles against the area deciles. 
# How  similar do these measurements seem?



# 35. Without using a for loop, construct a vector with the median petal length 
# for each species. Add appropriate names to the output.



# 36. Repeat the previous question using a for loop.



# 37. Finally, repeat again using tapply.



# 38. As in a previous question, write a function which asks the user for a 
# state abbreviation and returns the state name. However, this time, put the 
# question in a for loop so the user can decode three straight state 
# abbreviations.



# 39. The command break immediately exits a for loop; it is often used inside
# of an if statement. Redo the previous question, but break out of the loop
# when a non-matching abbreviation is given. You can increase the number of
# iterations to something large (say, 100), as a user can always get out of the
# function by giving a non-abbreviation.



# 40. Now, reverse the process so that the function returns when an abbreviation 
# is found but asks again if it is not.



# 41. Using a for loop, print the sum 1+1/2+1/3+1/4 + ··· + 1/n for all n
# equal to 1 through 100.



# 42. Now calculate the sum for all 100 values of n using a single function call.



# 43. Ask the user for their year of birth and print out the age they turned for 
# every year between then and now.



# 44. The dataset InsectSprays shows the count of insects after applying one of
# six different insect repellents. Construct a two-row three-column grid of 
# histograms, on the same scale, showing the number of insects from each spray.
# Do this using a for loop rather than coding each plot by hand.



# 45. Repeat the same two by three plot, but now remove the margins, axes, and
# labels. Replace these by adding the spray identifier (a single letter) to the 
# plot with the text command.



# 46. Calculate the median insect count for each spray.


# 47. Using the WorldPhones dataset, calculate the total number of phones used
# in each year using a for loop.



# 48. Calculate the total number of phones used in each year using a single 
# apply function.



# 49. Calculate the percentage of phones that were in Europe over the years in
# question.



# 50. Convert the entire WorldPhones matrix to percentages; in other words, each
# row should sum to 100.