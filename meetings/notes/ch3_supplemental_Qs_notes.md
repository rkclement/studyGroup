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
