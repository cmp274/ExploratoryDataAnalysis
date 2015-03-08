#Exploratory Data Analysis (Coursera)
##File: Course Project 1: Plot 4
##Name: Christine Prosperi

setwd("C:/Users/cprosperi/Documents/Exploratory Data Analysis")

#Read in data, skip the first set and only read in the records from 2/1/2007-2/2/2007
courseproj <- read.table("household_power_consumption.txt", sep = ";", skip=66637, nrows=2881)
#Define the column names
names <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Assign the names to the columns in the dataset
colnames(courseproj) <- names

#Convert date 
courseproj$Date <- as.Date(courseproj$Date, format="%d/%m/%Y")
#Paste date and time variables
courseproj$DateTime <- paste(courseproj$Date, courseproj$Time)
#Convert format of date-time variable
courseproj$DateTime2 <- strptime(courseproj$DateTime, format="%Y-%m-%d %H:%M:%S")
#Create new variable identifying the day of the week
courseproj$Day <- weekdays(courseproj$DateTime2, abbr = TRUE)

#Plot 4
png(filename="plot4.png", width=480, height=480, units="px")
par(mfcol = c(2,2), mar= c(4,4,2,1))
#Top left = Plot 2
plot(courseproj$DateTime2,courseproj$Global_active_power, xlab="", ylab="Global Active Power", type="n")
lines(courseproj$DateTime2,courseproj$Global_active_power, lwd=1.5)
#Bottom left = Plot 3
plot(courseproj$DateTime2,courseproj$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(courseproj$DateTime2,courseproj$Sub_metering_1, lwd=1.5, col="black")
lines(courseproj$DateTime2,courseproj$Sub_metering_2, lwd=1.5, col="red")
lines(courseproj$DateTime2,courseproj$Sub_metering_3, lwd=1.5, col="blue")
leg.txt <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
leg.col <- c("black","red","blue")
legend("topright", legend=leg.txt, col=leg.col, lty=1.5, bty="n")
#Top right
plot(courseproj$DateTime2,courseproj$Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(courseproj$DateTime2,courseproj$Voltage, lwd=1.5)
#Bottom right
plot(courseproj$DateTime2,courseproj$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n", ylim = c(0.0,0.5), las=1,cex.lab=1, cex.axis=1)
lines(courseproj$DateTime2,courseproj$Global_reactive_power, lwd=1.5, ylim = c(0.0,0.5), las=1,cex.lab=1, cex.axis=1)
dev.off()