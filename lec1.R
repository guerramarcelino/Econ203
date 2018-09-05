x<-c(32,32,33,40,32,48,34,33,30,28)


View(x)
histogram<-hist(x)
plot(histogram)
mean<-mean(x)
sd<-sd(x)

firstinterval<-ifelse((mean-1*sd)<=x & x<=(mean+1*sd), 1,0)
View(firstinterval)
sum(firstinterval)

secondint<-ifelse((mean-2*sd)<=x & x<=(mean+2*sd), 1,0)


w<-ifelse((mean-3*sd(x))<=x & x<=(mean+3*sd(x)), 1,0)
View(w)
sum(w)
