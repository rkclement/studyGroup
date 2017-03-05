# Excerpt From: Taylor Arnold and Lauren Tilton, _Humanities Data in R_ 
# Chapter 2 Supplemental Questions

# Ask for a positive number and return a vector of all the numbers 
# between 1 and the input.

ask <- function() {
  z <- readline("enter a positive number: ")
  z <- as.numeric(z)
  return(1:z)
}
ask()

# Ask for a number and return a vector of all the even numbers 
# between 1 and the input.

ask <- function() {
  z <- readline("enter a number: ")
  z <- as.numeric(z)
  return(c(1:z)[c(FALSE,TRUE)])
}
ask()

# Ask for a positive integer n. Return the sum: 1 + 1∕2 + 1∕3 + 1∕4 + ⋯ + 1∕n.

ask <- function() {
  z <- readline("enter a positive integer: ")
  z <- as.numeric(z)
  return(sum(1/(1:z)))
}
ask()

# Ask for the total of a bill and return the amount of a 15% tip. 
# The round function is useful for cleaning up the result to an even penny.

askBill <- function () {
  bill <- readline("Enter the total of your bill: ")
  perc <- readline("Enter the desired tip percentage (e.g. 10, 15, 20): ")
  tip <- round((as.numeric(bill) * (as.numeric(perc)/100)), 2)
  return(paste(("Your tip is "), "$", tip, sep = ""))
}
askBill()

# Ask for a user’s birth year and print the age they will turn this year. 
# You can write the current year directly without trying to determine it 
# externally (it is possible to determine the current year, but was not 
# covered in Chap.2).

askYear <- function() {
  birth <- readline("What year were you born? ")
  birth <- as.integer(birth)
  now <- as.integer(format(Sys.Date(), "%Y"))
  age <- now - birth
  return(paste("This year, you will turn", age, "years old."))
}
askYear()

# Write a function which asks for a number and determines if it is a 
# whole number (or not). Print a message displaying the result using print.

ask <- function() {
  x <- readline("Pick a number, any number: ")
  x <- as.numeric(x)
  if (x == round(x)) {
    print("That is an integer!")
  }  else {
      print("That is NOT an integer!")
    }
}
ask()

# The factorial of an integer is the product of all the positive integers 
# less than or equal to it. For example, the factorial of 4 is equal to 
# 4 ∗ 3 ∗ 2 ∗ 1 = 24. There is a function factorial() in base R for 
# calculating these. Ask for a number and return the factorial, without 
# using the R function. Hint: The function prod may be helpful.

askFac <- function() {
  x <- readline("Enter a number to find the factorial: ")
  xfac <- prod(1:x)
  return(xfac)
}
askFac()

# Ask the user for a number between 1 and 10 and return the corresponding 
# simple ordinal number. For example, 1 should be 1st, 2 should be 2nd, 
# and 4 should be 4th. Hint: You should not write 10 separate if statements. 
# Notice that the numbers 4–10 all have the same ending of “th”.

ordinal <- function() {
  x <-readline("Enter a number between 1 and 10 to see the ordinal: ")
  if (x == 1) {
    return(paste(x, "st", sep=""))
  }
  else if (x == 2) {
    return(paste(x, "nd", sep=""))
  }
  else if (x == 3) {
    return(paste(x, "rd", sep=""))
  }
  else 
    return(paste(x, "th", sep=""))
}
ordinal()

# Repeat the previous question, but allow the user to input any whole, 
# positive number. Hint: Keep the input as a character vector and make 
# use of the nchar and substr functions.

# This solution doesn't work! Try 111, 2112, etc. to see why. How would 
# you fix this?

ordinal2 <- function() {
  x <-readline("Enter a whole, positive number to see the ordinal: ")
  y <- substr(x, nchar(x), nchar(x))
  return(y)
  if (x == 11) {
    return(paste(x, "th", sep=""))
  }
  else if (x == 12){
    return(paste(x, "th", sep=""))
  }
  else if (x == 13){
    return(paste(x, "th", sep=""))
  }
  else if (y == 1) {
    return(paste(x, "st", sep=""))
  }
  else if (y == 2) {
    return(paste(x, "nd", sep=""))
  }
  else if (y == 3) {
    return(paste(x, "rd", sep=""))
  }
  else 
    return(paste(x, "th", sep=""))
}
ordinal2()

