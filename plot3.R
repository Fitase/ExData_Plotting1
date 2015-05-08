power <- read.table("household_power_consumption.txt", sep=";", 
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                    na.strings="?", header=TRUE)
powerset <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
powerset$Time <- paste(powerset$Date, powerset$Time, sep = " ")
powerset$Date <- as.Date(powerset$Date, format = "%d/%m/%Y")
powerset$Time <- strptime(powerset$Time, format = "%d/%m/%Y %H:%M:%S")


# Plot3
png(filename = "plot3.png", width = 480, height = 480)
with(powerset, plot(Time, Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black"))
with(powerset, lines(Time, Sub_metering_2, type="l",col="red"))
with(powerset, lines(Time, Sub_metering_3, type="l",col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()