library("forecast")
library("pracma")

setwd("C:/Users/Martyn/Projects/r-thing/")
subs = read.table("subs2.dat",sep = ",") 
colnames(subs) <- c("date","players")
subs$date <- as.Date(subs$date)
head(subs)

# plot(subs$players, type = "l")
subs.h <- hampel(subs$players, 10, t0 = 3)
subs$players <- subs.h$y
# plot(subs.h$y, type = "l")

start.date <- as.POSIXlt(subs$date[1]) 
start.week <- as.numeric(strftime(start.date,format="%W") )
start.year <- as.numeric(strftime(start.date,format="%Y") )

subs.ts<-ts(subs$players,start=c(start.year,start.week),frequency=52)
plot(subs.ts)

# pick a suitable working window
subs.work <- window((subs.ts), start=2009, end =2014)
plot(subs.work)

#decompose in to sesonal (weekly), trend and random components
subs.dc<-(decompose(subs.work))
plot(subs.dc)

# Exponential stuff below here:

#fit HoltWinters to whole thing
subs.hw <- HoltWinters(subs.work)
subs.hw
subs.hw$SSE
plot(subs.hw)

# forecast
subs.fc <- forecast.HoltWinters(subs.hw, h=13)
subs.fc
plot.forecast(subs.fc)

#diagnostic
summary(subs.fc$residuals)
hist(subs.fc$residuals)
acf(subs.fc$residuals, lag.max=20)
Box.test(subs.fc$residuals, lag=20, type="Ljung-Box")









