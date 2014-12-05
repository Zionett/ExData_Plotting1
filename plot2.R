# Coursera Data Science Specialization by Johns Hopkins University
# Exploratory Data Analysis
# Course Project 1
# Plot 2

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

# Plot the graph as a line plot into "plot2.png"
png("plot2.png", bg = "transparent")
plot(consumption_data$Time, consumption_data$Global_active_power, type = "l", 
                            xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()