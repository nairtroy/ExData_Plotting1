library(dplyr)
full_data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")

filter_data <- filter(full_data,Date %in% c("1/2/2007","2/2/2007")) 

filter_data$Date_Time <- strptime(paste(filter_data$Date,filter_data$Time),"%d/%m/%Y %H:%M:%S")

plot(filter_data$Date_Time, filter_data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()