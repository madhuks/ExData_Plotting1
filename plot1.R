## Coursera: Exploratory data analysis: Course Project 1
## Plot 1
library(lubridate)
library(dplyr)
data_file <- "./Data/household_power_consumption.txt"
data <- read.table(data_file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec = ".",na.strings = "?")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]  # Selecting relevent data
## Create plot and save to png file
png(file="plot1.png")
hist(as.numeric(sub_data$Global_active_power),main="Global Active Power", col="Red",xlab="Global 
     Active Power (kilowatts)", ylab="Frequency")
dev.off()
