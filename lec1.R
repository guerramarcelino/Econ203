#### Working with vectors

waist<-c(32,32,33,40,32,48,34,33,30,28)


View(waist)
histogram<-hist(waist)
plot(histogram)
mean<-mean(waist)
sd<-sd(waist)

fi<-ifelse((mean-1*sd)<=x & x<=(mean+1*sd), 1,0)
si<-ifelse((mean-2*sd)<=x & x<=(mean+2*sd), 1,0)
ti<-ifelse((mean-3*sd(x))<=x & x<=(mean+3*sd(x)), 1,0)


