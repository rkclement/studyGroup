# Excerpt From: Taylor Arnold and Lauren Tilton, _Humanities Data in R_ 
# Chapter 3 Supplemental Questions

# 26. The dataset iris is a very well-known statistical data from the 1930s. It
# gives several measurements of iris sepal and petal lengths (in centimeters)
# for three species. Construct a table of sepal length rounded to the nearest
# centimeter versus Species.

table(round(iris$Sepal.Length), iris$Species)

# 27. Construct the same table, but rounded to the nearest half centimeter.

table(round(iris$Sepal.Length*2)/2, iris$Species)

# 28. Plot a histogram of the sepal length for the entire iris dataset.

hist(iris$Sepal.Length)

# 29. Replicate the previous histogram, but manually specify the break points for
# the histogram and add a custom title and axis labels.

hist(iris$Sepal.Length, breaks = seq(4, 8, by = 0.25),
     xlab = "Sepal Length",
     ylab = "Counts",
     main = "Distribution of Sepal Length for Iris Dataset")

# 30. Plot three histograms showing the sepal length separately for each species.
# Make sure the histograms use the same break points for each plot (Hint: use
# the same as manually set in the previous question). Add helpful titles for the
# plots, and make sure to set R to display three plots at once.

par(mfrow = c(3,1))

hist(iris$Sepal.Length[iris$Species == "setosa"], 
     breaks = seq(4, 8, by = 0.25),
     xlab = "",
     ylab = "Counts",
     main = "Distribution of Sepal Length for Setosa Species")

hist(iris$Sepal.Length[iris$Species == "versicolor"], 
     breaks = seq(4, 8, by = 0.25),
     xlab = "",
     ylab = "Counts",
     main = "Distribution of Sepal Length for Versicolor Species")

hist(iris$Sepal.Length[iris$Species == "virginica"], 
     breaks = seq(4, 8, by = 0.25),
     xlab = "Sepal Length",
     ylab = "Counts",
     main = "Distribution of Sepal Length for Virginica Species")
# 31. Calculate the deciles of the petal length for the entire iris dataset.

petals <- quantile(iris$Petal.Length, probs = seq(0, 1, 0.1))

# 32. Construct a table showing the number of samples from each species with 
# petal length in the top 30 % of the dataset. How well does this help 
# categorize  the dataset by species?

petals <- quantile(iris$Petal.Length, probs = 0.7)
table(iris$Species, petals < iris$Petal.Length)

# This table shows the disparity between the petal lengths of the smaller setosa
# and versicolor species from the longer-petaled virginica species. 

# 33. Now bin the iris dataset into deciles based on the petal length. Produce a 
# table by species. How well does this categorize the dataset by species?

petals <- quantile(iris$Petal.Length, probs = seq(0, 1, 0.1), names = FALSE)

bins <- cut(iris$Petal.Length, petals, labels = FALSE, include.lowest = TRUE)
table(iris$Species, bins)

# This table even more effectively shows the spread from the short-petaled 
# setosa, to the medium-petaled versicolor, to the long-petaled virginica.

# 34. We can get a very rough estimate of the petal area by multiplying the 
# petal length and width. Calculate this area, bin the dataset into deciles on 
# area,  and compute table of the petal length deciles against the area deciles. 
# How  similar do these measurements seem?

petal_area <- quantile(iris$Petal.Length*iris$Petal.Width, 
                       probs = seq(0, 1, 0.1), names = FALSE)

bins2 <- cut(iris$Petal.Length*iris$Petal.Width, petal_area, 
            labels = FALSE, include.lowest = TRUE)
table(bins, bins2)

# These measuremens are quite similar.


# 35. Without using a for loop, construct a vector with the median petal length 
# for each species. Add appropriate names to the output.

median_petals <- rep(0, length = 3)

median_petals[1] <- median(iris$Petal.Length[iris$Species == "setosa"])
median_petals[2] <- median(iris$Petal.Length[iris$Species == "versicolor"])
median_petals[3] <- median(iris$Petal.Length[iris$Species == "virginica"])

names(median_petals) <- c("setosa", "versicolor", "virginica")
median_petals

# 36. Repeat the previous question using a for loop.

median_petals <- rep(0, length = 3)
species <- unique(iris$Species)

for (i in 1:3) {
  median_petals[i] <- median(iris$Petal.Length[iris$Species == species[i]])
}
names(median_petals) <- as.vector(species)
median_petals

# 37. Finally, repeat again using tapply.

tapply(iris$Petal.Length, iris$Species, median)

# 38. As in a previous question, write a function which asks the user for a 
# state abbreviation and returns the state name. However, this time, put the 
# question in a for loop so the user can decode three straight state 
# abbreviations.

