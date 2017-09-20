# EXPLORATORY GRAPHICS, Coursera Project 1

# NOTE: for this assignment I downloaded the household_power_consumption.zip file, 
# unzipped it, and extracted the values for February 1 and February 2, 2007 
# into a separate file named FEBhousehold_power_consumption.txt
# I commented out the code that does it since I only need to do it once. 

#Download Electric power consumption data set
#if (! file.exists("data")) {
#	dir.create("data")
#}

#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
#download.file(fileUrl, destfile="./data/household_power_consumption.zip", method="curl")

# unzip file into ./data/household_power_consumption.txt
#temp <- tempfile()
#download.file(fileUrl,temp)
#con <- unz(temp, "./data/household_power_consumption.txt")
#unlink(temp)

# Create file FEBhousehold_power_consumption.txt that contains the header and only the data for 1/2/2007 and 2/2/2007
#grep Date household_power_consumption.txt > FEBhousehold_power_consumption.txt 
#grep '^[1|2]/2/2007' household_power_consumption.txt  >> FEBhousehold_power_consumption.txt 

# Read the electric power data for the first two days in Feb 2007
data <- read.table("./data/FEBhousehold_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

gap <- data[3]
ngap<-as.numeric(gap$Global_active_power)

dates<-data[1]
times<-data[2]
Cdates<-as.character(dates$Date)
Ctimes<-as.character(times$Time)
x <- paste(Cdates, Ctimes)
y <- as.POSIXct (x, format="%d/%m/%Y %H:%M:%S")

submeter1 <- data[7]
submeter2 <- data[8]
submeter3 <- data[9]
subm1 <- as.numeric(submeter1$Sub_metering_1)
subm2 <- as.numeric(submeter2$Sub_metering_2)
subm3 <- as.numeric(submeter3$Sub_metering_3)

voltage <- as.numeric(data[5]$Voltage)

grp<-as.numeric(data[4]$Global_reactive_power)

# PLOT 4 - PLot Four Plots on One Panel

par(mfrow=c(2,2))
par(bg="white")

plot(y,ngap, type="o", lty="solid", pch=".", ylab="Global Active Power", xlab="")

plot(y,voltage, type="o", lty="solid", pch=".", ylab="Voltage", xlab="datetime")

plot(y,subm1, type="o", lty="solid", pch=".", ylab="Energy sub metering", xlab="")
lines(y,subm2, type="o", lty="solid", pch=".", col="red")
lines(y,subm3, type="o", lty="solid", pch=".", col="blue")
legend("topright", legend=c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "), col=c("black", "red", "blue"), lty=1)

plot(y,grp, type="o", lty="solid", pch=".", ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, width=480, height=480, 'plot4.png')
dev.off()
