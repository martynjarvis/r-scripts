BestFirstRTutorial

Section 7

Question 1

dnorm(0.5,2,0.5)
pnorm(2.5,2,0.5)
qnorm(0.95,2,0.5)
1.0-pnorm(1.0,2.0,0.5)-pnorm(3.0,2.0,0.5,lower.tail=F)
pnorm(3.0,2.0,0.5)-pnorm(1.0,2.0,0.5)
## or 95% CL

Question 2
help(dt)
dt(0.5,5)
pt(2.5,5)
qt(0.95,5)
1.0-pt(1.0,5)-pt(3.0,5,lower.tail=F)

Question 3
mu<-10
n<-100000
x<-rpois(n,mu)
errmean<-mean(x)-mu
errestmean<-sqrt(var(x)/n)
errmean
errestmean

Question 4
mu<-10
n<-100
x<-rexp(n,1.0/mu) ## rate
var(x)
mean(x)
errmean = mean(x)-mu
errestmean<-sqrt(var(x)/n)
errmean
errestmean










help(rpois)