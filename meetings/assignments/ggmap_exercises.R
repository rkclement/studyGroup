# From http://amunategui.github.io/ggmap-example/
# NOTE if you are running OS X Yosemite or later, you will need a workaround to 
# get the xlsx package to load (because of dependency on rJava). See 
# https://stackoverflow.com/questions/30738974/rjava-load-error-in-rstudio-r-after-upgrading-to-osx-yosemite
# for workaround.

install.packages(c("RCurl", "xlsx", "zipcode", "ggmap", "ggplot2"))
library(RCurl)
library(ggmap)
library(xlsx)
library(zipcode)
library(ggplot2)

urlfile <-'http://www.psc.isr.umich.edu/dis/census/Features/tract2zip/MedianZIP-3.xlsx'
destfile <- "census20062010.xlsx"
download.file(urlfile, destfile, mode="wb")
census <- read.xlsx2(destfile, sheetName = "Median")

census <- census[c('Zip','Median..')]
names(census) <- c('Zip','Median')
census$Median <- as.character(census$Median)
census$Median <- as.numeric(gsub(',','',census$Median))
print(head(census,5))

data(zipcode)
census$Zip <- clean.zipcodes(census$Zip)

census <- merge(census, zipcode, by.x='Zip', by.y='zip')

map<-get_map(location='united states', zoom=4, maptype = "terrain",
             source='google',color='color')

ggmap(map) + geom_point(
  aes(x=longitude, y=latitude, show_guide = TRUE, colour=Median), 
  data=census, alpha=.5, na.rm = T)  + 
  scale_color_gradient(low="beige", high="blue")