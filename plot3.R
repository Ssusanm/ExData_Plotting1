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
with(febdata,(plot(c(DateTime,DateTime,DateTime),
     c(Sub_metering_1,Sub_metering_2,Sub_metering_3),
     type="n",ylab="Engergy Sub Metering",xlab="")))
        lines(febdata$DateTime,febdata$Sub_metering_1)
        lines(febdata$DateTime,febdata$Sub_metering_2,col="red")
        lines(febdata$DateTime,febdata$Sub_metering_3,col="blue")  
        legend("topright",lwd=2,col=c("black","red","blue"),
                legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))    
dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!