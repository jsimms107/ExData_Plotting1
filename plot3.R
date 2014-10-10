## Exploratory Data Analysis
## Project 1: plot 3

##******************************
## Uncomment this first section the first time you run the code 
## so you can download the file
##******************************
# ## Set the working Directory
# setwd("~/Documents/Coursera/ExpolratoryDataAnalysis")
# 
# ## DOWNLOAD THE FILE ##
# print("Downloading File")
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", method = "curl", destfile="ElectricPowerConsumption.zip")
# #Now unzip the file
# unzip("./ElectricPowerConsumption.zip")
# #That creates a file called household_power_consumption.txt
##******************************

library(dplyr)

temp<-read.table("./household_power_consumption.txt",header=T, stringsAsFactors=F,fill=T, sep=";", colClasses=c("character", "character", rep("numeric",7)), na.strings="?")

# Only using data from the first two days in February 2007
EPC<-filter(temp,Date=="1/2/2007" | Date=="2/2/2007")
# remove the other data we won't be using
rm(temp)

#convert date and time into a single variable
EPC$DT<-as.POSIXct(paste(EPC$Date, EPC$Time), format="%d/%m/%Y %H:%M:%S")

## Making the third plot
png(filename="./plot3.png")
plot(EPC$DT,EPC$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab='')
lines(EPC$DT,EPC$Sub_metering_2,col="red")
lines(EPC$DT,EPC$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))
dev.off()
