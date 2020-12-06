library(data.table)

datafile <- "household_power_consumption.txt"
datafile

consumption_data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ";")

subsetData <- consumption_data[consumption_data$Date %in% c("1/2/2007", "2/2/2007"), ]
View(subsetData)
#str (subsetdata)

datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep = ""), "%d/%m/%Y %H:%M:%S")

global_active_power <- as.numeric(subsetData$Global_active_power)
View(global_active_power)

subMetering1 <-as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

png("plot3.png", width = 480, height = 480)

plot(datetime, subMetering1,type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering2, type = "l", col = "blue")


# lty means line ki type yani jo display ho wo (solid ,dotted ya dashed)
# lwd means line width 
legend("topright", c("sub_Metering_1", "sub_Metering_2", "sub_Metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
