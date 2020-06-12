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
pwr$WeekDay <- weekdays(pwr$Date)


png(filename="Plot1.png", width = 480, height = 480)

hist(pwr$Global_active_power,
    col="red", 
    main="Global Active Power", 
    xlab="Global Active Power (kilowatts)")

dev.off()