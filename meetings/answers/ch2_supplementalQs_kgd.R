# Excerpt From: Taylor Arnold and Lauren Tilton, _Humanities Data in R_ 
# Chapter 2 Supplemental Questions

# 1. Ask for a positive number and return a vector of all the numbers 
# between 1 and the input.

posNum <- function(){
  z<- readline("Enter a positive number: ")
  z<- as.numeric(z)
  vec<- 1:z
  return(vec)
}

posNum()

# 2. Ask for a number and return a vector of all the even numbers 
# between 1 and the input.
posEven <- function(){
  z<- readline("Enter a positive number: ")
  z<- as.numeric(z)
  vec<- 1:z
  return(vec[c(FALSE,TRUE)])
}

posEven()

# 3. Ask for a positive integer n. Return the sum: 1 + 1∕2 + 1∕3 + 1∕4 + ⋯ + 1∕n.

posSum <- function(){
  z<- readline("Enter a positive number: ")
  z<- as.numeric(z)
  vec<- 1:z
  vec2<- 1 / vec
  return(sum(vec2))
}

posSum()

# 4. Ask for the total of a bill and return the amount of a 15% tip. 
# The round function is useful for cleaning up the result to an even penny.

tip <- function(){
  z<- readline("What is your bill ammount? ")
  z<- as.numeric(z)
  y<- (round(.15*z,digits=2))
  print(paste("A 15% tip would be ",y,".", sep=""))
}

tip()

# 5. Ask for a user’s birth year and print the age they will turn this year. 
# You can write the current year directly without trying to determine it 
# externally (it is possible to determine the current year, but was not 
# covered in Chap.2).

age <- function(){
  z<- readline("When were you born? ")
  z<- as.numeric(z)
  y=2017-z
  print(paste("You will turn ",y," this year.", sep=""))
}

age()

# 6. Write a function which asks for a number and determines if it is a 
# whole number (or not). Print a message displaying the result using print.

whole <- function(){
  z<- readline("Provide a number, and I'll figure out if it's a whole number or not! ")
  z<- as.numeric(z)
  if (z == round(z)) print("This is a whole number.")
  if (z != round(z)) print("This is not a whole number.")
}

whole()

# 7. The factorial of an integer is the product of all the positive integers 
# less than or equal to it. For example, the factorial of 4 is equal to 
# 4 ∗ 3 ∗ 2 ∗ 1 = 24. There is a function factorial() in base R for 
# calculating these. Ask for a number and return the factorial, without 
# using the R function. Hint: The function prod may be helpful.

factorial <- function(){
  z<- readline("Please provide a number:")
  z<- as.numeric(z)
  vec<- 1:z
  return(prod(vec))
}

factorial()

# 8. Ask the user for a number between 1 and 10 and return the corresponding 
# simple ordinal number. For example, 1 should be 1st, 2 should be 2nd, 
# and 4 should be 4th. Hint: You should not write 10 separate if statements. 
# Notice that the numbers 4–10 all have the same ending of “th”.

ordinal <- function(){
  z<- readline("Please provide a whole number between 1 and 10:")
  if (z==1)print (paste(z,"st",sep=""))
  if (z==2)print (paste(z,"nd",sep=""))
  if (z==3)print (paste(z,"rd",sep=""))
  if (z>3)print (paste(z,"th",sep=""))
}

ordinal()

# 9. Repeat the previous question, but allow the user to input any whole, 
# positive number. Hint: Keep the input as a character vector and make 
# use of the nchar and substr functions.

zero <- function(z){
  lastNum <- (substr(z, (nchar(z)), nchar(z)))
  if (lastNum==1)print (paste(z,"st",sep=""))
  if (lastNum==2)print (paste(z,"nd",sep=""))
  if (lastNum==3)print (paste(z,"rd",sep=""))
  if (lastNum>3)print (paste(z,"th",sep=""))
}

