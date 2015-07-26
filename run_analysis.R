library(dplyr)

##download and unzip 
#temp<-tempfile()
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
#unzip(temp,exdir="data")
#unlink(temp)

# read in test and train datasets
train<-read.table("data/UCI HAR Dataset/train/X_train.txt")
test<-read.table("data/UCI HAR Dataset/test/X_test.txt")
#combine test and train data measurements
alldata<-rbind(train,test)
#read variable names into vector
features<-readLines("data/UCI HAR Dataset/features.txt")
#set features as columnames of alldata
names(alldata)=features

#identify columns with mean and standard deviation measurments
means<-grep("mean",names(alldata),ignore.case=TRUE)
stds<-grep("std",names(alldata),ignore.case=TRUE)

#select only these  and combine
meandata<-select(alldata,means)
stddata<-select(alldata,stds)
data<-cbind(meandata,stddata)

#read and combine activity labels from train and test, rename activity labels
trainLabels<-readLines("data/UCI HAR Dataset/train/Y_train.txt")
testLabels<-readLines("data/UCI HAR Dataset/test/Y_test.txt")
activity_labels<-readLines("data/UCI HAR Dataset/activity_labels.txt")
activity_labels<-gsub(".* ","",activity_labels ) #get rid of number in labels
activity<-factor(c(trainLabels,testLabels))
levels(activity)=activity_labels


#read and combine subject id's from train and test
subject_test<-readLines("data/UCI HAR Dataset/test/subject_test.txt")
subject_train<-readLines("data/UCI HAR Dataset/train/subject_train.txt")
subject<-c(subject_train,subject_test)


#combine activity and subject with data measurements 
data<-cbind(subject,activity,data)

#tidy up column names
#first remove number and space from each name
for (i in 3:length(names(data))){ names(data)[i]<-gsub(".* ","",names(data[i]))}
#then remove "()" 
for (i in 3:length(names(data))){ names(data)[i]<-gsub("()","",names(data[i]),fixed=TRUE)}
#then remove "-"
for (i in 3:length(names(data))){ names(data)[i]<-gsub("-","",names(data[i]),fixed=TRUE)}
#for readability replace "std" by "Std" and "mean" by "Mean"
for (i in 3:length(names(data))){ names(data)[i]<-gsub("std","Std",names(data[i]),fixed=TRUE)}
for (i in 3:length(names(data))){ names(data)[i]<-gsub("mean","Mean",names(data[i]),fixed=TRUE)}

#create tidy dataset with means for each variable by subject and activity
grouped<-group_by(data,subject,activity)
tidy<-summarise_each(grouped,funs(mean))