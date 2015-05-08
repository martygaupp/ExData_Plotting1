# Plot 4

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

# Draw the four plot grid

GraphData$DateTime = paste(GraphData$Date, GraphData$Time)
GraphData$DateTime <- strptime(GraphData$DateTime, format = "%d/%m/%Y %H:%M:%S")
png(file = "plot4.png",
    width = 480, height = 480,
    bg = "white")
par(mfrow = c(2,2))  # set up a 2 by 2 grid for graphing

# top-left
plot(GraphData$DateTime,GraphData$Global_active_power,
     type = "l",
     ylab = 'Global Active Power',
     xlab = '')

# top-right
plot(GraphData$DateTime,GraphData$Voltage,
     type = "l",
     ylab = 'Voltage',
     xlab = 'datetime')

# bottom-left
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
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex = 0.75, bty = "n", lwd = 1, col = c("black", "red", "blue"))  # add a legend

# bottom-right
plot(GraphData$DateTime,GraphData$Global_reactive_power,
     type = "l",
     ylab = 'Global_reactive_power',
     xlab = 'datetime')

par(mfrow = c(1,1))  # return to a 1 by 1 grid
dev.off()
