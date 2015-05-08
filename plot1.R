#load the data to R
powerfile <- read.table("./household_power_consumption.txt",head=TRUE,sep=";",stringsAsFactors=FALSE)
#subsetting to get only feb 01 and 02 data
febdata <- powerfile[powerfile$Date %in% c("1/2/2007","2/2/2007"),]
febdata <- transform(febdata,Date=as.Date(Date,"%d/%m/%Y"),
                             #Time=strptime(Time,format="%I:%M:%S"),
                             Global_active_power=as.numeric(Global_active_power),
                             Global_reactive_power=as.numeric(Global_reactive_power),
                             Voltage=as.numeric(Voltage),
                             Global_intensity=as.numeric(Global_intensity),
                             Sub_metering_1=as.numeric(Sub_metering_1),
                             Sub_metering_2=as.numeric(Sub_metering_2)       
                             )
windows() #calling to have the graph displayed on windows screen
hist(febdata$Global_active_power,col="red",
           main = "Global Active Power", #main title for hist
           xlab="Global Active Power(kilowatts)", # label x axis
           bg = "white"
     )
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!