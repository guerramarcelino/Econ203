####################### Working with vectors #######################
## A vector is a sequence of data elements of the 
## same basic type - in our case, numbers (a numeric vector)
## Giving him a name (waist):

waist<-c(32,32,33,40,32,48,34,33,30,28)

## You are taking a look at what you are doing...
View(waist)

######## A skewed distribution 
hist(waist)

######## Mean (mean()) and Standard Deviation (sd()) is all what we need; 

mean<-mean(waist)
sd<-sd(waist)

######## Time to construct intervals using ifelse
#### Give them a name!

## 1st interval 

fi<-ifelse((mean-1*sd)<=waist & waist<=(mean+1*sd), 1,0)
View(fi)
## How many observations fit inside the interval?  
## (In other words) How many ones do you have?
sum(fi)

## Don't forget to calculate the proportion!
prp1st<-sum(fi)/10

## 2nd interval
si<-ifelse((mean-2*sd)<=waist & waist<=(mean+2*sd), 1,0)
sum(si)
prp2nd<-sum(si)/10
## 3rd interval

ti<-ifelse((mean-3*sd)<=waist & waist<=(mean+3*sd), 1,0)
sum(ti)
prp3rd<-sum(ti)/10
