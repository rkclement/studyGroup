---
title: Notes for Chapter 3 Code
author: Ryan Clement, Kristy Golubiewski-Davis
date: March 31, 2017
---

The code on pg 42 will throw an error with the breaks code provided.  Try the following code instead:

```r
par(mfrow=c(4,4))
par(mar=c(0,0,0,0))
for(j in 1:16) {
   hist(cumIncome[,j], breaks=20,axes=FALSE,
   main="",xlab="",ylab="", ylim=c(0,600), col="grey")
   box()
   text(x=0.33,y=500,
   label=paste("Income band:", bandNames[j]))
}
```
