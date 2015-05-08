# Plot 3

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

# Draw the sub_metering plots

GraphData$DateTime = paste(GraphData$Date, GraphData$Time)
GraphData$DateTime <- strptime(GraphData$DateTime, format = "%d/%m/%Y %H:%M:%S")
png(file = "plot3.png",
    width = 480, height = 480,
    bg = "white")
plot(GraphData$DateTime,GraphData$Sub_metering_1,
     type = "l",
     col = "black",
     ylab = 'Energy sub metering',
     xlab = '')
points(GraphData$DateTime,GraphData$Sub_metering_2,
       type = "l",
       col = "red")
points(GraphData$DateTime,GraphData$Sub_metering_3,
       type = "l",
       col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))  # add a legend
dev.off()
