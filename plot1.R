# plot1.R creates plot1.png
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
# ----- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- ------- 
png(file="plot1.png")
hist(DF2$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
# ----- ------- ------- ------- ------- ------- ------- ------- ------- ----end plot1.R -------
