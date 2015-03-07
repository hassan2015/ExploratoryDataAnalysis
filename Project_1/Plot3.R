## First Plot Assignment
## Plotting Different submeters versus date and saving output as png file
## Data regarding Power Consumption
##******************************************************
# USING R release 3.1.2 and RStudio  0.98.1091
# Reading data and arrange it, same for all Plots
#
CompData <- read.csv("g:/COURSERA_TRACKS/ExploratoryDataAnalysis/P1/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# As per recommendation of assignment change date format
CompData$Date <- as.Date(CompData$Date, format="%d/%m/%Y")

## Reading required subset 
#Pdata is partial data
Pdata <- subset(CompData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(Pdata$Date), Pdata$Time)
Pdata$Datetime <- as.POSIXct(datetime)


## Third Plot, Almost Done
with(Pdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()