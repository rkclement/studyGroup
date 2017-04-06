---
title: Notes for completing Ch 3 Supplemental Questions
author: Ryan Clement, Kristy Golubiewski-Davis
date: February 14, 2017
---

Here are some notes on issues that came up for Kristy and Ryan as they did the **Chapter 3** Supplemental Questions.

The following questions have wrong answers or are poorly worded:

**Q26 - The answer given is actually for question 28. The following answer is correct:**

```r
table(round(iris$Sepal.Length), iris$Species)
```

**Q27 - I think the plot looks terrible using the parameters given in the book's answer. I would put** `par(mfrow = c(3,1))` **instead.**

**Q32 - The answer gives the wrong direction for the inequality in the table function. The following code is correct:**

```r
petals <- quantile(iris$Petal.Length, probs = 0.7)
table(iris$Species, petals < iris$Petal.Length)
```
**Q34 - wouldn't it make more sense to plot the species by the area bins?  I am unable to understand how to read this graph.  It is likely an inability of mine to understand the math part of this.**[Kristy]

This is the code Ryan used for this:

```r
petals <- quantile(iris$Petal.Length, probs = seq(0, 1, 0.1), names = FALSE)

bins <- cut(iris$Petal.Length, petals, labels = FALSE, include.lowest = TRUE)
table(iris$Species, bins)

petal_area <- quantile(iris$Petal.Length*iris$Petal.Width, 
                       probs = seq(0, 1, 0.1), names = FALSE)

bins2 <- cut(iris$Petal.Length*iris$Petal.Width, petal_area, 
            labels = FALSE, include.lowest = TRUE)
table(bins, bins2)
```
This gives us a table that looks like this:

   bins2
bins  1  2  3  4  5  6  7  8  9 10
  1  18  0  6  0  0  0  0  0  0  0
  2   2  7  4  0  0  0  0  0  0  0
  3   0  5  0  2  0  0  0  0  0  0
  4   0  0  3 11  3  0  0  0  0  0
  5   0  0  0  2 11  1  0  0  0  0
  6   0  0  0  0  1 11  3  0  0  0
  7   0  0  0  0  0  4  9  5  0  0
  8   0  0  0  0  0  0  2  5  5  0
  9   0  0  0  0  0  0  1  4  6  6
  10  0  0  0  0  0  0  0  0  4  9

Reading down the diagonol, we can see that if a species falls into, say, bin 2 for length, it is most likely to also fall into bin 2 for width. This tells us something about the relatedness of the length and width of the petals of these species. 

**Q37 - the Help search is particularly useful here.**

**Q44 - Knowing `ylim` helps here.  Their answer is very wrong, it's just the same chart 6 times over.**

**Q45 - Tip - margin values are in the `par()` argument.  Again, they just have the same chart 6 times over.**
