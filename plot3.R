##Reading the Data into data
data<- read.csv("C:\\Users\\prpuri\\Downloads\\Exploratory Data Analysis\\exdata-data-household_power_consumption\\household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
##Converting the Date field to Date format
data$Date=strptime(data$Date,"%d/%m/%Y")
## Subsetting the data with the required date
sub_data <- data[which(data$Date=='2007-02-01' | data$Date=='2007-02-02'),]
rm(data)
## Converting dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

## Making the plot
plot(sub_data$Sub_metering_1~sub_data$Datetime, type="l",ylab="Energy sub meeting", xlab="")
lines(sub_data$Sub_metering_2~sub_data$Datetime, type="l",col="red")
lines(sub_data$Sub_metering_3~sub_data$Datetime, type="l",col="blue")

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()