## Course 4 Project Assignment (Week 1)
## to plot plot1.png

## Download the zipfile to folder (C:\coursera\data)
## Unzip the file to folder (C:\coursera\project)
## Set the Working Directory to C:\coursera\project

library(dplyr)
## Read data into R
MyData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?")

## dim(MyData)            ## 2075259 obs. of 9 variables
## select data from the dates "1/2/2007" and "2/2/2007"
Data1 <- MyData[MyData$Date =="1/2/2007" | MyData$Date == "2/2/2007",]
## Data1   --- 2880 obs. of 9 variables

## convert the Date and Time variables to Date/Time classes
Data1$Date <- strptime(paste(Data1$Date, Data1$Time), "%d/%m/%Y %H:%M:%S")


# Plot1
# Start png device driver
## Output is "plot1.png" with specified height and width
png(filename="plot1.png", width = 480, height = 480)

# create histogram for Global_active_power and save it in png format
hist(as.numeric(as.character(Data1$Global_active_power)),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# close png device driver
dev.off()

