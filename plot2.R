
setwd("C:/Users/Thao/Desktop/exploratory data analysis/Project 1")

mydata <- read.table("household_power_consumption.txt",
                     skip = 66637, nrow = 2880, sep = ";", 
                     col.names = colnames(read.table(
                             "household_power_consumption.txt",
                             nrow = 1, header = TRUE, sep=";")))

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y") 

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), format = "%Y-%m-%d %H:%M:%S") 
png(file = "plot2.png")
plot(mydata$DateTime, mydata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")

dev.off