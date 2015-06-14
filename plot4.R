## Read the file into dataset.
dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
## filter the feb month data

powerdataset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(powerdataset$Date, powerdataset$Time),
                     "%d/%m/%Y %H:%M:%S") 
##Plot 2
png(filename="plot4.png",width=480,height=480)
par(mfrow = c(2, 2))

plot(datetime, powerdataset$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)", 
     type = "n" )
lines(datetime, powerdataset$Global_active_power)

plot(datetime, powerdataset$Voltage, 
     xlab = "datetime", 
     ylab = "Voltage",
     type = "n" )
lines(datetime, powerdataset$Voltage)	

plot(datetime, powerdataset$Sub_metering_1, 
     xlab = "",
     ylab = "Energy sub metering", 
     type = "n")
lines(datetime, powerdataset$Sub_metering_1, col = "black")
lines(datetime, powerdataset$Sub_metering_2, col = "red")
lines(datetime, powerdataset$Sub_metering_3, col = "blue")
legend ("topright",
        col = c("Black", "red", "blue"), 
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        bty = "n",
        cex=0.8,lwd=1)

plot(datetime, powerdataset$Global_reactive_power, 
     xlab = "datetime", 
     ylab = "Global_reactive_power",
     type = "n" )
lines(datetime, powerdataset$Global_reactive_power)
dev.off() # close the png device