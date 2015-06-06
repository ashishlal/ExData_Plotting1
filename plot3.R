library(dplyr)
library(lubridate)

d = read.table("household_power_consumption.txt", sep=";",header=TRUE,dec = '.')
df <- tbl_df(d)
df1 <- df %>% mutate(DATE_FORMATTED = dmy(as.character(Date))) %>% filter(year(DATE_FORMATTED) == 2007) %>% filter(month(DATE_FORMATTED) == 2) %>% filter(day(DATE_FORMATTED) == 1 | day(DATE_FORMATTED) ==2)
df2 <- df1 %>% mutate(weekday = wday(DATE_FORMATTED, label=TRUE))

with(df2, plot(as.numeric(as.character(Sub_metering_1)), type="l", ylab='Energy sub metering', xaxt="n", ylim=c(0,40), xlab=""))
par(new = TRUE)
with(df2, plot(as.numeric(as.character(Sub_metering_2)), type="l", ylab='Energy sub metering', xaxt="n", col="red", ylim=c(0,40), xlab=""))
par(new = TRUE)
with(df2, plot(as.numeric(as.character(Sub_metering_3)), type="l", ylab='Energy sub metering', xaxt="n", col="blue", ylim=c(0,40), xlab=""))

with(df2,axis(1, at=c(1,nrow(df2)/2,nrow(df2)),  labels=c("Thurs","Fri", "Sat"),las=2))

legend('topright', c("Sub_metering_1", "Sub_metering_2","Sub_metering_3") , 
       lty=1, col=c('black', 'red', 'blue'), bty='y', cex=.75)
