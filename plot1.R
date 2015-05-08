# Plot 1

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

# Draw the Histogram

png(file = "plot1.png",
    width = 480, height = 480,
    bg = "white")
hist(GraphData$Global_active_power,
     col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')
dev.off()
