
##################
# 2 - Lists in R #
##################

#Set current directory:
getwd()
setwd("./RProgrammingCourse/data")
getwd()

util <- read.csv("Machine-Utilization.csv")
head(util, 12)
str(util)
summary(util)

#Derive utilization column:
util$Utilization <- (1 - util$Percent.Idle)
head(util, 12)

#Handling date-times:
tail(util)

?POSIXct
util$PosixTime <- as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")
head(util, 12)
typeof(util$PosixTime)
summary(util)

#Rearrange collumns in a DF:
util$Timestamp <- NULL
util <- util[,c(4,1,2,3)]
head(util)

#What is a list?
summary(util)
RL1 <- util[util$Machine=="RL1",]

summary(RL1)
RL1$Machine <- factor(RL1$Machine)
summary(RL1)

#Construct list:

#Utilization vector:
util_stats_rl1 <- c(min(RL1$Utilization, na.rm=T),
                    mean(RL1$Utilization, na.rm=T),
                    max(RL1$Utilization, na.rm=T))
util_stats_rl1

#Utilization logical:
RL1$Utilization < 0.90
which(RL1$Utilization < 0.90)
length(which(RL1$Utilization < 0.90)) > 0

util_under_90_flag <- (length(which(RL1$Utilization < 0.90)) > 0)
util_under_90_flag

list_rl1 <- list("RL1", util_stats_rl1, util_under_90_flag)
list_rl1

#Naming components of a list:
names(list_rl1)
names(list_rl1) <- c("Machine", "Stats", "LowThreshold")
list_rl1

#Another way:
rm(list_rl1)
list_rl1 <- list(Machine="RL1", Stats=util_stats_rl1, LowThreshold=util_under_90_flag)
list_rl1

#Extracting components of a list:
# [] - Will always return a list.
# [[]] - Will return the actual object.
# $ - Same as [[]] but prettier.

list_rl1
list_rl1[1]
typeof(list_rl1[1])

list_rl1[[1]]
typeof(list_rl1[[1]])

list_rl1$Machine
typeof(list_rl1$Machine)

list_rl1[[2]]
typeof(list_rl1[[2]])
list_rl1[[2]][3]
list_rl1$Stats[3]

#Adding and deleting list components:
list_rl1
list_rl1[4] <- "New information"
list_rl1

list_rl1$UnkownHours <- RL1[is.na(RL1$Utilization),"PosixTime"]
list_rl1

#Remove a component:
list_rl1[4] <- NULL
list_rl1

list_rl1$Data <- RL1

summary(list_rl1)
str(list_rl1)

#Subsetting a list:
list_rl1$UnkownHours[1]
list_rl1[[4]][1]

list_rl1[1:2]
list_rl1[c(1,4)]
list_rl1[c("Machine", "Stats")]

#Building a timeseries plot:
library(ggplot2)

p <- ggplot(data=util, aes(x=PosixTime, y=Utilization, colour=Machine))
myplot <- p + geom_line(size=1.2) +
    facet_grid(Machine~.) +
    geom_hline(yintercept=0.90, colour="Gray", size=1.2, linetype=3)

list_rl1$Plot <- myplot
list_rl1
