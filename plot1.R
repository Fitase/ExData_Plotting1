power <- read.table("household_power_consumption.txt", sep=";", 
                    colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                    na.strings="?", header=TRUE)
powerset <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
powerset$Time <- paste(powerset$Date, powerset$Time, sep = " ")
powerset$Date <- as.Date(powerset$Date, format = "%d/%m/%Y")
powerset$Time <- strptime(powerset$Time, format = "%d/%m/%Y %H:%M:%S")


# Plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(powerset$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()