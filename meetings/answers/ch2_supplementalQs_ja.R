# Excerpt From: Taylor Arnold and Lauren Tilton, _Humanities Data in R_
# Chapter 2 Supplemental Questions

# Please answer as many of the following questions as you can, BUT FOCUS ON
# questions 1, 4, 8, 10, 11, 12, 14, 16, 18, and 24. For a bonus (!), try
# your hand at questions 9 and 19, in particular!

# 1. Ask for a positive number and return a vector of all the numbers
# between 1 and the input.

userNumVec <- function()
{
  n <- readline("Please enter a positive integer: ")
  n <- as.integer(n)
  numVec <- 1:n
  return(numVec)
}
userNumVec()

# 2. Ask for a number and return a vector of all the even numbers
# between 1 and the input.

userEvenNum <- function()
{
  n <- readline("Please enter a positive integer: ")
  n <- as.integer(n)
  halfn <- round((n-1)/2)
  halfVec <- 1:halfn
  evenVec <- 2*halfVec
  return(evenVec)
}
userEvenNum()

# 3. Ask for a positive integer n. Return the sum: 1 + 1∕2 + 1∕3 + 1∕4 + ⋯ + 1∕n.

userSum <- function()
{
  n <- readline("Please enter a positive integer: ")
  n <- as.integer(n)
  sum <- 0
  for (i in 1:n)
  {
    sum <- sum + 1/i
  }
  return(sum)
}
userSum()

# 4. Ask for the total of a bill and return the amount of a 15% tip.
# The round function is useful for cleaning up the result to an even penny.

FindTip <- function()
{
  b <- readline("Please enter total bill: ")
  b <- as.integer(b)
  tip <- round(0.15*b, digits = 2)
  return(tip)
}
FindTip()

# 5. Ask for a user’s birth year and print the age they will turn this year.
# You can write the current year directly without trying to determine it
# externally (it is possible to determine the current year, but was not
# covered in Chap.2).

FindAge <- function()
{
  y <- readline("Please enter your birth year: ")
  y <- as.integer(y)
  age <- 2017-y
  return(age)
}
FindAge()

# 6. Write a function which asks for a number and determines if it is a
# whole number (or not). Print a message displaying the result using print.

integerCheck <- function()
{
  n <- readline("Please enter a number: ")
  num <- as.numeric(n)
  if (round(num) == num) {
    print(paste(n, "is a whole number."))
  }
  else {
    print(paste(n, "is not a whole number."))
  }
}

integerCheck()

# 7. The factorial of an integer is the product of all the positive integers
# less than or equal to it. For example, the factorial of 4 is equal to
# 4 ∗ 3 ∗ 2 ∗ 1 = 24. There is a function factorial() in base R for
# calculating these. Ask for a number and return the factorial, without
# using the R function. Hint: The function prod may be helpful.

Fact <- function()
{
  n <- readline("Please enter a number: ")
  n <- as.numeric(n)
  product <- 1
  for (i in 1:n)
  {
    product <- i*product
  }
  return(product)
}
Fact()

# 8. Ask the user for a number between 1 and 10 and return the corresponding
# simple ordinal number. For example, 1 should be 1st, 2 should be 2nd,
# and 4 should be 4th. Hint: You should not write 10 separate if statements.
# Notice that the numbers 4–10 all have the same ending of “th”.

# 9. Repeat the previous question, but allow the user to input any whole,
# positive number. Hint: Keep the input as a character vector and make
# use of the nchar and substr functions.

OrdNumber <- function()
{
  n <- readline("Please enter an integer: ")
  num <- as.numeric(n)
  fstEnd <- c("st", "nd", "rd")
  lastDigit <- num - 10*floor(num/10)
  lastTwoDigits <- num - 100*floor(num/100)
  if ( (lastDigit %in% c(1,2,3)) & !(lastTwoDigits %in% c(11,12,13)) ) {
    indexOrd <- grep(lastDigit, c(1,2,3))
    return(paste(n,fstEnd[indexOrd], sep =""))
  }
  else {
    return(paste(n,"th", sep =""))
  }
}
OrdNumber()

# 10. There is a character vector available in base R called state.abb giving
# the two digit postal abbreviations for the 50 US States. Write a function
# which asks for an abbreviation and returns TRUE if it is an abbreviation
# and FALSE otherwise.

# 11. Repeat the previous question, but allow for cases where the user inputs
# a different capitalization. For example, “CA”, “Ca”, and “ca” should all
# return as TRUE.

