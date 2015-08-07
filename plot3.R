## Course 4 Project Assignment (Week 1)
## plot3.png

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

# Plot3
# Start png device driver
## Output is "plot3.png" with specified height and width in png format
# 
png("plot3.png", width = 480, height = 480)

plot(Data1$DateTime, Data1$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(Data1$DateTime, Data1$Sub_metering_2, col="red")
lines(Data1$DateTime, Data1$Sub_metering_3, col="blue")
legend("topright", lty=1, lwd=2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close device driver
dev.off()

