getwd()
#Extract dataset
energyUsageData <- read.csv("household_power_consumption.txt", header = T, sep = ';',
                            na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#subsetting the dataset to read from the dates 2007-02-01 and 2007-02-02.
energySubset <- subset(energyUsageData, Date %in% c("1/2/2007","2/2/2007"))
energySubset$Date <- as.Date(energySubset$Date, format="%d/%m/%Y")

## Plotting the code and setting requred parameters
hist(energySubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#Creating the PNG file with a width of 480 pixels and a height of 480 pixels
png("plot1.png", width=480, height=480)
dev.off()