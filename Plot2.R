## Read the file into dataset.
dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
## filter the feb month data

powerdataset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(powerdataset$Date, powerdataset$Time),
                     "%d/%m/%Y %H:%M:%S") 
##Plot 2
png(filename="plot2.png",width=480,height=480)

plot(datetime, powerdataset$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)", 
     type = "n" )

lines(datetime, powerdataset$Global_active_power)
axis(1,at=1:3,lab=c("Thu","Fri","Sat"))
dev.off() # close the png device