askState2 <- function() {
  for (i in 1:3) {
    abr <- readline("Please enter a 2-letter state abbreviation to see the state: ")
    abr <- toupper(abr)
    ans <- abr %in% state.abb
    pos <- which(state.abb == abr)
    if (ans == FALSE) {
      print("This is not a valid 2-letter state abbreviation.")
    }
    else
      print(state.name[pos])
  }
}  
askState2()

# 39. The command break immediately exits a for loop; it is often used inside
# of an if statement. Redo the previous question, but break out of the loop
# when a non-matching abbreviation is given. You can increase the number of
# iterations to something large (say, 100), as a user can always get out of the
# function by giving a non-abbreviation.

askState3 <- function() {
  for (i in 1:100) {
    abr <- readline("Please enter a 2-letter state abbreviation to see the state: ")
    abr <- toupper(abr)
    ans <- abr %in% state.abb
    pos <- which(state.abb == abr)
    if (ans == FALSE) {
      print("This is not a valid 2-letter state abbreviation. Goodbye.") 
      break
    }
    else
      print(state.name[pos])
  }
}  
askState3()

# 40. Now, reverse the process so that the function returns when an abbreviation 
# is found but asks again if it is not.

askState4 <- function() {
  for (i in 1:100) {
    abr <- readline("Please enter a 2-letter state abbreviation to see the state: ")
    abr <- toupper(abr)
    ans <- abr %in% state.abb
    pos <- which(state.abb == abr)
    if (ans == TRUE) {
      print(state.name[pos])
      break
    }
  }
}  
askState4()

# 41. Using a for loop, print the sum 1+1/2+1/3+1/4 + ··· + 1/n for all n
# equal to 1 through 100.

for (i in 1:100) {
  print(sum(1/(1:i)))
}

# 42. Now calculate the sum for all 100 values of n using a single function call.

cumsum(1/(1:100))

# 43. Ask the user for their year of birth and print out the age they turned for 
# every year between then and now.

askBirth <- function() {
  birthyear <- readline("What year were you born? ")
  birthyear <- as.numeric(birthyear)
  currentyear <- as.numeric(format(Sys.Date(), "%Y"))
  age <- currentyear - birthyear
  for (i in 1:age) {
    print(paste("You turned", i, "years old in", currentyear - age + i))
  }
}
askBirth()

# 44. The dataset InsectSprays shows the count of insects after applying one of
# six different insect repellents. Construct a two-row three-column grid of 
# histograms, on the same scale, showing the number of insects from each spray.
# Do this using a for loop rather than coding each plot by hand.

par(mfrow = c(2,3))
spray <- unique(InsectSprays$spray)
for (i in 1:length(sprays)) {
  hist(InsectSprays$count[InsectSprays$spray == spray[i]]/sum(InsectSprays$count[InsectSprays$spray == spray[i]]), 
       breaks = seq(0, 0.3, by = 0.025),
       ylim = c(0, 6))
}

# 45. Repeat the same two by three plot, but now remove the margins, axes, and
# labels. Replace these by adding the spray identifier (a single letter) to the 
# plot with the text command.

par(mfrow = c(2,3))
par(mar = c(0,0,0,0))
sprays <- unique(InsectSprays$spray)
for (i in 1:length(sprays)) {
  hist(InsectSprays$count[InsectSprays$spray == spray[i]]/sum(InsectSprays$count[InsectSprays$spray == spray[i]]), 
       breaks = seq(0, 0.3, by = 0.025),
       axes = FALSE,
       main = "",
       xlab = "",
       ylab = "",
       ylim = c(0, 6),
       col = "grey")
  box()
  text(x = .15, 
       y = 6,
       label = paste("Spray:", sprays[i]),
       col = "red")
}

# 46. Calculate the median insect count for each spray.

tapply(InsectSprays$count, InsectSprays$spray, median)


# 47. Using the WorldPhones dataset, calculate the total number of phones used
# in each year using a for loop.

totalphones <- rep(NA, nrow(WorldPhones))
for (i in 1:nrow(WorldPhones)) {
  totalphones[i] <- sum(WorldPhones[i,])
}
totalphones

# 48. Calculate the total number of phones used in each year using a single 
# apply function.

totalphones <- apply(WorldPhones, 1, sum)

# 49. Calculate the percentage of phones that were in Europe over the years in
# question.

percEuroPhone <- round((WorldPhones[,2]/totalphones) * 100, 2)
percEuroPhone

# 50. Convert the entire WorldPhones matrix to percentages; in other words, each
# row should sum to 100.

percWorldPhone <- round((WorldPhones/totalphones) * 100, 2)
percWorldPhone