###################### HW #9 Question 2

n1<-10
n2<-10
df1<-n1-1
df2<-n2-1
s1_2<-295
s2_2<-105
Fstat<-s1_2/s2_2

############### Working with the upper tail -> Same as using Excel (FDIST)
p_value<-pf(Fstat, df1 , df2, lower.tail=FALSE)

what_to_do<-ifelse(p_value<0.05, "reject","don't")
what_to_do

## Confidence Interval -> Working with the upper tail -> Same as using Excel (FINV)
Fc1<-qf(0.975, df1, df2, lower.tail = FALSE)
Fc2<-qf(0.025, df1, df2, lower.tail = FALSE)

Fc1
Fc2

min<-Fstat/Fc2
max<-Fstat/Fc1

min
max

###################### Hw #9 Question 5

############# Identify your directory! This is an important step - how to import datasets.
#### Using getwd() to indentify the current directory
getwd()

#### Setting up my directory  
setwd("C:/Users/User/Desktop/Econ203/TA/5")

library(xlsx)

furniture<-read.xlsx("furniture_design_v1.xlsx", sheetName = "Sheet1", as.data.frame = T, header = T)
View(furniture)

s1_2<-var(furniture$Design.A)
s2_2<-var(furniture$Design.B)

n1<-25
n2<-25
df1<-n1-1
df2<-n2-1
Fstat<-s1_2/s2_2
Fstat

#### Working with the upper tail -> Same as using Excel
pf(Fstat, df1, df2, lower.tail = FALSE)

p_value1<-2*(1-pf(Fstat, df1, df2, lower.tail = FALSE))

p_value1

#### Working with the lower tail (no need to take 1-pf)
p_value2<-2*pf(Fstat, df1, df2, lower.tail = TRUE)
p_value2

#### You get the same result! Try to understand why - take a look at your lab session #5 to see the plots

what_to_do2<-ifelse(p_value1<0.05, "reject", "don't")
what_to_do2