nonzero <- function(z){
  lastNum <- (substr(z, (nchar(z)-1), nchar(z)))
  num <- (substr(lastNum, 1, 1))
  if (num==1) print (paste(z,"th",sep=""))
  if (num!=1) zero (z)
}


ordinal <- function(){
  z<- readline("Please provide any whole number:")
  num <-nchar(z)
  if (num==1) zero(z)
  if (num>1) nonzero(z)
}

ordinal()

# 10. There is a character vector available in base R called state.abb giving 
# the two digit postal abbreviations for the 50 US States. Write a function 
# which asks for an abbreviation and returns TRUE if it is an abbreviation 
# and FALSE otherwise.

stateAbb <- function(){
  z<- readline("Please provide a state abbreviation:")
  if ((z %in% state.abb) == TRUE) return ("That is a state abbreviation.")
  if ((z %in% state.abb) != TRUE) return ("That is not a state abbreviation.")
}

stateAbb()

# 11. Repeat the previous question, but allow for cases where the user inputs 
# a different capitalization. For example, “CA”, “Ca”, and “ca” should all 
# return as TRUE.

stateAbb <- function(){
  z<- readline("Please provide a state abbreviation:")
  y<- toupper(z)
  if ((y %in% state.abb) == TRUE) return ("That is a state abbreviation.")
  if ((y %in% state.abb) != TRUE) return ("That is not a state abbreviation.")
}

stateAbb()

# 12. R provides another vector of state names as a vector called state.name. 
# The elements line up with the abbreviations; for example, element 33 of 
# the abbreviations is “NC” and element 33 of the names is “North Carolina”. 
# Write a function which asks for an abbreviation and returns the 
# corresponding state name. If there is none, return the string “error”.”

stateAbb <- function(){
  z<- readline("Please provide a state abbreviation:")
  y<- toupper(z)
  state<- state.name[y == state.abb]
  if ((y %in% state.abb) == TRUE) return (state)
  if ((y %in% state.abb) != TRUE) return ("error")
}

stateAbb()

# 13. Finally, write a function which asks for either a state name or state 
# abbreviation. When given an abbreviation, it returns the state name, and 
# when given a name it returns the state abbreviation. If there is no match 
# to either it returns the string “error”

stateName <- function () {
  z<- readline ("Please provide a state name OR abbreviation:")
  num <-nchar(z)
  if (num==2){
    y<-toupper(z)
    state<- state.name[y==state.abb]
    if ((y %in% state.abb)==TRUE) return (state)
    else return ("error")
  }
  else{
    state<-state.abb[z==state.name]
    if ((z %in% state.name)==TRUE) return (state)
    else return ("error")
  }
}

stateName()

# 14. The object state.x77 is a matrix that gives several summary statistics 
# for each of the 50 US States from 1977. Calculate the number of high 
# school graduates in each state, and sort from highest to lowest.

state<- data.frame(state.x77)
state$Number.of.Grads <- round(state$Population*state$HS.Grad,0)
HSgrad<- order(state$Number.of.Grads, decreasing = TRUE)
state[HSgrad,]

# 15. Calculate the number of high school graduate per square mile in each state.

state$GradperSM <- state$Number.of.Grads/state$Area
state

# 16. Ask the user to provide a state abbreviation, and return the number of 
# high school graduates in that state in 1977.

grad <- function(){
  z<- readline("Please provide a state abbreviation:")
  state<- state.abb[z == state.name]
  y<-toupper(z)
  if ((y %in% state.abb) == TRUE) {
    pos<-which(state.abb==y)
    stateName<- state.name[y==state.abb]
    stateGrads<- round(state.x77[pos,6]*state.x77[pos,1],0)
    print(paste(stateName," has ",stateGrads," High School Graduates",sep=""))
  }
  else return ("error")
}

grad ()

# 17. Now, print a vector of the state names from the highest illiteracy rate 
# to the lowest illiteracy rate. Hint: The state names are given as rownames.

illiteracy <- rownames(state)[order(state$Illiteracy,decreasing=TRUE)]
illiteracy

