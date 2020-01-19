setwd("C:/Users/marce/OneDrive - University of Illinois - Urbana/Semestre 5/Econ203/Econ203 Fall 2019/TA/12")
library(xlsx)

########################################### HW 22 Question 6

### Importing the data
data<-read.xlsx("dummycarsv3.xls", sheetName ="Data", header=T, as.data.frame = T)
View(data)
### Creating dummy variables for White and Silver colors

data$white<-ifelse(data$Color=="1",1,0)
data$silver<-ifelse(data$Color=="2",1,0)

### Full Model
full<-lm(Price~Odometer+silver+white, data=data)
summary(full)


## White is not statistically significant at 5% level. 

### Reduced Model

reduc<-lm(Price~Odometer+silver, data=data)
summary(reduc)

###
reduc$coefficients[3]

### $138.86

########################################### HW 23 Question 1

### Importing the data
data<-read.xlsx("rent_proj2_dat7.xls", sheetName ="Data", header=T, as.data.frame = T)
View(data)
lapply(data, class)

## Since independent variables with Yes/No are factors, there is no need to 
## create dummy variables for each case. Just run the regression
## with . and you will use all the Xs in your dataframe

## Full Model
## 
full<-lm(RENT~., data=data)
summary(full)


## Drop all the not statistically significant variables and run the reduced model

reduc<-lm(RENT~.-TENISCRT-SAUNA-YRLYLEAS-XTRAUTIL-BTHPERBD-DSHWSHER, data=data)
summary(reduc)


## Partial F-test
anova(full, reduc)

############### P-value>.05 and you do not reject the null. Therefore,
############### for prediction purposes, use the reduced model.

## Interaction dummy for DSHWSHER, SAUNA and TENISCRT
## Since those variables are factors, I will create dummy variables (numeric) for them.
## After that, I construct the interaction dummy  
dummies<-dummy_cols(data[,c(2,3,4)], select_columns = c("DSHWSHER","SAUNA","TENISCRT"))
View(dummies)

dummies$interact<-dummies$DSHWSHER_Yes*dummies$SAUNA_Yes*dummies$TENISCRT_Yes
################################
## Bringing the new column to your data set
data$interact<-dummies$interact

full_2<-lm(RENT~., data=data)
summary(full_2)

