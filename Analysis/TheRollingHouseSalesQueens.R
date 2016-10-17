---
  title: "RollingHouseSalesQueens"
author: "Bama Parthasarathy"
date: "October 16, 2016"
output: html_document
---
  
  
  #require(gdata)
  #require(plyr) #Added by Monnie McGee
  #install the gdata and plyr packages and load in to R.
  library(plyr)
library(gdata)
setwd("C:\\Users\\GTX8WNS\\Desktop\\DoingDataScience")


## You need a perl interpreter to do this on Windows.
## It's automatic in Mac
bk <- read.csv("rollingsales_queens.csv",skip=4,header=TRUE)

# So, save the file as a csv and use read.csv instead

## Check the data

head(bk)
summary(bk)
str(bk) # Very handy function!

## clean/format the data with regular expressions
## More on these later. For now, know that the
## pattern "[^[:digit:]]" refers to members of the variable name that
## start with digits. We use the gsub command to replace them with a blank space.
# We create a new variable that is a "clean' version of sale.price.
# And sale.price.n is numeric, not a factor.
bk$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", bk$SALE.PRICE))
count(is.na(bk$SALE.PRICE.N))

names(bk) <- tolower(names(bk)) # make all variable names lower case
## Get rid of leading digits
bk$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$gross.square.feet))
bk$land.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$land.square.feet))
bk$year.built <- as.numeric(as.character(bk$year.built))

## do a bit of exploration to make sure there's not anything
## weird going on with sale prices
attach(bk)
# Explore histogram of sales prices
hist(sale.price.n,main = "Histogram of all sale prices", xlab = "Sale Price",breaks = 100, col = "red") 
detach(bk)

## keep only the actual sales
## keep only the records where sale price <> 0

bk.sale <- bk[bk$sale.price.n!=0,]
str(bk.sale)


plot(bk.sale$gross.sqft,bk.sale$sale.price.n, main ="default plot in example code")
plot(log(bk.sale$gross.sqft,base=10),log(bk.sale$sale.price.n,base=10),main ="plot log of sqft vs sale price")

## for now, let's look at 1-, 2-, and 3-family homes
bk.homes <- bk.sale[which(grepl("FAMILY",bk.sale$building.class.category)),]
dim(bk.homes)
plot(log10(bk.homes$gross.sqft),log10(bk.homes$sale.price.n))
summary(bk.homes[which(bk.homes$sale.price.n<100000),])


## remove outliers that seem like they weren't actual sales
bk.homes$outliers <- (log10(bk.homes$sale.price.n) <=5) + 0
bk.homes <- bk.homes[which(bk.homes$outliers==0),]
plot(log10(bk.homes$gross.sqft),log10(bk.homes$sale.price.n))


