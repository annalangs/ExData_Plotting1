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

# PLOT 2
# Plot the time series for Global Active Power
par(bg="white")
gap <- data[3]
ngap<-as.numeric(gap$Global_active_power)

dates<-data[1]
times<-data[2]
Cdates<-as.character(dates$Date)
Ctimes<-as.character(times$Time)
x <- paste(Cdates, Ctimes)
y <- as.POSIXct (x, format="%d/%m/%Y %H:%M:%S")

plot(y,ngap, type="o", lty="solid", pch=".", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, width=480, height=480, 'plot2.png')
dev.off()

