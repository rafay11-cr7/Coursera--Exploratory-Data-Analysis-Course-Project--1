datafile <- "household_power_consumption.txt"
datafile

consumption_data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

subset_data <- consumption_data[consumption_data$Date %in% c("1/2/2007", "2/2/2007"), ]


# str(subsetdata)

date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

globalActive_Power <- as.numeric(subset_data$Global_active_power)

globalReactive_Power <- as.numeric(subset_data$Global_reactive_power)

voltage <- as.numeric(subset_data$Voltage)

sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)

sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)

sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)


png("plot 4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(date_time, globalActive_Power, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(date_time, voltage, type = "l", ylab = "Voltage", xlab = "datetime")


plot(date_time, sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")


lines(date_time, sub_metering_2, type = "l", col = "red")

lines(date_time, sub_metering_3, type = "l", col = "blue")


legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = , lwd = 2.5, col = c("black", "red", "blue"), bty = "o")

plot(date_time, sub_metering_1, type = "l", ylab = "Global_Reactive_power", xlab = "datetime")

dev.off()




