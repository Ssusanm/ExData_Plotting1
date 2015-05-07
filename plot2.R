#load the data to R
powerfile <- read.table("./household_power_consumption.txt",head=TRUE,sep=";",stringsAsFactors=FALSE)
#subsetting to get only feb 01 and 02 data
febdata <- powerfile[powerfile$Date %in% c("1/2/2007","2/2/2007"),]
febdata <- transform(febdata,Date=as.Date(Date,"%d/%m/%Y"),
                             DateTime=strptime(paste(Date,Time,sep=" "),format="%Y-%m-%d %H:%M:%S"),
                             Global_active_power=as.numeric(Global_active_power),
                             Global_reactive_power=as.numeric(Global_reactive_power),
                             Voltage=as.numeric(Voltage),
                             Global_intensity=as.numeric(Global_intensity),
                             Sub_metering_1=as.numeric(Sub_metering_1),
                             Sub_metering_2=as.numeric(Sub_metering_2)       
                             )

windows() #calling to have the graph displayed on windows screen
#while plotting using Type="c" to supress the pch points and then adding line to it
plot(febdata$DateTime,febdata$Global_active_power,type="c",ylab="Global Active Power(kilowatts)",xlab="")
lines(febdata$DateTime,febdata$Global_active_power)
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!