# Plot 2

# Get the Data
# NOTE: I subsetted the data and then saved just the subset as "GraphData.txt" in order to
#       avoid the file size limitations imposed by GitHub

GraphData <- read.table("GraphData.txt", sep = " ", header = TRUE, colClasses = "character")
GraphData$Global_active_power <- as.numeric(GraphData$Global_active_power)
GraphData$Sub_metering_1 <- as.numeric(GraphData$Sub_metering_1)
GraphData$Sub_metering_2 <- as.numeric(GraphData$Sub_metering_2)
GraphData$Sub_metering_3 <- as.numeric(GraphData$Sub_metering_3)
GraphData$Voltage <- as.numeric(GraphData$Voltage)
GraphData$Global_reactive_power <- as.numeric(GraphData$Global_reactive_power)
str(GraphData)

# Draw the scatter plot over time

GraphData$DateTime = paste(GraphData$Date, GraphData$Time)
GraphData$DateTime <- strptime(GraphData$DateTime, format = "%d/%m/%Y %H:%M:%S")
png(file = "plot2.png",
    width = 480, height = 480,
    bg = "white")
plot(GraphData$DateTime,GraphData$Global_active_power,
     type = "l",
     ylab = 'Global Active Power (kilowatts)',
     xlab = '')
dev.off()
