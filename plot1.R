library(dplyr)
library(lubridate)

d = read.table("household_power_consumption.txt", sep=";",header=TRUE,dec = '.')
df <- tbl_df(d)
df1 <- df %>% mutate(DATE_FORMATTED = dmy(as.character(Date))) %>% filter(year(DATE_FORMATTED) == 2007) %>% filter(month(DATE_FORMATTED) == 2) %>% 
  filter(day(DATE_FORMATTED) == 1 | day(DATE_FORMATTED) ==2)
hist(as.numeric(as.character(df1$Global_active_power)), col='red',xlab='Global Active Power (kilowatts)', 
       main='Global Active Power',xlim=c(0,6), ylim=c(0,1200))
