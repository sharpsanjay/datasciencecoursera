## Read the file into dataset.
dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
## filter the feb month data

powerdataset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(powerdataset$Date, powerdataset$Time),
                     "%d/%m/%Y %H:%M:%S") 
##Plot 2
png(filename="plot3.png",width=480,height=480)

plot(datetime, powerdataset$Sub_metering_1, 
     xlab = "",
     ylab = "Energy sub metering", 
     type = "n" )

lines(datetime, powerdataset$Sub_metering_1,col = "black")
lines(datetime, powerdataset$Sub_metering_2,col = "red")
lines(datetime, powerdataset$Sub_metering_3,col = "blue")
legend ("topright",
        col = c("Black", "red", "blue"), 
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        cex=0.8,lwd=1)
dev.off() # close the png device