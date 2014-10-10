## Exploratory Data Analysis
## Project 1: plot 1

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

## Making the first histogram graph
png(filename="./plot1.png")
hist(EPC$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)", yaxt='n')
axis(side=2, at=seq(0,1200,by=200), labels=seq(0,1200,by=200))
dev.off()
