
## Reading the energy data
Power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
Power_data$Date <- as.Date(Power_data$Date, format="%d/%m/%Y")
Subdata<-subset (Power_data, Date >= "2007-02-01" & Date<= "2007-02-02")
rm(Power_data)
datetime <- paste(as.Date(Subdata$Date), Subdata$Time)
Subdata$Datetime <- as.POSIXct(datetime)
head(Subdata)

## Constructing PLOT 2
plot(Subdata$Datetime, Subdata$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

## Saving PLOT 2 to  a png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
