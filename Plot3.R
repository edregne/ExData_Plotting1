library(lubridate)

pwr_data <- read.table("household_power_consumption.txt", 
                       header = TRUE, 
                       sep = ";", 
                       colClasses = c("character","character", rep("numeric",7)), 
                       na.strings = "?")

pwr <- subset(pwr_data,pwr_data$Date=="1/2/2007" | pwr_data$Date == "2/2/2007")

pwr$Date <- as.Date(pwr$Date, format = "%d/%m/%Y")

pwr$Month <- month(as.POSIXlt(pwr$Date, format="%d/%m/%Y"))
pwr$Year <- year(as.POSIXlt(pwr$Date, format="%d/%m/%Y"))
pwr$Day <- day(as.POSIXlt(pwr$Date, format="%d/%m/%Y"))
pwr$WeekDay <- as.POSIXct(paste(pwr$Date, pwr$Time))


png(filename="Plot3.png", width = 480, height = 480)

plot(pwr$WeekDay, pwr$Sub_metering_1,
     "n",
     xlab = "",
     ylab = "Energy sub metering")

points(pwr$WeekDay, pwr$Sub_metering_1, type = "line")

points(pwr$WeekDay, pwr$Sub_metering_2, type = "line", col = "red")

points(pwr$WeekDay, pwr$Sub_metering_3, type = "line", col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))

dev.off()