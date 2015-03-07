## First Plot Assignment
## Plotting Histogram and saving output as png file
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

## Plot 1
hist(Pdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save it to png file format
dev.copy(png, file="plot1.png", height=480, width=480)
# Closing device
dev.off()