# Excerpt From: Taylor Arnold and Lauren Tilton, _Humanities Data in R_
# Chapter 2 Supplemental Questions

# Please answer as many of the following questions as you can, BUT FOCUS ON
# questions 1, 4, 8, 10, 11, 12, 14, 16, 18, and 24. For a bonus (!), try
# your hand at questions 9 and 19, in particular!

# 1. Ask for a positive number and return a vector of all the numbers
# between 1 and the input.

# 2. Ask for a number and return a vector of all the even numbers
# between 1 and the input.

# 3. Ask for a positive integer n. Return the sum: 1 + 1∕2 + 1∕3 + 1∕4 + ⋯ + 1∕n.

# 4. Ask for the total of a bill and return the amount of a 15% tip.
# The round function is useful for cleaning up the result to an even penny.

# 5. Ask for a user’s birth year and print the age they will turn this year.
# You can write the current year directly without trying to determine it
# externally (it is possible to determine the current year, but was not
# covered in Chap.2).

# 6. Write a function which asks for a number and determines if it is a
# whole number (or not). Print a message displaying the result using print.

# 7. The factorial of an integer is the product of all the positive integers
# less than or equal to it. For example, the factorial of 4 is equal to
# 4 ∗ 3 ∗ 2 ∗ 1 = 24. There is a function factorial() in base R for
# calculating these. Ask for a number and return the factorial, without
# using the R function. Hint: The function prod may be helpful.

# 8. Ask the user for a number between 1 and 10 and return the corresponding
# simple ordinal number. For example, 1 should be 1st, 2 should be 2nd,
# and 4 should be 4th. Hint: You should not write 10 separate if statements.
# Notice that the numbers 4–10 all have the same ending of “th”.

# 9. Repeat the previous question, but allow the user to input any whole,
# positive number. Hint: Keep the input as a character vector and make
# use of the nchar and substr functions.

# 10. There is a character vector available in base R called state.abb giving
# the two digit postal abbreviations for the 50 US States. Write a function
# which asks for an abbreviation and returns TRUE if it is an abbreviation
# and FALSE otherwise.

# 11. Repeat the previous question, but allow for cases where the user inputs
# a different capitalization. For example, “CA”, “Ca”, and “ca” should all
# return as TRUE.

# 12. R provides another vector of state names as a vector called state.name.
# The elements line up with the abbreviations; for example, element 33 of
# the abbreviations is “NC” and element 33 of the names is “North Carolina”.
# Write a function which asks for an abbreviation and returns the
# corresponding state name. If there is none, return the string “error”.”

# 13. Finally, write a function which asks for either a state name or state
# abbreviation. When given an abbreviation, it returns the state name, and
# when given a name it returns the state abbreviation. If there is no match
# to either it returns the string “error”

# 14. The object state.x77 is a matrix that gives several summary statistics
# for each of the 50 US States from 1977. Calculate the number of high
# school graduates in each state, and sort from highest to lowest.

# 15. Calculate the number of high school graduate per square mile in each state.

# 16. Ask the user to provide a state abbreviation, and return the number of
# high school graduates in that state in 1977.

# 17. Now, print a vector of the state names from the highest illiteracy rate
# to the lowest illiteracy rate. Hint: The state names are given as rownames.

# 18. Construct a data frame with ten rows and three columns: Illiteracy,
# Life_expectancy, Murder, and HS_grad. Each column gives the names of
# the worst 10 state names. Hint: some measures are good when they are
# high and others are good when the are low. You will need to take account
# of these.

# 19. Using vector notation, print the state names which are in both the top 10
# for illiteracy and top 10 for murder rates in 1977.

# 20. There are several other small datasets contained within the base installation
# of R. One of these is the Titanic dataset, accessed by the object Titanic.
# The format is a bit strange at first, but can be converted to a data frame
# with the following code:
ti <- as.data.frame(Titanic)
# It has a row for each combination of Class, Sex, Age, and Survival flag,
# along with a frequency count (see ?Titanic for more information).
# Write a function which asks the user to input a Class category
# (either “1st”, “2nd”, “3rd”, or “Crew”) and prints the total survival and
# death counts for that category.

# 21. Take the titanic dataset and again ask the user to select a class. Write
# the subset of the data from this class and save it as a comma separated
# value file named “titanicOutput.csv” in the current working directory. Print
# to the user the full path of the created file.

# 22. Ask the user for the working directory where the previous command was run.
# Set the working directory to this location, read the titanic dataset into
# R and return it.

# 23. Repeat the previous question, but instead print the passenger Class for
# which the file “titanicOutput.csv” was saved.

# 24. R provides another dataset called WorldPhones giving the number of telephones
# in seven world regions, in thousands, for the years 1951, 1956, 1957, 1958,
# 1959, 1960, and 1961. Calculate the percentage change in number of phones for
# each region between 1951 and 1961. Use vector notation, do not do each region
# by hand! Hint: Percentage change is (new value − old value)/old value.

# 25. Ask the user for a year between 1951 and 1961. Return the number of phones
# in Europe for the year closest, but not after, the input year.