ST <- function()
{
  state <- readline("Please eneter a two-letter state abbreviation: ")
  appears <- toupper(state) %in% state.abb
  return(appears)
}
ST()

# 12. R provides another vector of state names as a vector called state.name.
# The elements line up with the abbreviations; for example, element 33 of
# the abbreviations is “NC” and element 33 of the names is “North Carolina”.
# Write a function which asks for an abbreviation and returns the
# corresponding state name. If there is none, return the string “error”.”

STtoName <- function()
{
  state <- readline("Please eneter a two-letter state abbreviation: ")
  appears <- toupper(state) %in% state.abb
  if(appears == "TRUE") {
    index <- grep(toupper(state), state.abb)
    return(state.name[index])
  } else {
    return("error")
  }
}

STtoName()

# 13. Finally, write a function which asks for either a state name or state
# abbreviation. When given an abbreviation, it returns the state name, and
# when given a name it returns the state abbreviation. If there is no match
# to either it returns the string “error”

ConvertState <- function()
{
  state <- readline("Please eneter a state abbreviation or name: ")
  appearsAsAbb <- toupper(state) %in% state.abb
  if(appearsAsAbb == "TRUE") {
    index <- grep(toupper(state), state.abb)
    return(state.name[index])
  } else {
    firstLetterCap <- toupper(substr(state, start = 1, stop = 1))
    afterFirstLetter <- tolower(substr(state, start = 2, stop = nchar(state)))
    state <- paste(firstLetterCap, afterFirstLetter, sep = '')
    if(state %in% state.name) {
      index <- grep(state, state.name)
      return(state.abb[index])
    } else {
      return("error")
    }
  }
}

ConvertState()

# 14. The object state.x77 is a matrix that gives several summary statistics
# for each of the 50 US States from 1977. Calculate the number of high
# school graduates in each state, and sort from highest to lowest.



# 15. Calculate the number of high school graduate per square mile in each state.

# 16. Ask the user to provide a state abbreviation, and return the number of
# high school graduates in that state in 1977. [1970, according to info]

STtoHSGrads <- function()
{
  state <- readline("Please eneter a two-letter state abbreviation: ")
  appears <- toupper(state) %in% state.abb
  if(appears == "TRUE") {
    index <- grep(toupper(state), state.abb)
    return(HSGradsPerState[state.name[index]])
  } else {
    return("error")
  }
}
STtoHSGrads()

# 17. Now, print a vector of the state names from the highest illiteracy rate
# to the lowest illiteracy rate. Hint: The state names are given as rownames.

# 18. Construct a data frame with ten rows and three columns: Illiteracy,
# Life_expectancy, Murder, and HS_grad. Each column gives the names of
# the worst 10 state names. Hint: some measures are good when they are
# high and others are good when the are low. You will need to take account
# of these.

badStates <- function()
{
  state77Data <- state.x77
  IllIndex <- order(state77Data[ ,3], decreasing=TRUE)
  BadIllcyStates <- row.names(state77Data[IllIndex[1:10],])
  LEIndex <- order(state77Data[ ,4])
  BadLEStates <- row.names(state77Data[LEIndex[1:10],])
  MurderIndex <- order(state77Data[ ,5], decreasing=TRUE)
  BadMurderStates <- row.names(state77Data[MurderIndex[1:10],])
  HSIndex <- order(state77Data[ ,6])
  BadHSStates <- row.names(state77Data[HSIndex[1:10],])
  BadCombo <- data.frame(Illiteracy=BadIllcyStates,LifeExp=BadLEStates,Murder=BadMurderStates,HSGrad=BadHSStates)
  return(BadCombo)
}

badStates()


# 19. Using vector notation, print the state names which are in both the top 10
# for illiteracy and top 10 for murder rates in 1977.

badIllAndMurderStates <- function()
{
  state77Data <- state.x77
  IllIndex <- order(state77Data[ ,3], decreasing=TRUE)
  BadIllcyStates <- row.names(state77Data[IllIndex[1:10],])
  LEIndex <- order(state77Data[ ,4])
  BadLEStates <- row.names(state77Data[LEIndex[1:10],])
  MurderIndex <- order(state77Data[ ,5], decreasing=TRUE)
  BadMurderStates <- row.names(state77Data[MurderIndex[1:10],])
  HSIndex <- order(state77Data[ ,6])
  BadHSStates <- row.names(state77Data[HSIndex[1:10],])
  BadCombo <- data.frame(Illiteracy=BadIllcyStates,LifeExp=BadLEStates,Murder=BadMurderStates,HSGrad=BadHSStates)
  IllcyAndMurderIndex <- state.name %in% BadIllcyStates & state.name %in% BadMurderStates
  IllcyAndMurderCombo <- state.name[IllcyAndMurderIndex]
  return(IllcyAndMurderCombo)
}

