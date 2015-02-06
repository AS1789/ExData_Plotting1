## Exploratory Data Analysis Assignment 1 plot 2
## Read in the data - the zip file containing the compressed data is 
## expected to be in the working directory

mydata<-read.csv(unz("exdata-data-household_power_consumption.zip", 
                 "household_power_consumption.txt"),header=TRUE,sep=";")

## select the (2880) observations to be plotted
shortdata<-subset(mydata,Date=="1/2/2007"|Date=="2/2/2007")

## construct the x axis time variable from the Date and Time read in
dt<-paste(shortdata$Date,shortdata$Time)
dt1<-strptime(dt,"%d/%m/%Y%H:%M:%S")

## force the other variables to be treated as numerics not factors
sm1<-as.numeric(as.character(shortdata$Sub_metering_1))
sm2<-as.numeric(as.character(shortdata$Sub_metering_2))
sm3<-as.numeric(as.character(shortdata$Sub_metering_3))
gap<-as.numeric(as.character(shortdata$Global_active_power))
grp<-as.numeric(as.character(shortdata$Global_reactive_power))
volt<-as.numeric(as.character(shortdata$Voltage))

## produce the plot
plot(dt1,gap,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(dt1,gap)

## export to a png file
dev.copy(png,file="plot2.png")
dev.off()