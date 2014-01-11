library("forecast")

setwd("C:/Users/scruff/Projects/r-thing/")
plex = read.table("plex.dat") 
# read in file
head(plex)
colnames(plex) <- c("typeID","regionID","date","lowPrice","highPrice","avgPrice","volume","orders")
head(plex)
plex$date <- as.Date(plex$date)
plex$avgPrice <-plex$avgPrice/1000000
#head(plex)

#create time series
pts<-ts(plex$avgPrice,start=1,frequency=7)
plot(pts)

# pick a suitable working window
work <- window((pts), start=10, end =50)
plot(work)


# exploring the time series
acf(work)
acf(diff(work,differences=1))
pacf(work)
pacf(diff(work,differences=1))
pacf(work)


#try some auto stuff
auto.arima(work,ic="aicc") # 311,101
auto.arima(work,ic="aic") # 311,101
auto.arima(work,ic="bic")# 113,201 punish extra parameters
# (311) seems interesting

#model fitting
workar <- arima(work, order=c(3,1,1), seasonal=list(order=c(1,0,1)))
workar

#diagnostics
tsdiag(workar)
hist(workar$residuals)





#decompose in to sesonal (weekly), trend and random components
workdc<-(decompose(work))
plot(workdc)

# Exponential stuff below here:

#fit HoltWinters to whole thing
workhw <- HoltWinters(work)
workhw
workhw$SSE
plot(workhw)

# forecast
workfc <- forecast.HoltWinters(workhw, h=28)
workfc
plot.forecast(workfc)

#diagnostic
summary(workfc$residuals)
hist(workfc$residuals)
acf(workfc$residuals, lag.max=20)
Box.test(workfc$residuals, lag=20, type="Ljung-Box")

help(points)







