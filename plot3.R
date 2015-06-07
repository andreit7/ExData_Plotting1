## loading sqldf library( install.packages("sqldf") for installing )
## and reading needed subset of data

library(sqldf)
powerdata <- read.csv.sql(
  "household_power_consumption.txt", 
  sep = ";", 
  header = TRUE, 
  sql = "select * from file where Date in ('1/2/2007', '2/2/2007')"
)

## creating plot3
png(filename='plot3.png')

dateTime   <- as.POSIXlt(paste(as.Date(powerdata$Date, format="%d/%m/%Y"), powerdata$Time, sep=" "))
with(powerdata,
     plot(
       dateTime, Sub_metering_1, 
       type="l", 
       ylab = "Energy sub metering",
       xlab = ""
     ))
with(powerdata,lines(dateTime, Sub_metering_2, col="red"))
with(powerdata,lines(dateTime, Sub_metering_3, col="blue"))
legend(
        "topright", 
        pch = NA,
        lty = 1,
        col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

dev.off()