BestFirstRTutorial

Section 8

data(trees)
attach(trees)

par(mfrow=c(2,2))
hist(Height)
boxplot(Height)
hist(Volume)
boxplot(Volume)
help(boxplot)
par(mfrow=c(1,1))
plot(Height,Volume)
pairs(trees)
plot(trees)

Question 1
x<-rnorm(100)
par(mfrow=c(1,2))
hist(x)
boxplot(x)

Question 2
par(mfrow=c(1,1))
x<-(-10):10
x
n<-length(x)
y<-rnorm(n,x,4)
y
help(rnorm)
plot(x,y)
abline(0,1)
help(abline)

Question 3/4
data(nhtemp)
plot(nhtemp)
temp<-as.vector(nhtemp)
head(nhtemp)
plot(1912:1971,temp)
plot(1912:1971,temp,type='b')





