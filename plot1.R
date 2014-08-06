# Read data
data <- read.table("household_power_consumption.txt", header=T, sep=';',
                   na.strings="?",
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

# Get global active power data
x <- as.numeric(data$Global_active_power)

# Plot to png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(x, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
