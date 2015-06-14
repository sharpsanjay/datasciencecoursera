## Read the file into dataset.
dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
## filter the feb month data

powerdataset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]

##plot hist
png(filename="plot1.png",width=480,height=480)
hist(powerdataset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
##close the device file
dev.off()

