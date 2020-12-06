library(data.table)

datafile <- "household_power_consumption.txt"   # text file ko phele value mae store karayega and phr read hoga yeh. neechy wali code ki line mae
datafile

consumption_data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- consumption_data[consumption_data$Date %in% c("1/2/2007","2/2/2007"),]


# str (subsetdata)

global_active_power <- as.numeric(subset_data$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
