
setwd("C:/Users/Thao/Desktop/exploratory data analysis/Project 1")

mydata <- read.table("household_power_consumption.txt",
                     skip = 66637, nrow = 2880, sep = ";", 
                     col.names = colnames(read.table(
                             "household_power_consumption.txt",
                             nrow = 1, header = TRUE, sep=";")))

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y") 

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), format = "%Y-%m-%d %H:%M:%S") 

png(file = "plot3.png")

plot(mydata$DateTime, mydata$Sub_metering_1, type="l", col="black", xlab = "", ylab="Energy sub metering")

lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")

lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.8, col=c("black", "red", "blue"),
       lty = 1)

dev.copy(png, file = "plot3.png")

dev.off 