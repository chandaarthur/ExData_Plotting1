# Reading the dataset into r
energyUsageData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#subsetting the dataset to read from the dates 2007-02-01 and 2007-02-02.
energySubset <- subset(energyUsageData, Date %in% c("1/2/2007","2/2/2007"))
energySubset$Date <- as.Date(energySubset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(energySubset$Date), energySubset$Time)
energySubset$Datetime <- as.POSIXct(datetime)

#Setting the parameters and plotting
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(energySubset, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

#Creating the PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off