# Read data
data <- read.table("household_power_consumption.txt", header=T, sep=';',
                   na.strings="?",
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Day <- weekdays(as.Date(data$Date))

png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
dev.off()
