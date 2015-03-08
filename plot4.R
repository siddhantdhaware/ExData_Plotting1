filename <- "plot4"

# Plotting Func
graph <- function (data) {
	
	par(mfcol = c(2, 2))
	globalActivePowerGraph(data)
	energySubMeteringGraph(data)
	VoltageGraph(data)
	GlobalReactivePowerGraph(data)

}

globalActivePowerGraph <- function (data) {
	plot(data$Global_active_power, type = "l",
			 ylab = "Global Active Power",
			 xaxt = "n",
			 xlab = ""
	)
	
	end <- length(data$Global_active_power)
	at <- c(0, end / 2, end)
	
	axis(1, at, labels = c("Thu", "Fri", "Sat"))
}

energySubMeteringGraph <- function (data) {
	plot(
		data$Sub_metering_1,
		type = "n",
		ylab = "Energy sub metering",
		xaxt = "n",
		xlab = ""
	)
	
	
	points(data$Sub_metering_1, type = "l", col = "black")
	points(data$Sub_metering_2, type = "l", col = "red")
	points(data$Sub_metering_3, type = "l", col = "blue")
	
	end <- max(
		length(data$Sub_metering_1),
		length(data$Sub_metering_2),
		length(data$Sub_metering_3)
	)
	
	at <- c(0, end / 2, end)
	
	axis(1, at, labels = c("Thu", "Fri", "Sat"))
	
	legend("topright",
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		col = c("black", "red", "blue"),
		lty=c(1,1)
	)
	
}

VoltageGraph <- function (data) {
	plot(data$Voltage, type = "l",
			 ylab = "Voltage",
			 xaxt = "n",
			 xlab = "datetime"
	)
	
	end <- length(data$Voltage)
	at <- c(0, end / 2, end)
	
	axis(1, at, labels = c("Thu", "Fri", "Sat"))
}

GlobalReactivePowerGraph <- function (data) {
	plot(data$Global_reactive_power, type = "l",
			 ylab = "Global_reactive_power",
			 xaxt = "n",
			 xlab = "datetime"
	)
	
	end <- length(data$Global_reactive_power)
	at <- c(0, end / 2, end)
	
	axis(1, at, labels = c("Thu", "Fri", "Sat"))
}

#---------------------------------------

main <- function() {
	data <- loadData()
	png(paste(filename, "png", sep = "."))
	graph(data)
	dev.off()
	print(paste(filename, ".png", " Saved!", sep = ""))
}

loadData <- function() {
	data <- read.table("data.txt", sep = ";", na.string = "?", header = TRUE)
	
	data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
	data$Time <- strptime(data$Time, format = "%H:%M:%S")
	
	data
}

main()
