##################################### HW#6 Question 6  ###############################
#############
#############

############# Identify your directory! This is an important step - how to import datasets.
#### Using getwd() to indentify the current directory
getwd()

#### Setting up my directory  
setwd("C:/Users/User/Desktop/Econ203/TA/4")


#### If you don't have the package xlsx, start with install.packages("xlsx")

require(xlsx)

################## Importing data from an excel file. Remember to download the attached file. Also, now you have the input header = T
fiber<-read.xlsx("fiberv3.xls", sheetName = "Sheet1", as.data.frame = T, header = T)
View(fiber)
summary(fiber)

ttest<-t.test(fiber$Consumers, fiber$Nonconsumers, alternative = "less")
ttest
names(ttest)

pointest<-ttest$estimate[1]-ttest$estimate[2]
pointest

testat<-ttest$statistic
testat

pvalue<-ttest$p.value
pvalue
#### So, no need to do 1-ttest$p.value (WHY?)

what_to_do<-ifelse(pvalue<0.05, "reject", "don't")
what_to_do


#########################################          

##################################### HW#7 Question 4  ###############################
#############
#############


yellowp<-read.xlsx("yellow_pagesv4.xls", sheetName = "Sheet1", as.data.frame = T, header = T)
View(yellowp)
summary(yellowp)


ttest2<-t.test(yellowp$This.Year, yellowp$Last.Year, paired = TRUE, alternative = "greater", mu= 0)
ttest2
names(ttest2)

pointest2<-ttest2$estimate
pointest2


tstat2<-ttest2$statistic
tstat2
pvalue2<-ttest2$p.value
pvalue2

what_to_do2<-ifelse(pvalue2<0.05, "reject", "don't")
what_to_do2

### Confidence Interval
### Creating a column "Difference"
yellowp$Difference<-yellowp$This.Year-yellowp$Last.Year
View(yellowp)
## xD and your pointest2 are the same
xD<-mean(yellowp$Difference)
xD
sD<-sd(yellowp$Difference)
sD

## Before use the formula for CI, you need to find critical values
## 95% confidence, alpha=5%
tc<-abs(qt(0.05/2,51))
tc

max<-xD+tc*sD/sqrt(52)
max

min<-xD-tc*sD/sqrt(52)
min

############################# For the rest of the question, your alternative is uD>0.5
ttest3<-t.test(yellowp$This.Year, yellowp$Last.Year, paired = TRUE, alternative = "greater", mu= 0.5)
ttest3

tstat3<-ttest3$statistic
tstat3
pvalue3<-ttest3$p.value
pvalue3

what_to_do3<-ifelse(pvalue3<0.05, "reject", "don't")
what_to_do3



