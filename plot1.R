
## Reading the energy data
Power_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
Power_data$Date <- as.Date(Power_data$Date, format="%d/%m/%Y")
Subdata<-subset (Power_data, Date >= "2007-02-01" & Date<= "2007-02-02")
rm(Power_data)
head(Subdata)

## Constructing PLOT 1
hist(Subdata$Global_active_power, col = "red", xlab ="Global Active Power (kilowatts)", main = "Global Active Power")

## Saving PLOT 1 to  a png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
