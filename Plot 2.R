library(data.table)

datafile <- "household_power_consumption.txt"

consumption_data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

subsetData <- consumption_data[consumption_data$Date %in% c("1/2/2007", "2/2/2007") ,]


#str(subsetData)


datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(subsetData$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, global_active_power, type = "l", xlab = "", ylab ="Global Active Power (kilowatts)")
 dev.off()
