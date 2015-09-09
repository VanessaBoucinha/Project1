#Read the original document
household_power_consumption <- read.csv("C:/Users/Utilizador/Desktop/Rstudio/Data analysis/household_power_consumption.txt",header=TRUE, sep=";")

#Change the name of the first column 
colnames(household_power_consumption)<-c("Date2","Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Change the Date to a character with the Date caracteristics
household_power_consumption$Date2<-as.Date(as.character(household_power_consumption$Date2),"%d/%m/%Y")

#create a new table only with the date necessary
final_Date<-subset(household_power_consumption,Date2=="2007-02-01"|Date2=="2007-02-02")

#change metering to a numeric
final_Date$Sub_metering_1=as.numeric(as.character(final_Date$Sub_metering_1))
final_Date$Sub_metering_2=as.numeric(as.character(final_Date$Sub_metering_2))
final_Date$Sub_metering_3=as.numeric(as.character(final_Date$Sub_metering_3))

#join the Date with time
Date_Time<-paste(final_Date$Date2,as.character(final_Date$Time))
Date_Time<-strptime(Date_Time,"%Y-%m-%d %H:%M:%S")

#plot the graph
win.graph(width = 4.80,height = 4.80)
plot(Date_Time,final_Date$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(Date_Time,final_Date$Sub_metering_2,type = "l",col="red")
lines(Date_Time,final_Date$Sub_metering_3,type = "l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red", "blue"),lwd=1,cex=0.7)
