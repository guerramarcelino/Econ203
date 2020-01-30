#################### HW2 HTR Problem #12 ##############################
#### Ho p<=.15
#### Ha p>.15

p<-0.15
### Sample with 400 observations
n<-400
##### The point estimator
phat<-58/400
phat

##### Use the formula to calculate z
z<-(phat-p)/sqrt(p*(1-p)/n)
z

##### The critical value associated with the level of significance (.10). Remember NORMSINV?
zc<-qnorm(0.9)
zc
###### Is your z>zc? If yes, reject Ho. Let's play with ifelse statements!

what_to_do_1<-ifelse(z>zc, "reject", "don't")
what_to_do_1  

##### Getting the p-value (try to compare with your excel file - pnorm is analogous to NORMSDIST) 
pnorm(z)
pvalue<-1-pnorm(z)
pvalue

############## Is your p-value<.10? Let's play with ifelse statements!
what_to_do2<-ifelse(pvalue<0.1, "reject", "don't")
what_to_do2  

############# Did you get the same results using critical value and p-value?

################## HW3 IER Problem #12 ###############################
#############
#############

############# Identify your directory! This is an important step - how to import datasets.
#### Using getwd() to indentify the current directory
getwd()

#### Setting the desktop as your directory 
setwd("C:/Users/User/Desktop")

#### After this, you should put your data file in the Desktop of your computer - or add more "/".
#### For example, you can create a file on Desktop named R and use 
#### setwd("C:/Users/User/Desktop/R"). If so, put your data inside the file R

#### I recomend the package xlsx - this is a step to install a new package in R
install.packages("xlsx")
#### You just need to install a package once. After this, just call it using require() 
#### Every time that you are using a package you gotta call them using require(nameofthepackage)
require(xlsx)

################## Importing data from an excel file. Remember to download the attached file debtequityv1
debteq<-read.xlsx("debtequityv3.xls", sheetName = "Sheet1", as.data.frame = T, header = F)
View(debteq)
summary(debteq)

################# Renaming your dataset - Let's change the name X1
names(debteq)[1]<-"Ratio"
View(debteq)
################# Now it is Ratio!
### Of course you can create a vector of numbers 
### debteq<-c(1.39, 1.13, 1.46, 1.28, 1.26, 1.84, 1.42, 1.46, 1.23, 1.20, 1.49, 1.36, 1.32, 1.37, 1.68) 
### as we did in the lab session #1

############### You gotta be specific about what variable you are working on. So, use $variable'sname 
mean<-mean(debteq$Ratio)
mean
sd<-sd(debteq$Ratio)
sd
############## Then you have the mean and sd for the variable "Ratio". This is obvious because you just have one column.
############## However, imagine more columns - more variables in your dataset...


####### 99% interval 
####### abs function - returns the absolute value
####### qt function - returns the critical value for a  t(alfa, df). 
####### Remember TINV(alfa,df) on excel? What is the difference here?
tc<-abs(qt(0.01/2, 14))
tc
############ Your interval is:

min<-mean-tc*(sd/sqrt(15))
min
max<-mean+tc*(sd/sqrt(15))
max

########### Try the new interval with 450 observations - you have to change tc (the critical t) and sqrt(n) in the formula

########## Finally, in order to get n, 

zc<-qnorm(0.95)
zc

w<-0.015
n<-(sd)^2*(zc)^2/w^2
n
