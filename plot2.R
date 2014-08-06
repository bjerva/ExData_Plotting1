# Read data
data <- read.table("household_power_consumption.txt", header=T, sep=';',
                   na.strings="?",
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Day <- weekdays(as.Date(data$Date))

#x <- as.numeric(data$Global_active_power[data$DateTime])
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