# 18. Construct a data frame with ten rows and three columns: Illiteracy,
# Life_expectancy, Murder, and HS_grad. Each column gives the names of 
# the worst 10 state names. Hint: some measures are good when they are 
# high and others are good when the are low. You will need to take account 
# of these.

illiteracy <- rownames(state)[order(state$Illiteracy,decreasing=TRUE)]
Life_expectancy <- rownames(state)[order(state$Life.Exp)]
Murder <- rownames(state)[order(state$Murder,decreasing=TRUE)]
HS_grad <- rownames(state)[order(state$HS.Grad)]
worst_States<- data.frame(Illiteracy=illiteracy [1:10], Life_expectancy=Life_expectancy[1:10], Murder=Murder[1:10], HS_grad=HS_grad[1:10], stringsAsFactors = FALSE)
worst_States

# 19. Using vector notation, print the state names which are in both the top 10 
# for illiteracy and top 10 for murder rates in 1977.

illit_murder<- worst_States$Illiteracy[which(worst_States$Illiteracy %in% worst_States$Murder)]
illit_murder

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


deaths <- function(){
  z<- readline("Please choose a category of portage (1st, 2nd, 3d, or Crew):")
  d<- sum(ti[ti$Class==z & ti$Survived=="No",]$Freq)
  s<- sum(ti[ti$Class==z & ti$Survived=="Yes",]$Freq)
  print(paste("There were ",d," deaths and ",s," survivors in the ",z," category",sep=""))
}

deaths ()

# 21. Take the titanic dataset and again ask the user to select a class. Write 
# the subset of the data from this class and save it as a comma separated 
# value file named “titanicOutput.csv” in the current working directory. Print 
# to the user the full path of the created file.

tiSub <- function(){
  z<- readline("Please choose a category of portage (1st, 2nd, 3d, or Crew):")
  subset<- ti[ti$Class==z,]
  write.csv(x=subset,file="titanicSubset.csv")
  print(paste("Your file has been saved to: ",getwd(),"/titanicSubset.csv",sep=""))
}

tiSub ()

# 22. Ask the user for the working directory where the previous command was run. 
# Set the working directory to this location, read the titanic dataset into 
# R and return it.

tiSubRead <- function(){
  ask<- readline ("Please input the directory your file just saved to:")
  setwd(ask)
  tiRead<- read.csv("titanicSubset.csv",as.is=TRUE)
  tiRead
}

tiSubRead()

# 23. Repeat the previous question, but instead print the passenger Class for 
# which the file “titanicOutput.csv” was saved.

tiSubRead <- function(){
  ask<- readline ("Please input the directory your file just saved to:")
  setwd(ask)
  tiRead<- read.csv("titanicSubset.csv",as.is=TRUE)
  class<- tiRead[1,"Class"]
  print(paste("The portage class for this data set is: ",class,sep=""))
}

tiSubRead()

# 24. R provides another dataset called WorldPhones giving the number of telephones 
# in seven world regions, in thousands, for the years 1951, 1956, 1957, 1958, 
# 1959, 1960, and 1961. Calculate the percentage change in number of phones for 
# each region between 1951 and 1961. Use vector notation, do not do each region 
# by hand! Hint: Percentage change is (new value − old value)/old value.

change<- (WorldPhones[7,]-WorldPhones[1,])/WorldPhones[1,]
change

# 25. Ask the user for a year between 1951 and 1961. Return the number of phones 
# in Europe for the year closest, but not after, the input year.

WorldPhones
phones <- function(){
  year<- readline ("Please provide a year between 1951 and 1961:")
  if (year%in% 1951:1955){
    num<- WorldPhones[1,2]*1000
    print(paste("There were ",num," phones in Europe in ",year,".",sep=""))
  }
  else {
    num<- WorldPhones[year,2]*1000
    print(paste("There were ",num," phones in Europe in ",year,".",sep=""))
  }
}

phones()
