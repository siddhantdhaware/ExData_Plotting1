filename <- "plot1"

# Plotting Func
graph <- function (data) {
	hist(data$Global_active_power, col = "red",
			 main = "Global Active Power",
			 xlab = "Global Active Power (kilowatts)"
	)
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
	
	# Convert Dates and Times from Strings to R Readable Formats
	data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
	data$Time <- strptime(data$Time, format = "%H:%M:%S")
	
	data
}

main()
