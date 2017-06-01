# Ryan's notes from: Taylor Arnold and Lauren Tilton, _Humanities Data in R_ 
# Chapter 7 Geospatial Data

install.packages("snippets","http://rforge.net/")
install.packages("maptools")
install.packages("sp")
install.packages("rgdal")
install.packages("rgeos")

library(snippets)
library(maptools)
library(sp)
library(rgdal)
library(rgeos)
library(ggplot2)

setwd("~/Google Drive/MiddleburyDataStudyGroup/humanitiesDataInR/data/ch07")

berlin <- read.csv("berlinBorderCrossing.csv", as.is = TRUE)
berlin

# simple lat/lon plot
cityCenterID <- c(1:6, 8)
plot(berlin$Longitude[cityCenterID],
     berlin$Latitude[cityCenterID],
     pch = 19,
     axes = FALSE,
     xlim = range(berlin$Longitude[cityCenterID]))
text(berlin$Longitude[cityCenterID],
     berlin$Latitude[cityCenterID],
     labels = berlin$Crossing[cityCenterID],
     pos = 4,
     col = "blue")


# with osmap() from snippets library
cityCenterID <- c(1:6, 8)
plot(berlin$Longitude[cityCenterID],
     berlin$Latitude[cityCenterID],
     pch = 19,
     axes = FALSE,
     xlim = range(berlin$Longitude[cityCenterID]))
osmap()
points(x = berlin$Longitude[cityCenterID],
       y = berlin$Latitude[cityCenterID],
       pch = 19)

# with aspect ratio corrected - note that code from book is not quite correct
cityCenterID <- c(1:6, 8)
plot(berlin$Longitude[cityCenterID],
     berlin$Latitude[cityCenterID],
     pch = 19,
     axes = FALSE,
     asp = 1/abs(cos(berlin$Latitude[1] * pi/180)),
     xlim = range(berlin$Longitude) + c(0, 0.1))
osmap()
points(x = berlin$Longitude[cityCenterID],
       y = berlin$Latitude[cityCenterID],
       pch = 19,
       col = "red")

# using different tilset from Stamen Design - note URL in book has changed
cityCenterID <- c(1:6, 8)
plot(berlin$Longitude[cityCenterID],
     berlin$Latitude[cityCenterID],
     pch = 19,
     axes = FALSE,
     asp = 1/abs(cos(berlin$Latitude[1] * pi/180)),
     xlim = range(berlin$Longitude[cityCenterID]) + c(0, 0.1))
osmap(tiles.url = "http://tile.stamen.com/toner/")
points(x = berlin$Longitude[cityCenterID],
       y = berlin$Latitude[cityCenterID],
       pch = 19,
       col = "red")

# plotting the full dataset
plot(berlin$Longitude,
     berlin$Latitude,
     pch = 19,
     axes = FALSE,
     asp = 1/abs(cos(berlin$Latitude[1] * pi/180)),
     xlim = range(berlin$Longitude) + c(0, 0.1))
osmap(tiles.url = "http://tile.stamen.com/toner/")
points(x = berlin$Longitude,
       y = berlin$Latitude,
       pch = 19,
       col = "red")

# reading in a shapefile using sp and maptools packages
# NOTE: code in book doesn't work!
state <- readOGR("data/ch07/State_2010Census_DP1")
class(state)
dim(state)

# to remove Alaska and Hawaii
index <- (as.data.frame(state)$STUSPS10 %in% c("AK", "HI"))
state <- state[!index,]
dim(state)

# basic spatial plot of contiguous US + Puerto Rico
plot(state)

# dealing with projections
# proj4string() finds the projection of the object, you can then "assign" a 
# projection to it - NOT RECOMMENDED, use spTransform() instead.
projectionObj <- CRS(projargs = "+proj=longlat")
proj4string(state) <- projectionObj

stateTrans <- spTransform(x = state, CRSobj = CRS("+proj=utm +zone=14"))
plot(stateTrans)

# finding centroids of new transformed projection. NOTE: book doesn't have you
# install rgeos library, which is necessary for the gCentroid() function
centroid <- gCentroid(spgeom=stateTrans, byid=TRUE)
head(centroid)

# adding labels to the states, positioned at the centroids
text(x = centroid$x,
     y = centroid$y,
     label=as.data.frame(stateTrans)$NAME10,
     cex = 0.7)

# visualizing census data in our projected map

# first, convert data from spatial data to a data frame
stateTransData <- as.data.frame(state)

# calculate ratio of "seasonal, recreational, or occasional" homes to total 
# homes and convert to quantized binIDs (finding which bin each state falls in)
perHouseRec <- stateTransData$DP0180008 / stateTransData$DP0180001
bins <- quantile(perHouseRec, seq(0, 1 , length.out = 8))
binId <- findInterval(perHouseRec, bins)

# scale the bins to a factor of 5 (to make plot more legible) and add as an 
# extra parameter to plot()
densityVals <- seq_len(length(bins)) * 5
plot(stateTrans, density = densityVals[binId])

# load US Federal Government documentary photographer dataset, remove rows with
# missing geospatial information
photos <- read.csv("data/ch07/photoDatasetAllRaw.csv", as.is = TRUE)
photos <- photos[!is.na(photos$latitude) & 
                 !is.na(photos$longitude) & 
                 !is.na(photos$pname),]
pnameSet <- names(sort(table(photos$pname), TRUE))[1:20]
photos <- photos[photos$pname %in% pnameSet,]
head(photos)

# convert photos into a spatial points dataset
photos_pts <- SpatialPointsDataFrame(coords = cbind(photos$longitude, 
                                                    photos$ latitude),
                                     data = photos)

# read in county shapefiles from 2010 Census; again book is incorrect
cnty <- readOGR("data/ch07/County_2010Census_DP1")

# must set projection for photos_pts to be identical to cnty
proj4string(photos_pts) <- CRS(projargs = "+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0")

# combine cty and photos_pts
joinedDataF <- over(x = photos_pts,y = cnty)

# construct a boxplot of population density for photographer locations
joinedDataF$popDen <- joinedDataF$DP0010001 / joinedDataF$ALAND10
joinedDataF$popDen <- joinedDataF$popDen * 1000^2
medianPerc <- tapply(joinedDataF$popDen, photos$pname, median, na.rm = TRUE)
index <- order(medianPerc)
joinedDataF$pnameFactor <- factor(photos$pname, 
                                  levels = names(medianPerc)[index])
# could not get this to work!!
boxplot(joinedDataF$pnameFactor, log(joinedDataF$popDen),
        horizontal = FALSE, col = "grey")

# so used ggplot2 instead :)
ggplot(joinedDataF, aes(x = pnameFactor, y = log(popDen))) + 
  geom_boxplot() + coord_flip()