# There is a character vector available in base R called state.abb giving 
# the two digit postal abbreviations for the 50 US States. Write a function 
# which asks for an abbreviation and returns TRUE if it is an abbreviation 
# and FALSE otherwise.

askState <- function() {
  abr <- readline("Please enter a 2-letter state abbreviation to see if it exists: ")
  ans <- abr %in% state.abb
  return(ans)
}
askState()

# Repeat the previous question, but allow for cases where the user inputs 
# a different capitalization. For example, “CA”, “Ca”, and “ca” should all 
# return as TRUE.

askState <- function() {
  abr <- readline("Please enter a 2-letter state abbreviation to see if it exists: ")
  ans <- toupper(abr) %in% state.abb
  return(ans)
}
askState()

# R provides another vector of state names as a vector called state.name. 
# The elements line up with the abbreviations; for example, element 33 of 
# the abbreviations is “NC” and element 33 of the names is “North Carolina”. 
# Write a function which asks for an abbreviation and returns the 
# corresponding state name. If there is none, return the string “error”.”

askState2 <- function() {
  abr <- readline("Please enter a 2-letter state abbreviation to see the state: ")
  abr <- toupper(abr)
  ans <- abr %in% state.abb
  pos <- which(state.abb == abr)
  if (ans == FALSE) {
    return("This is not a valid 2-letter state abbreviation.")
  }
  else
    return(state.name[pos])
}
askState2()

# Finally, write a function which asks for either a state name or state 
# abbreviation. When given an abbreviation, it returns the state name, and 
# when given a name it returns the state abbreviation. If there is no match 
# to either it returns the string “error”

simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}

askState3 <- function() {
  x <- readline("Please enter a 2-letter state abbreviation or state name: ")
  if (nchar(x) == 2) {
    abr <- toupper(x)
    ans <- abr %in% state.abb
    pos <- which(state.abb == abr)
    if (ans == FALSE) {
      return("This is not a valid 2-letter state abbreviation.")
    }
    else
      return(state.name[pos])
  }
  else 
    state <- simpleCap(x)
    ans2 <- state %in% state.name
    pos2 <- which(state.name == state)
    if (ans2 == FALSE) {
      return("This is not a valid US state name.")
    }
    else
      return(state.abb[pos2])
}
askState3()

# The object state.x77 is a matrix that gives several summary statistics 
# for each of the 50 US States from 1977. Calculate the number of high 
# school graduates in each state, and sort from highest to lowest.

ans <- sort(state.x77[,1]*state.x77[,6])
ans

# Calculate the number of high school graduate per square mile in each state.

ans <- sort(round((state.x77[,1]*state.x77[,6])/state.x77[,8], 2))
ans

# Ask the user to provide a state abbreviation, and return the number of 
# high school graduates in that state in 1977.

askState4 <- function() {
  abr <- readline("Please enter a 2-letter state abbreviation to see the number of HS grads in 1977: ")
  abr <- toupper(abr)
  ans <- abr %in% state.abb
  pos <- which(state.abb == abr)
  if (ans == FALSE) {
    return("This is not a valid 2-letter state abbreviation.")
  }
  else
    state <- state.name[pos]
    grads <- state.x77[,1]*state.x77[,6]
    return(grads[state])
}
askState4()

# Now, print a vector of the state names from the highest illiteracy rate 
# to the lowest illiteracy rate. Hint: The state names are given as rownames.

ans <- rownames(state.x77)[order(-state.x77[,3])]
ans

# Construct a data frame with ten rows and three columns: Illiteracy,
# Life_expectancy, Murder, and HS_grad. Each column gives the names of 
# the worst 10 state names. Hint: some measures are good when they are 
# high and others are good when the are low. You will need to take account 
# of these.

