# Excerpt From: Taylor Arnold and Lauren Tilton, _Humanities Data in R_ 
# Chapter 3 Supplemental Questions

par(mfrow=c(1,1))

# 26. The dataset iris is a very well-known statistical data from the 1930s. It
# gives several measurements of iris sepal and petal lengths (in centimeters)
# for three species. Construct a table of sepal length rounded to the nearest
# centimeter versus Species.

iris

tab<- table(round(iris$Sepal.Length),iris$Species)
tab

# 27. Construct the same table, but rounded to the nearest half centimeter.

tab<- table(round(iris$Sepal.Length/.5)*.5,iris$Species)
tab

# 28. Plot a histogram of the sepal length for the entire iris dataset.

hist(iris$Sepal.Length)

# 29. Replicate the previous histogram, but manually specify the break points for
# the histogram and add a custom title and axis labels.

hist(iris$Sepal.Length, breaks=4:8,xlab="Length in cm",ylab="Freq",main="Iris Sepal Length")
#OR
hist(iris$Sepal.Length, breaks=seq(4,8,.5),xlab="Length in cm",ylab="Freq",main="Iris Sepal Length")


# 30. Plot three histograms showing the sepal length separately for each species.
# Make sure the histograms use the same break points for each plot (Hint: use
# the same as manually set in the previous question). Add helpful titles for the
# plots, and make sure to set R to display three plots at once.

par(mfrow=c(1,3))
hist(iris$Sepal.Length[iris$Species=="setosa"], breaks=seq(4,8,.5),xlab="Length in cm",ylab="Freq",main="Setosa Iris Sepal Length")
hist(iris$Sepal.Length[iris$Species=="versicolor"], breaks=seq(4,8,.5),xlab="Length in cm",ylab="Freq",main="Versicolor Iris Sepal Length")
hist(iris$Sepal.Length[iris$Species=="virginica"], breaks=seq(4,8,.5),xlab="Length in cm",ylab="Freq",main="Virginica Iris Sepal Length")
par(mfrow=c(1,1))

# 31. Calculate the deciles of the petal length for the entire iris dataset.

quantile(iris$Petal.Length, prob=(0:10)/10)

# 32. Construct a table showing the number of samples from each species with 
# petal length in the top 30 % of the dataset. How well does this help 
# categorize  the dataset by species?

petal<-quantile(iris$Petal.Length, prob=0.70)
top30petal<-table(iris$Species,petal>iris$Petal.Length)
top30petal

#It shows that Setosa and Versicolor have wingspans on the larger end of the
#spectrum.

# 33. Now bin the iris dataset into deciles based on the petal length. Produce a 
# table by species. How well does this categorize the dataset by species?

petalBreaks<- quantile(iris$Petal.Length, prob=seq(0,1,length.out = 11),
                       names=FALSE)
petalBin<-cut(iris$Petal.Length,petalBreaks,labels=FALSE,include.lowest=TRUE)
petalBinTab<-table(iris$Species,petalBin)
petalBinTab


# 34. We can get a very rough estimate of the petal area by multiplying the 
# petal length and width. Calculate this area, bin the dataset into deciles on 
# area,  and compute table of the petal length deciles against the area deciles. 
# How  similar do these measurements seem?

iris$Petal.Area<-iris$Petal.Length*iris$Petal.Width
areaBreaks<- quantile(iris$Petal.Area, prob=seq(0,1,length.out = 11),
                    names=FALSE)
areaBin<-cut(iris$Petal.Area,areaBreaks,labels=FALSE,include.lowest=TRUE)
irisTab<-table (petalBin , areaBin)
irisTab2<-table(iris$Species, areaBin)
irisTab
irisTab2

# 35. Without using a for loop, construct a vector with the median petal length 
# for each species. Add appropriate names to the output.

mplSetosa <- quantile(iris$Petal.Length [iris$Species=="setosa"], prob=0.50, 
                      names=FALSE)
mplVersicolor <- quantile(iris$Petal.Length [iris$Species=="versicolor"], 
                          prob=0.50, names=FALSE)
mplVirginica <- quantile(iris$Petal.Length [iris$Species=="virginica"], 
                         prob=0.50, names=FALSE)
mpl<- c(mplSetosa, mplVersicolor, mplVirginica)
names(mpl)<- c("Setosa", "Versicolor", "Verginica")
mpl

# 36. Repeat the previous question using a for loop.

species<-unique(iris$Species)
mpl2<- rep(0,length=3)
for (i in 1:3){
  mpl2[i]<-quantile(iris$Petal.Length [iris$Species==species[i]], 
                    prob=0.50, names=FALSE)
}
names(mpl2)<-species
mpl2

# 37. Finally, repeat again using tapply.

