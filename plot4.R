## Course 4 Project Assignment (Week 1)
## to plot plot4.png

## Download the zipfile to folder (C:\coursera\data)
## Unzip the file to folder (C:\coursera\project)
## Set the Working Directory to C:\coursera\project
library(dplyr)

## Read data into R
MyData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?")

## select data from the dates "1/2/2007" and "2/2/2007"
Data1 <- MyData[MyData$Date =="1/2/2007" | MyData$Date == "2/2/2007",]

## convert the Date and Time variables to Date/Time classes
Data1$DateTime <- strptime(paste(Data1$Date, Data1$Time), "%d/%m/%Y %H:%M:%S")

# Plot4
# Start png device driver
## Output is "plot4.png" with specified height and width in png format
# 
png("plot4.png", width = 480, height = 480)

## 2 by 2 graph
par(mfcol=c(2,2))

# plot (1,1)
plot(Data1$DateTime, Data1$Global_active_power,type="l",ylab="Global Active Power",xlab=NA)

# plot (2,1)
plot(Data1$DateTime, Data1$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(Data1$DateTime, Data1$Sub_metering_2, col="red")
lines(Data1$DateTime, Data1$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot (1,2)
plot(Data1$DateTime, Data1$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot (2, 2)
plot (Data1$DateTime, Data1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

