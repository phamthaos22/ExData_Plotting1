setwd("C:/Users/Thao/Desktop/exploratory data analysis/Project 1")

mydata <- read.table("household_power_consumption.txt",
                     skip = 66637, nrow = 2880, sep = ";", 
                     col.names = colnames(read.table(
                             "household_power_consumption.txt",
                             nrow = 1, header = TRUE, sep=";")))

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y") 

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), format = "%Y-%m-%d %H:%M:%S") 

hist(mydata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png")

dev.off