library(ggplot2)
library(xlsx)
## Setting up your directory
setwd("C:/Users/marce/OneDrive - University of Illinois - Urbana/Semestre 5/Econ203/Econ203 Fall 2019/TA/8")


######################################################## HW14 Question 4 ######################################################## 
########################################################                 ########################################################
data<-read.xlsx("data_HW14Q4.xlsx", sheetName = "Sheet1", as.data.frame = T, header = T)
View(data)

######### First model
reg1<-lm(Y1~X1, data=data)
summary(reg1)

a1<-reg1$coefficients[1]
a1
b1<-reg1$coefficients[2]
b1
rsq1<-summary(reg1)$r.squared
rsq1

######### Second model
reg2<-lm(Y2~X2, data=data)
summary(reg2)
a2<-reg2$coefficients[1]
a2
b2<-reg2$coefficients[2]
b2
rsq2<-summary(reg2)$r.squared
rsq2

######### Third model
reg3<-lm(Y3~X3, data=data)
summary(reg3)
a3<-reg3$coefficients[1]
a3
b3<-reg3$coefficients[2]
b3
rsq3<-summary(reg3)$r.squared
rsq3

######### Fourth model
reg4<-lm(Y4~X4, data=data)
summary(reg4)
a4<-reg4$coefficients[1]
a4
b4<-reg4$coefficients[2]
b4
rsq4<-summary(reg4)$r.squared
rsq4
#####################################################################

######################################################## HW15 Question 2 ######################################################## 
########################################################                 ########################################################

laurelist<-read.xlsx("laurelistanv3.xls", sheetName = "Sheet1", as.data.frame = T, header = T)
### Column 3 has no data - it is information about the data (millions)

### Getting rid of column 3 
laurelist<-laurelist[,-3]
View(laurelist)

reg_laure<-lm(Salaries~Profits, data=laurelist)
summary(reg_laure)

## Getting the Coefficient of Determination
rsq<-summary(reg_laure)$r.squared
rsq

### Using the function summary you have the information about the residual standard error. But you can calculate it by hand
## SSE is the sum of the squared residuals
SSE<-sum(reg_laure$residuals^2)
SSE

## 34 observations
n<-nrow(laurelist)
n

### Applying the formula you get the Standard Error of the Regression 
Se<-sqrt(SSE/(n-2))
Se

### Slope
b<-reg_laure$coefficients[2]
b
### Two-tailed t test for the slope and the respective pvalue
tval<-summary(reg_laure)$coefficients[2,3]
tval
pval<-summary(reg_laure)$coefficients[2,4]
pval
### Why? use summary(reg_laure)$coefficients and try to understand what I did

### Lower and Upper Confidence Interval
confint(reg_laure, level=0.95)
confint(reg_laure, level=0.80)

