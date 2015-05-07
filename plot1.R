##Reading the Data into data
data=read.table("C:\\Users\\prpuri\\Downloads\\Exploratory Data Analysis\\exdata-data-household_power_consumption\\household_power_consumption.txt",sep=';',header=TRUE)
##Converting the Date field to Date format
data$Date=strptime(data$Date,"%d/%m/%Y")
##Converting the Time field to Time Format
data$Time=strptime(data$Time,"%H:%M:%S")
##Finding the missing values i.e value with'?'
missing=list(which(data$Global_active_power=='?'),which(data$Global_reactive_power=='?'),which(data$Voltage=='?'),which(data$Global_intensity=='?'),which(data$Sub_metering_1=='?'),which(data$Sub_metering_2=='?'))
##now finding the common values between all the columns
common=Reduce(intersect,missing)
##Generating a sequence from 1 to number of rows so that i can exclude the "common" rows from this
sequence=seq(1:dim(data)[1])
##sepearting the rows which are not needed
needed_rows=setdiff(sequence,common)
##Finding the dataset with no missiing values
data_needed=data[needed_rows,]
##Selecting those rows with the specified dates
dataset=data_needed[which(data$Date=='2007-02-01' | data$Date=='2007-02-02'),]
##Converting to data frame to ease work later
datatbl=as.data.frame(dataset)
##Convertiing factor variable to numeric
datatbl$Global_active_power=as.numeric(datatbl$Global_active_power)
##Converting to kilowatts
datatbl$Global_active_power=datatbl$Global_active_power/500
##Drawing the histogram
hist(datatbl$Global_active_power,main="Global Active Power",col="red",xlab="Golbal Active Power (kilowatts)")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()