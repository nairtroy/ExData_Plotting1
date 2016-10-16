library(dplyr)
full_data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")

filter_data <- filter(full_data,Date %in% c("1/2/2007","2/2/2007")) 

hist(filter_data$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()