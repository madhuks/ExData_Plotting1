## Coursera: Exploratory data analysiS: Course Project 1
## Plot 4
library(lubridate)
library(dplyr)
data_file <- "./Data/household_power_consumption.txt"
data <- read.table(data_file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec = ".",na.strings = "?")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]  # Selecting relevent data
sub_data$Date <- as.Date(sub_data$Date,format="%d/%m/%Y")   # casting right classes
datetime <- paste((as.Date(sub_data$Date)),sub_data$Time)
sub_data$datetime <- as.POSIXct(datetime)
## Create plot and save to png file
png(file="plot4.png")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))   # Set layout and margins 
with(sub_data, {
    plot(Global_active_power~datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()
