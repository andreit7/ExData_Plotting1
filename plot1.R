## loading sqldf library( install.packages("sqldf") for installing )
## and reading needed subset of data

library(sqldf)
powerdata <- read.csv.sql(
  "household_power_consumption.txt", 
  sep = ";", 
  header = TRUE, 
  sql = "select * from file where Date in ('1/2/2007', '2/2/2007')"
)


## creating plot1
png(filename='plot1.png')

hist(
  powerdata$Global_active_power, 
  main="Global Active Power", 
  xlab="Global Active Power(kilowatts)", 
  col="red"
)

dev.off()

