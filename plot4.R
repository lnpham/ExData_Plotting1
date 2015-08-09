Assignment <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";");

twoday <- subset(Assignment, Date=="2/2/2007" | Date=="1/2/2007");

dt <-paste(twoday$Date, twoday$Time)

twoday$dtStrip <- strptime(dt,"%d/%m/%Y %H:%M:%S")


par(mfrow=c(2,2))

twoday$Global_active_power <- as.numeric(as.character(twoday$Global_active_power));

plot(twoday$dtStrip, twoday$Global_active_power, ylab = "Global Active Power", type = "l", xlab ="")

twoday$Voltage <- as.numeric(as.character(twoday$Voltage));

plot(twoday$dtStrip, twoday$Voltage, ylab = "Voltage", type = "l", xlab ="datetime")

twoday$Sub_metering_1 <- as.numeric(as.character(twoday$Sub_metering_1));
twoday$Sub_metering_2 <- as.numeric(as.character(twoday$Sub_metering_2));
twoday$Sub_metering_3 <- as.numeric(as.character(twoday$Sub_metering_3));

plot(twoday$dtStrip, twoday$Sub_metering_1, ylab = "Energy sub Meeting", type = "l", xlab ="")
lines(twoday$dtStrip, twoday$Sub_metering_2, col = "red")
lines(twoday$dtStrip, twoday$Sub_metering_3, col = "blue")

temp <- legend("topright", cex = .6, text.width=64000, y.intersp =1.5, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, col = c("black", "red", "blue"))

twoday$Global_reactive_power <- as.numeric(as.character(twoday$Global_reactive_power));

plot(twoday$dtStrip, twoday$Global_reactive_power, ylab = "Global_reactive_power", type = "l", xlab ="datetime")

dev.copy(png,'plot4.png')
dev.off()
dev.off()