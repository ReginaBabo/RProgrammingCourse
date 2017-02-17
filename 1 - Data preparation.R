
########################
# 1 - Data preparation #
########################

#Set current directory:
getwd()
setwd("C:/Users/Sergio/Workspace/RStudio/RProgrammingCourse/data")
getwd()

#Read data file:
#Basic import fin <- read.csv("Future-500.csv")
fin <- read.csv("Future-500.csv", na.strings=c(""))

head(fin)
tail(fin, 10)

str(fin)
summary(fin)

#Convert to factor:
fin$ID <- as.factor(fin$ID)
fin$Inception <- as.factor(fin$Inception)

str(fin)

#Factor Variable Trap (FVT):
#Converting characters to numerics:
a <- c("12", "13", "14", "12", "12")
typeof(a)

b <- as.numeric(a)
b
typeof(b)

#Converting factors to numerics:
z <- factor(a <- c("12", "13", "14", "12", "12"))
typeof(z)

#Wrong way:
y <- as.numeric(z)
y
typeof(y)

#Right way
x <- as.numeric(as.character(z))
x
typeof(x)

#FVT example:

head(fin)
str(fin)

#Wrong way:
#fin$Profit <- factor(fin$Profit)
#str(fin)

#fin$Profit <- as.numeric(fin$Pro)
#str(fin)

#Character substitution:
?sub #Replace first instance of pattern
?gsub #Replace all instances of pattern

fin$Expenses <- gsub(" Dollars", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
fin$Expenses

str(fin)

fin$Revenue <- gsub("\\$", "", fin$Revenue)
fin$Revenue <- gsub(",", "", fin$Revenue)
fin$Revenue

fin$Growth <- gsub("%", "", fin$Growth)
fin$Growth <- gsub(",", "", fin$Growth)
fin$Growth

#Convert to numeric
fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)

str(fin)
summary(fin)

#Dealing with missing data:
    #1. Predict with 100% accuracy
    #2. Leave record as is
    #3. Remove record entirely
    #4. Replace with mean or median
    #5. Fill in by exploring correlations and similarities

#Missing values (NA):
?NA #Not Available

TRUE #1
FALSE #0
NA

TRUE == FALSE
TRUE == 5
FALSE == FALSE
FALSE == 0
NA == TRUE
NA == FALSE
NA == NA

#Locating missing data:
head(fin, 24)
complete.cases(fin)
fin[complete.cases(fin),]
fin[!complete.cases(fin),]

# fin <- read.csv("Future-500.csv", na.strings=c(""))

#Filtering for non-missing data:
fin[fin$Revenue == 9746272 , ] #Contains NAs
which(fin$Revenue == 9746272)
?which
fin[which(fin$Revenue == 9746272),]
fin[which(fin$Employees == 45),]


#Filtering for missing data:
head(fin, 24)

fin == NA
fin[fin$Expenses == NA,]

is.na(fin$Expenses)
fin[is.na(fin$Expenses),]

#Removing records with missing data:
fin_backup <- fin

fin[!complete.cases(fin),]
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),]

fin <- fin[!is.na(fin$Industry),]
fin[is.na(fin$Industry),]
fin[!complete.cases(fin),]

#Resetting the dataframe index:
rownames(fin) <- 1:nrow(fin)
rownames(fin)

rownames(fin) <- NULL
rownames(fin)

