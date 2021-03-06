
## Reading the energy data
Power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
Power_data$Date <- as.Date(Power_data$Date, format="%d/%m/%Y")
Subdata<-subset (Power_data, Date >= "2007-02-01" & Date<= "2007-02-02")
rm(Power_data)
datetime <- paste(as.Date(Subdata$Date), Subdata$Time)
Subdata$Datetime <- as.POSIXct(datetime)
head(Subdata)

## Construct PLOT 4

par(mfrow=c(2,2))
with (Subdata, {
	plot(Datetime, Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")	
	plot(Datetime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
	plot (Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
     lines(Datetime, Sub_metering_2, col = "red")
     lines(Datetime, Sub_metering_3, col = "blue")
     legend("topright", lty= 1, col = c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
     plot(Datetime, Global_reactive_power, ylab = "Global Reactive Power", xlab = "datetime", type = "l")
})

## Saving PLOT 4 to  a png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

