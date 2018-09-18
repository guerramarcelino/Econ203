##### Homework 4 - Question #5
#### Ho sigma2=300
#### Ha sigma2 not equal to 300   *two tailed test!!!
sigma2<-300
n=30
s2<-150
x2<-s2*(n-1)/sigma2
x2

#### You need to multiply by 2!
pchisq(x2,df=29)

pvalue<-2*pchisq(x2, df=29)
pvalue

what_to_do<-ifelse(pvalue<0.05, "reject", "don't'")
what_to_do

                               ######### WARNING ##############


#### Think about the value that the function pchisq returned. Is it the same as CHIDIST in excel? No!
#### CHIDIST works with the right tail, so you had to use 1-CHINV in that question.
#### R returns the lower tail by default (look that input lower.tail=TRUE). So, no need 
#### to subtract by 1 in that case. Check the graphs that we discussed in lab session #3 to
#### understand the idea


####### If you want to work with from the right to the left, as in excel, you need 
####### to tell the function! The argument "lower.tail=FALSE" do the work.
pchisq(x2,df=29, lower.tail = FALSE)   ### That is the excel output for the CHIDIST function

pvalue_excel<-2*(1-pchisq(x2,df=29,lower.tail=FALSE))
pvalue_excel
############################################################################################



# Finding critical values for X2
Xc1<-qchisq(0.025, df=29)
Xc1

Xc2<-qchisq(1-0.025, df=29)  
Xc2
################## Confidence Interval

Upper<-(n-1)*s2/Xc1
Upper

Lower<-(n-1)*s2/Xc2
Lower

############################## The following code is extra-extra ########################

##################################  Plotting distributions ###################################

#################################### USING GGPLOT ############################################
##### You can find a good introduction to ggplot here http://www.ling.upenn.edu/~joseff/avml2012/
##### Have fun!

## If you don't have the package, start with install.packages("ggplot2")
library(ggplot2)

####################### We start with the first plot- Slide 14 from your TA notes (lab session #3)

#### Remember: we are working from the right to the left using excel. The first Critical value is 16.047
#### Then, there is no color from 16.047 to zero
Notshadedarea <- function(x) {
  y <- dchisq(x, df=29)
  y[x< 16.047  ] <- NA
  return(y)
}

firstplot <- ggplot(data.frame(x = c(0, 60)), aes(x = x)) +
  stat_function(fun = dchisq, args = list(df = 29), size=1.5) +
  stat_function(fun=Notshadedarea, geom="area", fill="dodgerblue3", alpha=.9)+
  labs(x = "", y="")+ theme(axis.text=element_text(size=18),axis.title=element_text(size=18,face="bold"), legend.text=element_text(size=15))+scale_fill_manual(values=gray.colors(2, start=1, end=0.2))+ ggtitle("Chi Square Distribution - CHIINV(0.975,29)") 

firstplot

#################### Slide 15 - CHIINV(0.025,29)
#### Remember: we are working from the right to the left using excel. The second critical value is 45.722
#### Then, there is no color from 45.722 to zero

Notshadedarea <- function(x) {
  y <- dchisq(x, df=29)
  y[x< 45.722  ] <- NA
  return(y)
}

secondplot <- ggplot(data.frame(x = c(0, 60)), aes(x = x)) +
  stat_function(fun = dchisq, args = list(df = 29), size=1.5) +
  stat_function(fun=Notshadedarea, geom="area", fill="dodgerblue3", alpha=.9)+
  labs(x = "", y="")+ theme(axis.text=element_text(size=18),axis.title=element_text(size=18,face="bold"), legend.text=element_text(size=15))+scale_fill_manual(values=gray.colors(2, start=1, end=0.2))+ ggtitle("Chi Square Distribution - CHIINV(0.025,29)") 

secondplot


#################### Slide 16 - CHIDIST(14.5,29)
#### Remember: we are working from the right to the left using excel. The statistic is X=14.5
#### Then, there is no color from 14.5 to zero



Notshadedarea <- function(x) {
  y <- dchisq(x, df=29)
  y[x< 14.5  ] <- NA
  return(y)
}

thirdplot <- ggplot(data.frame(x = c(0, 60)), aes(x = x)) +
  stat_function(fun = dchisq, args = list(df = 29), size=1.5) +
  stat_function(fun=Notshadedarea, geom="area", fill="dodgerblue3", alpha=.9)+
  labs(x = "", y="")+ theme(axis.text=element_text(size=18),axis.title=element_text(size=18,face="bold"), legend.text=element_text(size=15))+scale_fill_manual(values=gray.colors(2, start=1, end=0.2))+ ggtitle("Chi Square Distribution - CHIDIST(14.5,29)") 

thirdplot



#################### Slide 18 - STEP 4
#### Remember: we are working from the right to the left using excel.
#### Now, we need to decide - reject or not Ho. We have X=14.5 and two critical values.
#### X - your statistic - in RED. Critical values in BLUE

Notshadedarea1<- function(x) {
  y <- dchisq(x, df=29)
  y[x < 45.722 & x> 16.047  ] <- NA
  return(y)
}



Notshadedarea2 <- function(x) {
  y <- dchisq(x, df=29)
  y[x>14.5]<- NA
  return(y)
}

finalplot <- ggplot(data.frame(x = c(0, 60)), aes(x = x)) +
  stat_function(fun = dchisq, args = list(df = 29), size=1.5) +
stat_function(fun=Notshadedarea1, geom="area", fill="dodgerblue3", alpha=.9)+
  stat_function(fun=Notshadedarea2, geom="area", fill="red", alpha=.9)+
labs(x = "", y="")+ theme(axis.text=element_text(size=18),axis.title=element_text(size=18,face="bold"), legend.text=element_text(size=15))+scale_fill_manual(values=gray.colors(2, start=1, end=0.2))+ ggtitle("Chi Square Distribution - Final Decision") 
finalplot