mpl3<- tapply(X=iris$Petal.Length,INDEX = iris$Species,FUN=quantile, 
              prob=0.50, names=FALSE)
mpl3

# 38. As in a previous question, write a function which asks the user for a 
# state abbreviation and returns the state name. However, this time, put the 
# question in a for loop so the user can decode three straight state 
# abbreviations.

ask <- function(){
  for (i in 1:3) {
  z<- readline("Please provide a state abbreviation:")
  y<- toupper(z)
  state<- state.name[y == state.abb]
  if ((y %in% state.abb) == TRUE) print (state)
  if ((y %in% state.abb) != TRUE) print ("error")
  }
}

ask()

# 39. The command break immediately exits a for loop; it is often used inside
# of an if statement. Redo the previous question, but break out of the loop
# when a non-matching abbreviation is given. You can increase the number of
# iterations to something large (say, 100), as a user can always get out of the
# function by giving a non-abbreviation.

ask <- function(){
  for (i in 1:1000) {
    z<- readline("Please provide a state abbreviation:")
    y<- toupper(z)
    state<- state.name[y == state.abb]
    if ((y %in% state.abb) == TRUE) print (state)
    if ((y %in% state.abb) != TRUE) break
  }
}

ask()

# 40. Now, reverse the process so that the function returns when an abbreviation 
# is found but asks again if it is not.

ask <- function(){
  for (i in 1:1000) {
    z<- readline("Please provide a state abbreviation:")
    y<- toupper(z)
    state<- state.name[y == state.abb]
    if ((y %in% state.abb) == TRUE) {
      print (state)
      break
    }
    if ((y %in% state.abb) != TRUE) print ("That is not a state abbreviation.")
  }
}

ask()



# 41. Using a for loop, print the sum 1+1/2+1/3+1/4 + ··· + 1/n for all n
# equal to 1 through 100.

for (i in 1:100){
  print(sum(1/1:i))
}


# 42. Now calculate the sum for all 100 values of n using a single function call.

sumAnswer<- function(){
  arr<-rep(0,length=100)
  for (i in 1:100){
    arr[i]<-(sum(1/1:i))
    }
  sumArr<-sum(arr)
  sumArr
}

sumAnswer()


# 43. Ask the user for their year of birth and print out the age they turned for 
# every year between then and now.

age <- function(){
  z<- readline("When were you born? ")
  z<- as.numeric(z)
  currentAge<- 0:(2017-z)
  year<-(z:2017)
  for(i in 1:(2018-z)){
    print(paste("You turned ",currentAge[i]," in ", year[i] , ".",sep=""))
  }
}

age()

# 44. The dataset InsectSprays shows the count of insects after applying one of
# six different insect repellents. Construct a two-row three-column grid of 
# histograms, on the same scale, showing the number of insects from each spray.
# Do this using a for loop rather than coding each plot by hand.

InsectSprays

par(mfrow=c(2,3))
spray<-unique(InsectSprays$spray)
for (i in 1:length(spray)) {
  hist(InsectSprays$count[InsectSprays$spray==spray[i]],breaks=0:30,
       ylim=range(0,6))
}


# 45. Repeat the same two by three plot, but now remove the margins, axes, and
# labels. Replace these by adding the spray identifier (a single letter) to the 
# plot with the text command.

par(mfrow=c(2,3), mar=c(1,1,1,1))
spray<-unique(InsectSprays$spray)
for (i in 1:length(spray)) {
  hist(InsectSprays$count[InsectSprays$spray==spray[i]],breaks=0:30,
       ylim=range(0,6), main=spray[i], xlab="", ylab="",axes=FALSE)
}

# 46. Calculate the median insect count for each spray.

for (i in 1:length(spray)) {
  med<-quantile(InsectSprays$count[InsectSprays$spray==spray[i]],
                prob=0.50, names=FALSE)
  print(paste("Spray ",spray[i]," median= ",med,sep=""))
}

# 47. Using the WorldPhones dataset, calculate the total number of phones used
# in each year using a for loop.

year<-row.names(WorldPhones)
for(i in 1:nrow(WorldPhones)){
  total<-sum(WorldPhones[row.names(WorldPhones)==year[i]])
  print(paste("Total phones in ",year[i],"= ",total))
}


# 48. Calculate the total number of phones used in each year using a single 
# apply function.

apply(WorldPhones,1,sum)

# 49. Calculate the percentage of phones that were in Europe over the years in
# question.

100*WorldPhones[,2]/apply(WorldPhones, 1, sum)

# 50. Convert the entire WorldPhones matrix to percentages; in other words, each
# row should sum to 100.

100*WorldPhones/apply(WorldPhones, 1, sum)
