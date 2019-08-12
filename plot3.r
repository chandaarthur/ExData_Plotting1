# Reading the dataset into r
energyUsageData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#subsetting the dataset to read from the dates 2007-02-01 and 2007-02-02.
energySubset <- subset(energyUsageData, Date %in% c("1/2/2007","2/2/2007"))

#Converting the Date and Time variable
energySubset$Date <- as.Date(energySubset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(energySubset$Date), energySubset$Time)
energySubset$Datetime <- as.POSIXct(datetime)

# Plotting the code and setting requred parameters
with(energySubset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
# Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
