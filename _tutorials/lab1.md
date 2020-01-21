Econ 203: Lab Session 1
================
Marcelino Guerra
1/21/2020

## Review \#1 Question 1

The manager of a men’s store observes the waist size (in inches) of
trousers sold yesterday:

<center>

**32,32,33,40,32,48,34,33,30,28**

</center>

Calculate the range, variance, and standard deviation of these data.
Select the answers equal to or closest to your results.

Range = ?

Variance = ?

Standard Deviation = ?

What percentage of the observations are within 1, 2 and 3 standard
deviations of the mean?

Within ±1 standard deviation: =

Within ±2 standard deviation: =

Within ±3 standard deviation: =

How does this compares with what the empirical rule predicts?

### Answer

#### Working with vectors

A vector is a sequence of data elements of thesame basic type - in our
case, numbers (a numeric vector). So, use “c()”.

Giving it a name (waist):

``` r
waist<-c(32,32,33,40,32,48,34,33,30,28)
View(waist)
```

It has a skewed distribution\!

``` r
hist(waist)
```

![](lab1_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

All that you need to answer the first part of the question: sd() and
mean().

``` r
mean<-mean(waist)
sd<-sd(waist)
mean
```

    ## [1] 34.2

``` r
sd
```

    ## [1] 5.750362

Time to construct intervals using ifelse function. Give them a name\!

**\(1^{st}\) interval**

``` r
fi<-ifelse((mean-1*sd)<=waist & waist<=(mean+1*sd), 1,0)
View(fi)
## How many observations fit inside the interval?  
## (In other words) How many ones do you have?
sum(fi)
```

    ## [1] 7

Don’t forget to calculate the proportion\!

``` r
prp1st<-sum(fi)/10
prp1st
```

    ## [1] 0.7

**\(2^{nd}\) interval**

``` r
si<-ifelse((mean-2*sd)<=waist & waist<=(mean+2*sd), 1,0)
prp2nd<-sum(si)/10
prp2nd
```

    ## [1] 0.9

**\(3^{rd}\) interval**

``` r
ti<-ifelse((mean-3*sd)<=waist & waist<=(mean+3*sd), 1,0)
prp3rd<-sum(ti)/10
prp3rd
```

    ## [1] 1

Time to compare with what the [empirical
rule](https://en.wikipedia.org/wiki/68%E2%80%9395%E2%80%9399.7_rule)
predicts.
