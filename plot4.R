# plot4.R creates plot4.png
#
# 4 Exploratory Data Analysis : Week 1 Assignment
#
# 20060306 1.00 Rajeev Rohatgi
# ----- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- 
# Read data file, which is already in working directory, into dataframe DF
DF <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

# Augment with a Date2 column using as.Date()
DF$Date2 <- as.Date(DF$Date,format="%d/%m/%Y")

# Filter dates of interest using subset command (Feb 1=>2, 2007), into smaller DF2
DF2 <- subset(DF,Date2 %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Augment with a Time2 column using as.POSIXct
DF2$Time2 <- with(DF2,as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))
# ----- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- 
png(file="plot4.png")
    par(mfrow=c(2,2))
    
    plot(DF2$Time2,DF2$Global_active_power,type="n",
        ylab="Global Active Power (kilowatts)",xlab="")
    lines(DF2$Time2,DF2$Global_active_power)
    
    plot(DF2$Time2,DF2$Voltage,type="n",
         ylab="Voltage",xlab="datetime")
    lines(DF2$Time2,DF2$Voltage)
    
    plot(DF2$Time2,DF2$Sub_metering_1,type="n",
         ylab="Energy sub metering",xlab="")
    lines(DF2$Time2,DF2$Sub_metering_1,col="black")
    lines(DF2$Time2,DF2$Sub_metering_2,col="red")
    lines(DF2$Time2,DF2$Sub_metering_3,col="blue")
    legend(x="topright",lty=1,lwd=1,bty="n",
           col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    )

    plot(DF2$Time2,DF2$Global_reactive_power,type="n",
         ylab="Global_reactive_power",xlab="datetime")
    lines(DF2$Time2,DF2$Global_reactive_power)
    
dev.off()
# ----- ------- ------- ------- ------- ------- ------- ------- ------- ----end plot1.R -------