badIllAndMurderStates()


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

titanicStats <- function()
{
  ti <- as.data.frame(Titanic)
  pClass <- readline("Please enter a Titanic passenger class (1st, 2nd, 3rd, or Crew): ")
  pClassIndex <- grep(pClass, c("1st","2nd","3rd","Crew"))
  died <- 0
  lived <- 0
  for (k in 0:3) {
    died <- died + ti[pClassIndex + 4*k,5]
  }
  for (k in 4:7) {
    lived <- lived + ti[pClassIndex + 4*k,5]
  }
  return(paste(as.character(lived),"passengers in", pClass,"class survived, and", as.character(died),"passengers died.", sep = " "))
}

titanicStats()

titanicStats2 <- function()
{
  ti <- as.data.frame(Titanic)
  pClass <- readline("Please enter a Titanic passenger class (1st, 2nd, 3rd, or Crew): ")
  indexSurvived <- ti$Class %in% c(pClass) & ti$Survived %in% c("Yes")
  lived <- sum(ti[indexSurvived,5])
  indexDied <- ti$Class %in% c(pClass) & ti$Survived %in% c("No")
  died <- sum(ti[indexDied,5])
  return(paste(as.character(lived),"passengers in", pClass,"class survived, and", as.character(died),"passengers died.", sep = " "))
}

titanicStats2()

# 21. Take the titanic dataset and again ask the user to select a class. Write
# the subset of the data from this class and save it as a comma separated
# value file named “titanicOutput.csv” in the current working directory. Print
# to the user the full path of the created file.

titanicClassData <- function()
{
  ti <- as.data.frame(Titanic)
  pClass <- readline("Please enter a passenger class (1st, 2nd, 3rd, or Crew): ")
  pClassData <- ti[ti$Class %in% c(pClass), ]
  write.csv(x = pClassData, file = "titanicOutput.csv")
  return("/Users/jeannealbert/Desktop/titanicOutput.csv")
}

titanicClassData()

# 22. Ask the user for the working directory where the previous command was run.
# Set the working directory to this location, read the titanic dataset into
# R and return it.

readDataFromFile <- function()
{
  userWD <- readline("Please enter a working directory: ")
  setwd(userWD)
  titanicFile <- read.csv(file = "titanicOutput.csv")
  return(titanicFile)
}

readDataFromFile()

# 23. Repeat the previous question, but instead print the passenger Class for
# which the file “titanicOutput.csv” was saved.

readDataFromFile2 <- function()
{
  userWD <- readline("Please enter a working directory: ")
  setwd(userWD)
  titanicFile <- read.csv(file = "titanicOutput.csv")
  return(titanicFile[1,2])
}

readDataFromFile2()


# 24. R provides another dataset called WorldPhones giving the number of telephones
# in seven world regions, in thousands, for the years 1951, 1956, 1957, 1958,
# 1959, 1960, and 1961. Calculate the percentage change in number of phones for
# each region between 1951 and 1961. Use vector notation, do not do each region
# by hand! Hint: Percentage change is (new value − old value)/old value.

# 25. Ask the user for a year between 1951 and 1961. Return the number of phones
# in Europe for the year closest, but not after, the input year.

phonesInEurope <- function()
{
  y <- readline("Please enter a year from 1951 to 1961: ")
  year <- as.integer(y)
  if(year < 1956) {
    
    numPhones <- as.character(1000*WorldPhones[1,2])
    return(paste("In 1951 there were", numPhones,"phones in Europe.", sep = " " ))
  }
  else {
    numPhones <- as.character(1000*WorldPhones[year-1954,2])
    return(paste("In", y,"there were", numPhones,"phones in Europe.", sep = " " ))
  }
}

phonesInEurope()

phonesInEurope2 <- function()
{
  y <- readline("Please enter a year from 1951 to 1961: ")
  year <- as.integer(y)
  if(year < 1956) {
    year <- 1955
    y <- as.character(1951)
  }
  numPhones <- as.character(1000*WorldPhones[year-1954,2])
  return(paste("In", y,"there were", numPhones,"phones in Europe.", sep = " " ))
}

phonesInEurope2()
