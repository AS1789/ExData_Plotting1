## Exploratory Data Analysis Assignment 1 plot 1
## Read in the data - the zip file containing the compressed data is 
## expected to be in the working directory

mydata<-read.csv(unz("exdata-data-household_power_consumption.zip", 
                 "household_power_consumption.txt"),header=TRUE,sep=";")

## select the (2880) observations to be plotted
shortdata<-subset(mydata,Date=="1/2/2007"|Date=="2/2/2007")

## force the variable to be plotted to be treated as a numeric not factor
gap<-as.numeric(as.character(shortdata$Global_active_power))

## produce the plot (note that colour Red appears best match)
hist(gap,main="Global Active Power",xlab="Global Active Power (kilowatts)",
      col="Red")

##export to a png file
dev.copy(png,file="plot1.png")
dev.off()