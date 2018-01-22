## Coursera: Exploratory data analysiS: Course Project 1
## Plot 2
library(lubridate)
library(dplyr)
data_file <- "./Data/household_power_consumption.txt"
data <- read.table(data_file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec = ".",na.strings = "?")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]  # Selecting relevent data
sub_data$Date <- as.Date(sub_data$Date,format="%d/%m/%Y")   # casting right classes
datetime <- paste((as.Date(sub_data$Date)),sub_data$Time)
sub_data$datetime <- as.POSIXct(datetime)
## Create plot and save to png file
png(file="plot2.png")
with(sub_data, {
    plot(Global_active_power~datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()
