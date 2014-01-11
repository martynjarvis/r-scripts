BestFirstRTutorial

Section 6 ex
data()

Question 1
data(quakes)
head(quakes)
apply(quakes[,3:4],2,summary)
data(mtcars)
head(mtcars)
apply(mtcars[,c(1,6)],2,mean)


Question 2
y<-matrix(c(1,4,1,0,2,-1),byr=T,nr=2)
apply(y[,2:3],1,mean)
