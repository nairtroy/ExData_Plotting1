library(dplyr)
full_data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")

filter_data <- filter(full_data,Date %in% c("1/2/2007","2/2/2007")) 

filter_data$Date_Time <- strptime(paste(filter_data$Date,filter_data$Time),"%d/%m/%Y %H:%M:%S")
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))
plot(filter_data$Date_Time, filter_data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
 
plot(filter_data$Date_Time, filter_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(filter_data$Date_Time, filter_data$Sub_metering_2, col="red")
lines(filter_data$Date_Time, filter_data$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 
plot(filter_data$Date_Time, filter_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
 
plot (filter_data$Date_Time, filter_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() 
