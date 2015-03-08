filename <- "plot2"

# Plotting Func
graph <- function (data) {
	plot(data$Global_active_power, type = "l",
		ylab = "Global Active Power (kilowatts)",
		xaxt = "n",
		xlab = ""
	)

	end <- length(data$Global_active_power)
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
