## loading sqldf library( install.packages("sqldf") for installing )
## and reading needed subset of data

library(sqldf)
powerdata <- read.csv.sql(
  "household_power_consumption.txt", 
  sep = ";", 
  header = TRUE, 
  sql = "select * from file where Date in ('1/2/2007', '2/2/2007')"
)

## creating plot2
png(filename='plot2.png')


dateTime   <- as.POSIXlt(paste(as.Date(powerdata$Date, format="%d/%m/%Y"), powerdata$Time, sep=" "))

plot(dateTime, powerdata$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
