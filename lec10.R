## You're gonna use the packages xlsx (import excel files), lmtest (for Durbin Watson) and ggplot2 (plots) - make sure that you have them
## otherwise add the following lines in your code:
## install.packages("ggplot2") 
## install.packages("xlsx")
## install.packages("lmtest")


library(ggplot2)
library(xlsx)
library(lmtest)
######################################## HW 18 Question3 ########################################

## Setting up your directory
setwd("C:/Users/User/Desktop/Econ203/TA/10")

## Importing the Data
quizScore<-read.xlsx("quizScorev3.xls", sheetName = "Data", as.data.frame = T, header = T)
View(quizScore)

## lm is the function used to fit linear models
model<-lm(Score~Time, data=quizScore)
summary(model)


residuals<-resid(model)
predicted<-model$fitted.values
## Attaching those new series in your dataset
quizScore$residuals<-residuals
quizScore$predicted<-predicted
View(quizScore)


## Can you assume Homoskedasticity?
homosk<-ggplot(quizScore, aes(x=predicted, y=residuals)) + geom_point()+labs(x="Predicted Values",y="Residuals") 
homosk

## Can you assume Normality?
## Histogram
hist(residuals)


## Density
dens <- ggplot(quizScore, aes(x = residuals)) + 
  geom_density(kernel = "gaussian", position = "stack", size=1.5, fill = "#ff4d4d", alpha = 0.5) + labs(x = "Residuals", y="Density")+ theme(axis.text=element_text(size=18),axis.title=element_text(size=18,face="bold"), plot.title = element_text(size = 20, face = "bold"))

dens




############### Creating a new dependent variable 
quizScore$lnScore<-log(quizScore$Score, base=exp(1))
View(quizScore)

model2<-lm(lnScore~Time, data=quizScore)
summary(model2)

############## Predicted Value for 55 minutes
beta_0<-model2$coefficients[1]
beta_1<-model2$coefficients[2]

predicted_lnscore<-beta_0+beta_1*55
predicted_score<-exp(predicted_lnscore)
predicted_score

######################################## HW 18 Question 6 ########################################

## Setting up your directory
setwd("C:/Users/User/Desktop/Econ203/TA/10")
## Importing the Data
ski_resort<-read.xlsx("ski_resortv3.xls", sheetName = "Data", as.data.frame = T, header = T)
View(ski_resort)

## lm is the function used to fit linear models
reg<-lm(Tickets~Snowfall+Temperature, data=ski_resort)
summary(reg)
residuals<-resid(reg)
ski_resort$resid<-residuals
View(ski_resort)

## Creating a new column (TIME)
ski_resort$Time<-c(1:20)
View(ski_resort)

## Can you assume Non-autocorrelation?

autocorr<-ggplot(ski_resort, aes(x=Time, y=residuals)) + geom_point()+labs(x="Year",y="Residuals") 
autocorr

### Durbin Watson Using the Package lmtest
DW<-dwtest(reg)
DW$statistic


### Durbin Watson By hands

## First loop for the numerator: you are subtracting rows in your data frame "resid(2)- resid(1)"
## "resid(3)-resid(2)" etc and placing them in a vector called num
## Note that you have only 19 values - you have 20 values for residuals (take a look at the formula)

num<-rep(0,19)
for(i in 1:19){num[i]<-((ski_resort[i+1,4]-ski_resort[i,4])^2)}


## Second loop for the denominator: you are squaring each value for your residuals
## and placing them in a vector called den


den<-rep(0,20)
for(i in 1:20){den[i]<-(ski_resort[i,4])^2}

## Sum all those values for "num" and "den". Then, divide them. 

DW_by_hands<-sum(num)/sum(den)
DW_by_hands


######################################## HW 19 Question 2 ########################################

## Setting up your directory
setwd("C:/Users/User/Desktop/Econ203/TA/10")
## Importing the Data
trees_are_good<-read.xlsx("trees_are_goodv4.xls", sheetName = "Data", as.data.frame = T, header = T)
View(trees_are_good)

reg2<-lm(Price~Lot.size+Trees+Distance , data=trees_are_good)
summary(reg2)


corr_matrix<-data.frame(cor(trees_are_good))
View(corr_matrix)

