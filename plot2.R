#Exploratory Data Analysis (Coursera)
##File: Course Project 1: Plot 2
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

#Plot 2
png(filename="plot2.png", width=480, height=480, units="px")
plot(courseproj$DateTime2,courseproj$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(courseproj$DateTime2,courseproj$Global_active_power, lwd=1.5)
dev.off()