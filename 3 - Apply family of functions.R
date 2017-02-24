
###################################
# 3 - "Apply" family of functions #
###################################

getwd()
setwd("./data/Weather Data")
getwd()

#Read data:
Chicago <- read.csv("Chicago-C.csv", row.names=1)
Houston <- read.csv("Houston-C.csv", row.names=1)
NewYork <- read.csv("NewYork-C.csv", row.names=1)
SanFrancisco <- read.csv("SanFrancisco-C.csv", row.names=1)

Chicago
Houston
NewYork
SanFrancisco

is.data.frame(Chicago)

#Convert to matrices:
Chicago <- as.matrix(Chicago)
Houston <- as.matrix(Houston)
NewYork <- as.matrix(NewYork)
SanFrancisco <- as.matrix(SanFrancisco)

is.matrix(Chicago)

#Create a list:
Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
Weather

Weather$Chicago

#Using apply():
?apply

Chicago
apply(Chicago, 1, mean)
apply(Chicago, 1, max)
apply(Chicago, 1, min)

#Compare:
apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)

#Recreating apply() with loops:
output <- NULL

for(i in 1:5) {
    output[i] <- mean(Chicago[i,])
}

output
names(output) <- rownames(Chicago)
output

#Using lapply():
?lapply

Chicago
t(Chicago) #Transpose function

Weather
lapply(Weather, t)



