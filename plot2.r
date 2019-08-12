#Extract dataset
energyUsageData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                            nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#subsetting the dataset to read from the dates 2007-02-01 and 2007-02-02.
energySubset <- subset(energyUsageData, Date %in% c("1/2/2007","2/2/2007"))

#Converting the Date and Time variable
energySubset$Date <- as.Date(energySubset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(energySubset$Date), energySubset$Time)
energySubset$Datetime <- as.POSIXct(datetime)

## Plotting the code and setting requred parameters
with(energySubset, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
#Creating the PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off