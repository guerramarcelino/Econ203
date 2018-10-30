## Example PISA and Government Efficiency
## You're gonna use the packages xlsx and ggplot2 - make sure that you have them
## otherwise add the following lines in your code:
## install.packages("ggplot2") 
## install.packages("xlsx")

library(ggplot2)
library(xlsx)
## Setting up your directory
setwd("C:/Users/User/Desktop/Econ203/TA/9")


dataPISA<-read.xlsx("PISAxGovEfic.xlsx", sheetName = "Sheet1", as.data.frame = T, header = T)
View(dataPISA)

## lm is the function used to fit linear models
model<-lm(Math.Score.PISA~Gov.Efficiency, data=dataPISA)
summary(model)

names(model)

residuals<-resid(model)
predicted<-model$fitted.values
## Attaching those new series in your dataset
dataPISA$residuals<-residuals
dataPISA$predicted<-predicted
View(dataPISA)


## Can you assume Homoskedasticity?
homosk<-ggplot(dataPISA, aes(x=predicted, y=residuals)) + geom_point()+labs(x="Predicted Values",y="Residuals") +ggtitle("Predicted Values PISA x Residuals")
homosk

## Can you assume Normality?
## Histogram
hist(residuals)


## Density
dens <- ggplot(dataPISA, aes(x = residuals)) + 
  geom_density(kernel = "gaussian", position = "stack", size=1.5, fill = "#ff4d4d", alpha = 0.5) + labs(x = "Residuals", y="Density")+ theme(axis.text=element_text(size=18),axis.title=element_text(size=18,face="bold"), plot.title = element_text(size = 20, face = "bold"))

dens

########################## HW 16 Question 5
##########################

study_grades<-read.xlsx("StudyGradesv3.xls", sheetName = "Sheet1", as.data.frame = T, header = T)
View(study_grades)

##### Time is the dependent, Mark is the explanatory


model2<-lm(Time~Mark, data=study_grades)
summary(model2)

## Getting the residuals and predicted values

residuals<-resid(model2)
predicted<-model2$fitted.values
## Attaching those new series in your dataset
study_grades$residuals<-residuals
study_grades$predicted<-predicted
View(study_grades)

## Can you assume Homoskedasticity?
homosk2<-ggplot(study_grades, aes(x=predicted, y=residuals)) + geom_point()+labs(x="Predicted Values",y="Residuals") +ggtitle("Predicted Values Time x Residuals")
homosk2

## Can you assume Normality?
## Histogram
hist(residuals)


## Density
dens2 <- ggplot(study_grades, aes(x = residuals)) + 
  geom_density(kernel = "gaussian", position = "stack", size=1.5, fill = "#ff4d4d", alpha = 0.5) + labs(x = "Residuals", y="Density")+ theme(axis.text=element_text(size=18),axis.title=element_text(size=18,face="bold"), plot.title = element_text(size = 20, face = "bold"))

dens2


