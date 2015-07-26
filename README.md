---
title: "README"
author: "Elisa Lerner"
date: "26 July 2015"
output: html_document
---
This is the R script which reproduces the tidy data required by the project:  

```{r eval=FALSE}
library(dplyr)  
```
Firstly the dplyr package needs to be installed so it will be possible to use commands from this package.  

```{r eval=FALSE}
##download and unzip 
#temp<-tempfile()
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
#unzip(temp,exdir="data")
#unlink(temp)
```
This part of the script downloads and unzips the dataset from the source given in the project. It has been commented out because in the project instructions it is assumed that the Samsung data is in your working directory. It is assumed that the dataset has been saved in a folder called "data".  


##Step 1:Merges the training and the test sets to create one data set.
```{r eval=FALSE}
# read in test and train datasets
train<-read.table("data/UCI HAR Dataset/train/X_train.txt")
test<-read.table("data/UCI HAR Dataset/test/X_test.txt")
#combine test and train data measurements
alldata<-rbind(train,test)
#read variable names into vector
features<-readLines("data/UCI HAR Dataset/features.txt")
#set features as columnames of alldata
names(alldata)=features
```
The data obtained from the 30 subjects were divided into train and test components.Both components are downloaded and then combined into one data table called "alldata". The rows from the training data are above the rows from the test data.The names of the variables measured in the experiment are to be found in the features document. The names are downloaded and set as the column names of the data table.  


##Step 2:Extracts only the measurements on the mean and standard deviation for each measurement. 
```{r eval=FALSE}
#identify columns with mean and standard deviation measurments
means<-grep("mean",names(alldata),ignore.case=TRUE)
stds<-grep("std",names(alldata),ignore.case=TRUE)

#select only these  and combine
meandata<-select(alldata,means)
stddata<-select(alldata,stds)
data<-cbind(meandata,stddata)
```
Columns whose names include the word "mean" or "std" are first identified and then extracted. First the variables with "mean" in their names are extracted  to a new data table,and then the variables with "std" in their names are extracted to another data table. These two new tables are combined to  new table called "data", where the standard deviation columns are after (to the right of) the mean columns.  

##Step 3:Uses descriptive activity names to name the activities in the data set
```{r eval=FALSE}
#read and combine activity labels from train and test, rename activity labels
trainLabels<-readLines("data/UCI HAR Dataset/train/Y_train.txt")
testLabels<-readLines("data/UCI HAR Dataset/test/Y_test.txt")
activity_labels<-readLines("data/UCI HAR Dataset/activity_labels.txt")
activity_labels<-gsub(".* ","",activity_labels ) #get rid of number in labels
activity<-factor(c(trainLabels,testLabels))
levels(activity)=activity_labels
```
There are 6 types of activity in the experiment. The type of activity measured in each row of the data needs to be read into a vector from the separate files where they were recorded. The activities in each row of the training data was recorded in a separate file from the activities in each row of the test data. In the files the activities are recorded as a number between 1 and 6. These are read in R separately, and the names of the activities corresponding to each number are read from the activity_labels file. The number part of the label is removed from the name of each activity label (using the gsub function), leaving a  purely descriptive label.  
The activities read from the two files are then combined into a factor vector, called "activity", where each number is a level. The levels are then reset to the descriptive labels that have been generated.  

```{r eval=FALSE}
#read and combine subject id's from train and test
subject_test<-readLines("data/UCI HAR Dataset/test/subject_test.txt")
subject_train<-readLines("data/UCI HAR Dataset/train/subject_train.txt")
subject<-c(subject_train,subject_test)

#combine activity and subject with data measurements 
data<-cbind(subject,activity,data)
```
This step is not explicitly requested in the instructions but in Step 5 it will be necessary to have a column in the data table that records from which subject the measurements in each row were taken. This information is read from the appropriate files (training and test data separately) and combined in one vector.
Then, the subject and activity vectors are appended to the left of the variable columns in the data table "data".  


##Step 4:Appropriately labels the data set with descriptive variable names. 
```{r eval=FALSE}
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
```
Actually the names of the variables were added as column names in the first step described above, but the names have to be tidied up so that they can be called in the function used in Step 5. Any non-alphabetic characters are removed from the variable names and characters beginning words are changed to upper case for readability.  

##Step 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
```{r eval=FALSE}
#create tidy dataset with means for each variable by subject and activity
grouped<-group_by(data,subject,activity)
tidy<-summarise_each(grouped,funs(mean))
```
Appropriate functions from the dplyr package are used to create the required output. On each row there is the average result for every variable (in the columns) for each subject-activity combination.  