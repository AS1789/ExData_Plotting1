## Exploratory Data Analysis Assignment 1 plot 4
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

## successive plots in 2 by 2 frame, columnwise

par(mfcol=c(2,2))

## top left plot in frame

plot(dt1,gap,xlab="",ylab="Global Active Power",type="n")
lines(dt1,gap)

## bottom left plot in frame
## assemble one long pair of variables and a factor to index the lines plotted
sm<-c(sm1,sm2,sm3)
smf<-as.factor(rep(c(1,2,3),each=2880))
dt2<-c(dt1,dt1,dt1)
plot(dt2,sm,xlab="",ylab="Energy sub metering",type="n")
lines(dt2[smf==1],sm[smf==1])
lines(dt2[smf==2],sm[smf==2],col="Red")
lines(dt2[smf==3],sm[smf==3],col="Blue")
legend("topright",
        c("Sub_metering_1    ","Sub_metering_2    ","Sub_metering_3    "),
        lty=c(1,1,1),col=c("Black","Red","Blue"),bty="n")

## top right plot in frame

plot(dt1,volt,xlab="datetime",ylab="Voltage",type="n")
lines(dt1,volt)

## bottom right plot in frame

plot(dt1,grp,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(dt1,grp)

## export to a png file

dev.copy(png,file="plot4.png")
dev.off()