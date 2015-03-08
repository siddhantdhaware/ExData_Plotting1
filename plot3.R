filename <- "plot3"

# Plotting Func
graph <- function (data) {
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
	
	legend("topright", legend = c("Sub_metering_1",
			"Sub_metering_2",
			"Sub_metering_3"),
			col = c("black", "red", "blue"),
			lty=c(1,1))
	
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
