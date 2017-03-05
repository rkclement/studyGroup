---
title: Notes for completing Ch 2 Supplemental Questions
author: Ryan Clement, Kristy Golubiewski-Davis
date: February 14, 2017
---

Here are some notes on issues that came up for Kristy and Ryan as they did the **Chapter 2** Supplemental Questions.

A useful logical expression, `!=` (not equal to) is mentioned once in Chapter 2.  It is a very useful expression to know, and Kristy used it in her answers several times, especially when avoiding elseif() statements.

The following functions are not mentioned in Chapter 2, but may be mentioned later in the text. You can also get more information by entering, for example, `?round` into the console. If you have an idea about what you are looking for, but don't know a function name, you can also search the documentation by using `??`, as in `??uppercase`:

```r
     round()
     sum()
     prod()
     toupper()
     sort()
     print()
     paste()
     which()
     data.frame(a = data, b = data, c = data, stringsAsFactors = FALSE)
     elseif() # this is not strictly needed, but useful to know in conjunction with if() statements
     else # also not strictly needed
```
The following questions have wrong answers or are poorly worded:
**Q5 - The line below is wrong in the answer.**

```r
# original:
print("You turned (or are turning)" ans, "years old this year")

#corrected:
print(paste("You turned (or are turning)", ans, "years old this year"))
```

**Q9 - would require a nested if statement OR multiple functions, with the functions taking in a variable.  Neither concept is covered in the chapter.**

**Q10 - The code is wrong.  see the correction below.**

```r
# original:
abb <- as.numeric(readline("enter an abbreviation: "))
# corrected:
abb <- (readline("enter an abbreviation: "))
```

**Q14 - sorts from lowest to highest.  Need to add decreasing=TRUE to the statement.**

**Q15 - the answer is not calculating the number of grads.  It's calulating the percentage of grads per square mile.**

**Q18 - asks for 3 columns but then gives 4 values**

**Q19 - the use of the phrase "vector notation" is confusing.  I thought I needed to have a vector output.**