index <- order(state.x77[,3], decreasing = TRUE)[1:10]
illiteracy <- rownames(state.x77)[index]

index <- order(state.x77[,4])[1:10]
life_exp <- rownames(state.x77)[index]

index <- order(state.x77[,5], decreasing = TRUE)[1:10]
murder <- rownames(state.x77)[index]

index <- order(state.x77[,6])[1:10]
hs_grad <- rownames(state.x77)[index]

df <- data.frame(illiteracy, life_exp, murder, hs_grad, 
                 stringsAsFactors = FALSE)
df

# Using vector notation, print the state names which are in both the top 10 
# for illiteracy and top 10 for murder rates in 1977.

last_df <- df #from question above

ans <- last_df$illiteracy[which(last_df$illiteracy %in% last_df$murder)]

# There are several other small datasets contained within the base installation 
# of R. One of these is the Titanic dataset, accessed by the object Titanic. 
# The format is a bit strange at first, but can be converted to a data frame 
# with the following code:

ti <- as.data.frame(Titanic)
  
# It has a row for each combination of Class, Sex, Age, and Survival flag, 
# along with a frequency count (see ?Titanic for more information). 
# Write a function which asks the user to input a Class category 
# (either “1st”, “2nd”, “3rd”, or “Crew”) and prints the total survival and 
# death counts for that category.

ti <- as.data.frame(Titanic)

askTi <- function() {
  cls <- readline("Please input a class category (e.g. 1st, 2nd, 3rd, or Crew): ")
  tiSet <- ti[ti$Class == cls,]
  dead <- sum(tiSet$Freq[tiSet$Survived == "No"])
  alive <- sum(tiSet$Frew[tiSet$Survived == "Yes"])
  print(paste("Total Deaths:", dead))
  print(paste("Total Survived:", alive))
}

askTi()

# Take the titanic dataset and again ask the user to select a class. Write 
# the subset of the data from this class and save it as a comma separated 
# value file named “titanicOutput.csv” in the current working directory. Print 
# to the user the full path of the created file.

ti <- as.data.frame(Titanic)

askTi <- function() {
  cls <- readline("Please input a class category (e.g. 1st, 2nd, 3rd, or Crew): ")
  tiSet <- ti[ti$Class == cls,]
  write.csv(tiSet, "titanicOutput.csv")
  print(paste("Saved output to ", getwd(), "/titanicOutput.csv", sep = ""))
}  

askTi()

# Ask the user for the working directory where the previous command was run. 
# Set the working directory to this location, read the titanic dataset into 
# R and return it.

askWD <- function() {
  wd <- readline("Please input the working directory for Titantic subset: ")
  setwd(wd)
  ti2 <- read.csv("titanicOutput.csv")
  return(ti2)
}
askWD()

# Repeat the previous question, but instead print the passenger Class for 
# which the file “titanicOutput.csv” was saved.

askWD <- function() {
  wd <- readline("Please input the working directory for Titantic subset: ")
  setwd(wd)
  ti2 <- read.csv("titanicOutput.csv", as.is = TRUE)
  return(paste("You saved data from the class:", ti2$Class[1]))
}
askWD()

# R provides another dataset called WorldPhones giving the number of telephones 
# in seven world regions, in thousands, for the years 1951, 1956, 1957, 1958, 
# 1959, 1960, and 1961. Calculate the percentage change in number of phones for 
# each region between 1951 and 1961. Use vector notation, do not do each region 
# by hand! Hint: Percentage change is (new value − old value)/old value.

ans <- round((WorldPhones[7,] - WorldPhones[1,])/(WorldPhones[1,]) * 100, 2)
ans

# Ask the user for a year between 1951 and 1961. Return the number of phones 
# in Europe for the year closest, but not after, the input year.

askPhone <- function() {
  yr <- readline("Please enter a year between 1951 and 1961: ")
  if (as.numeric(yr) < 1956) {
    return(paste("There were", WorldPhones[1,2], "phones in Europe."))
  }
  else return(paste("There were", WorldPhones[yr,2], "phones in Europe."))
}
askPhone()
