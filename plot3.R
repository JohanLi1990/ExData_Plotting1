#... Plot1.R... 

# ---- Objective 1: Get the subset of data
library(plyr)
library(dplyr)
hh_pow <- read.table("household_power_consumption.txt", 
                     header = TRUE, sep = ";", na.strings = "?")
hh_pw1 <- filter(hh_pow, Date == c("1/2/2007", "2/2/2007"))
#..Here i got a warning message--
# Warning messages:
#   1: In is.na(e1) | is.na(e2) :
#   longer object length is not a multiple of shorter object length
# 2: In `==.default`(c(326L, 326L, 326L, 
#                     326L, 326L, 326L, 326L, 326L,  :
#                   longer object length is not a multiple of shorter object length
rm(hh_pow)

# When I was doing the assignment, I referred to the thread below. 
# https://class.coursera.org/exdata-033/forum/thread?thread_id=15
# credit has to be given to Micheal Jackson who had shown his methods in that thread. 


hh_pw1$Date_Time <- paste(hh_pw1$Date, hh_pw1$Time, sep = " ")
hh_pw1$Date_Time <- strptime(hh_pw1$Date_Time, format = "%d/%m/%Y %H:%M:%S")

hh_pw1$Date <- as.Date(hh_pw1$Date)
#hh_pw1 <- select(hh_pw1, -(Date:Time))

#----Requirements for Graphs-------
# Construct the plot and save it to a PNG file with 
# a width of 480 pixels and a height of 480 pixels.
png("plot3.png", bg = "transparent", height = 480, width = 480)
plot(hh_pw1$Date_Time, hh_pw1$Sub_metering_1, col = "black", type = "l",
     ylab = "Energy Sub Metering", xlab = "")
lines(hh_pw1$Date_Time, hh_pw1$Sub_metering_2, col = "red")
lines(hh_pw1$Date_Time, hh_pw1$Sub_metering_3, col = "blue")
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2"
                                                                        ,"Sub metering 3"))

dev.off()



