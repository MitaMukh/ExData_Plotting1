
## Reading the energy data
Power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
Power_data$Date <- as.Date(Power_data$Date, format="%d/%m/%Y")
Subdata<-subset (Power_data, Date >= "2007-02-01" & Date<= "2007-02-02")
rm(Power_data)
datetime <- paste(as.Date(Subdata$Date), Subdata$Time)
Subdata$Datetime <- as.POSIXct(datetime)
head(Subdata)

## Constructing PLOT 3
with (Subdata, plot (Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(Subdata, lines(Datetime, Sub_metering_2, col = "red"))
with(Subdata, lines(Datetime, Sub_metering_3, col = "blue"))
legend("topright", lty= 1, col = c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

## Saving PLOT 3 to  a png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

