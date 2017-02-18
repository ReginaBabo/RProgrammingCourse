
##################
# 2 - Lists in R #
##################

#Set current directory:
getwd()
setwd("C:/Users/Sergio/Workspace/RStudio/RProgrammingCourse/data")
getwd()

util <- read.csv("Machine-Utilization.csv")
head(util, 12)
str(util)
summary(util)

#Derive utilization column:
util$Utilization <- (1 - util$Percent.Idle)
head(util, 12)

