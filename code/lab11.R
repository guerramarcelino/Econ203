###
setwd("C:/Users/marce/OneDrive - University of Illinois - Urbana/Semestre 5/Econ203/Econ203 Fall 2019/TA/11")
library(xlsx)
############### Homework 20 Question 2

## 7 independent variables (Xs), sample size 27
n=27
k=7
SSR=172.5213
Se2=8.9245


SSE=Se2*(n-k-1)
SST=SSR+SSE
SST

AdjR2=1-(SSE/(n-k-1))/(SST/(n-1))
AdjR2

############### Homework 21 Question 2

data<-read.xlsx("innsbruckv3.xls", sheetName = "Data", as.data.frame = T, header = T)

### Dependent variable: margin

reg1<-lm(MARGIN~ROOMS+NEAREST+OFFICE+INCOME+DISTTWN+COLLEGE, data=data)
summary(reg1)

r2<-summary(reg1)$r.squared
r2
adjr2<-summary(reg1)$adj.r.squared
adjr2

### DISTTWN and COLLEGE are not statistically different from zero (pval>.10)

### For partial F test you need
# SSR and MSE from the full model
# SSR from the reduced model
# kd is the number of varibles that you just dropped. In this case, two: DISTTWN and COLLEGE

## Using R you can use the anova() function
### running the reduced model

reg2<-lm(MARGIN~ROOMS+NEAREST+OFFICE+INCOME, data=data)
reg2

### Partial F-test
anova(reg1, reg2)

## your F stat is 1.8517 and the respective pvalue is 0.1627. So you do not reject the null
## What does that mean? USE THE REDUCED MODEL!!

### Predicted values
## remember that you are using the reduced model (reg2)
AnnArbor<-predict.lm(reg2,data.frame(ROOMS=2672, NEAREST=1.3, OFFICE=952, INCOME=35))
AnnArbor

Bloom<-predict.lm(reg2,data.frame(ROOMS=2500, NEAREST=1.2, OFFICE=604, INCOME=37))
Bloom

Champaign<-predict.lm(reg2,data.frame(ROOMS=2300, NEAREST=0.5, OFFICE=1430, INCOME=33.5))
Champaign
