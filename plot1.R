Assignment <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";");

twoday <- subset(Assignment, Date=="2/2/2007" | Date=="1/2/2007");

twoday$Global_active_power <- as.numeric(as.character(twoday$Global_active_power));
hist(twoday[[3]], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red", xlim = c(0,6), ylim = c(0,2000));

dev.copy(png,'plot1.png')
dev.off()
dev.off()