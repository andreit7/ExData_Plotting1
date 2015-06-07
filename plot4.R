## loading sqldf library( install.packages("sqldf") for installing )
## and reading needed subset of data

library(sqldf)
powerdata <- read.csv.sql(
  "household_power_consumption.txt", 
  sep = ";", 
  header = TRUE, 
  sql = "select * from file where Date in ('1/2/2007', '2/2/2007')"
)

## creating plot4
png(filename='plot4.png')

dateTime   <- as.POSIXlt(paste(as.Date(powerdata$Date, format="%d/%m/%Y"), powerdata$Time, sep=" "))

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(powerdata, {
  plot(dateTime, Global_active_power, type="l", main="", xlab="", ylab="Global Active Power")
  plot(dateTime, Voltage, type="l", main="", ylab="Voltage")
  
  plot(dateTime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
  lines(dateTime, Sub_metering_2, col="red")
  lines(dateTime, Sub_metering_3, col="blue")
  legend(
          "topright", 
          pch = NA,
          lty = 1,
          col = c("black", "red", "blue"), 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )
  
  plot(dateTime, Global_reactive_power, type="l", main="",)
})

dev.off()