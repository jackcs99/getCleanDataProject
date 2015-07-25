## change to your working directory with the UCI folder
setwd("C:/Users/jackc_000/Desktop/r_code")

## load necessary libraries
library(plyr)
library(dplyr)

#read test data
s<- read.table("./UCI_har/test/subject_test.txt")
y<- read.table("./UCI_har/test/y_test.txt")
x<- read.table("./UCI_har/test/X_test.txt")

#combine test data with subject and activity columns 
#in first two columns respectively
z<-cbind(s,y,x)

#read training data
st<- read.table("./UCI_har/train/subject_train.txt")
yt<- read.table("./UCI_har/train/y_train.txt")
xt<- read.table("./UCI_har/train/X_train.txt")

#combine training data with subject and activity columns 
#in first two columns respectively
zt<-cbind(st,yt,xt)

#combine test and training frames
zm <- rbind(z,zt)

#get freature and activity descriptions
f<- read.table("./UCI_har/features.txt")
a<- read.table("./UCI_har/activity_labels.txt")

#label columns
names(zm)<- c("subject","activity",as.character(f[,2]))

# find all features with "mean" substring anywhere
ms <- c(TRUE,TRUE,(grepl("mean",f[,2]) | grepl("std",f[,2])))

#substitue activity category with description
zm_mean <- zm[,ms]
aa <- transmute(zm_mean,activity=a[activity,2])
#transmute made matrix, change to vector
aaa <- aa[,1]
#insert
zm_mean$activity <- aaa

#calculate means by groups
aveData <- ddply(zm_mean,c("subject","activity"),function(b) colMeans(b[,3:81]))

#write table
write.table(aveData,"averages.txt",row.name=FALSE)

#provide means to read and View table
test <- read.table("averages.txt")
View(test)