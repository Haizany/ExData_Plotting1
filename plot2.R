## Course 4 Project Assignment (Week 1)
## to plot plot2.png

## Download the zipfile to folder (C:\coursera\data)
## Unzip the file to folder (C:\coursera\project)
## Set the Working Directory to C:\coursera\project
library(dplyr)

## Read data into R
MyData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?")

## select data from the dates "1/2/2007" and "2/2/2007"
Data1 <- MyData[MyData$Date =="1/2/2007" | MyData$Date == "2/2/2007",]

## convert the Date and Time variables to Date/Time classes
Data1$Date <- strptime(paste(Data1$Date, Data1$Time), "%d/%m/%Y %H:%M:%S")

# Plot2
# Start PNG device driver
## Output is "plot2.png" with specified height and width
png(filename = "plot2.png", width = 480, height = 480)

# create plot for Date vs. Global_active_power and put it in png format
plot(Data1$Date,Data1$Global_active_power,
     type = "l", 
     col = "black",
     main = "",
     xlab="",
     ylab = "Global Active Power (kilowatts)")

# close device driver
dev.off()
