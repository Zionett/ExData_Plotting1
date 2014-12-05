# Coursera Data Science Specialization by Johns Hopkins University
# Exploratory Data Analysis
# Course Project 1
# Plot 4

# Read in the consumption data
consumption_data <- read.csv2("household_power_consumption.txt", dec = ".",
                        colClasses = rep(c("character", "numeric"), c(2, 7)),
                        na.strings = "?")

# Select data for 2007-02-01 and 2007-02-02
consumption_data <- consumption_data[consumption_data$Date == "1/2/2007" 
                                     | consumption_data$Date == "2/2/2007",]

# Combine the first two columns into one in Date format
consumption_data$Time <- strptime(paste(consumption_data$Date, 
                        consumption_data$Time), format = "%d/%m/%Y %H:%M:%S")
consumption_data <- consumption_data[, -1]

# Plot the graphs into "plot4.png"
png("plot4.png", bg = "transparent")
par(mfrow = c(2, 2))

# Graph 1 topleft
plot(consumption_data$Time, consumption_data$Global_active_power, type = "l", 
                                        xlab = "", ylab = "Global Active Power")

# Graph 2 topright
with(consumption_data, plot(Time, Voltage, type = "l", xlab = "datetime"))

# Graph 3 bottomleft
plot(consumption_data$Time, consumption_data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(consumption_data$Time, consumption_data$Sub_metering_2, col = "red")
lines(consumption_data$Time, consumption_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                    "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"), 
                    bty = "n")

# Graph 4 bottomright
with(consumption_data, plot(Time, Global_reactive_power, type = "l", 
                                                            xlab = "datetime"))
dev.off()