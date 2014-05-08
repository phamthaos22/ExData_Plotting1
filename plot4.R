
setwd("C:/Users/Thao/Desktop/exploratory data analysis/Project 1")

mydata <- read.table("household_power_consumption.txt",
                     skip = 66637, nrow = 2880, sep = ";", 
                     col.names = colnames(read.table(
                             "household_power_consumption.txt",
                             nrow = 1, header = TRUE, sep=";")))

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y") 

mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), format = "%Y-%m-%d %H:%M:%S") 

png(file = "plot4.png")

par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))

with(mydata, plot(mydata$DateTime, mydata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(mydata, plot(mydata$DateTime, mydata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
     
with(mydata, plot(mydata$DateTime, mydata$Sub_metering_1, type="l", col="black", xlab = "", ylab="Energy sub metering"))
     
     lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
     
     lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
     
     legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8, col=c("black", "red", "blue"),lty = 1, bty = "n")

with(mydata, plot(mydata$DateTime, mydata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.copy(png, file = "plot4.png")

dev.off 