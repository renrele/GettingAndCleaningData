---
title: "Code Book"
author: "Elisa Lerner"
date: "26 July 2015"
output:  html_document
---
## Project Description
The task involves extracting data from several files included in the UCI HAR Dataset and combining them in such a way that the result will be a tidy data table of means of relevant variables for every combination of subjects and activities.  

##Study design and data processing
The run_analysis.R file contains script that transforms the original dataset into tidy data. See README.md for a description of the steps that are taken when the file is run.
###Collection of the raw data
The UCI HAR Dataset was obtained by downloading and unzipping the data from the following source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The unzipped dataset was stored in a folder named "data". The script in the file run_analysis.R assumes that the dataset has been stored in this location before running the script. 

###Notes on the original (raw) data 
The raw measurements obtained in the experiment were normalised and saved in files in the UCI HAR Dataset. Normalised measurements have no units; this being the reason that the variables are described without units.


##Creating the tidy datafile

###Guide to create the tidy data file
* Download  and unzip the data to data folder
* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement.
* Use descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive variable names. 
* From the data set in the previous step, create a second, independent tidy data set with the average of each variable for each activity and each subject.


###Cleaning of the data
The script combines the training and test data measurements into one data table and add the varaible names to the columns. The relevant variables (those whose name contains "mean" or "std") are extracted to a new data table and columns recording the subject number and activity measured on each row are appended to the left of the data table. The column names are tidied up into a form appropriate to R and then the table is regrouped so that the means of each variable can be cakcukated and presented for every subject-activity combination. A more detailed description can be found in the [README.md file.]  (https://github.com/renrele/GettingAndCleaningData/commit/6912b3d9ad25d8d88d34bdfd19084d50bc27c272)

##Description of the variables in the tidy.txt file
*The dataset has 180 rows and 88 columns. The rows represent average measurements of the variables for 30 subjects who each performed 6 activities.
*The activities performed were: walking, walking upstairs, walking downstairs,sitting, standing and laying.
*The first column records the subject number. There were 30 subjects in the experiment. The ordering of the subjects is by alphabetical order (1,10,11,12,..19,20..29,30) and not numerical order (1,2,3..).  The second column records the activity performed. 
The next 86 column contain the average measurement of the relevant variables for each subject-activity combination. The relevant variables are those whose names include "mean" or "std" (standard deviation).

 Variable no.| Variable name |Variable Definition 
  -------------------------------------------------------------------
1| "tBodyAccMeanX"|mean time signal for body acceleration in X direction           
 2|"tBodyAccMeanY"|mean time signal for body acceleration in Y direction          
3| "tBodyAccMeanZ"|mean time signal for body acceleration in Z direction  
4| "tGravityAccMeanX"|mean time signal for gravity acceleration in X direction    
5| "tGravityAccMeanY"|mean time signal for gravity acceleration in Y direction     
6| "tGravityAccMeanZ"|mean time signal for gravity acceleration in Z direction
7| "tBodyAccJerkMeanX"|mean time signal for jerk body acceleration in X direction  
8| "tBodyAccJerkMeanY"|mean time signal for jerk body acceleration in Y direction  
9| "tBodyAccJerkMeanZ"|mean time signal for jerk body acceleration in Z direction  
10| "tBodyGyroMeanX"|mean time signal for body gyroscope reading in X direction
11| "tBodyGyroMeanY"|mean time signal for body gyroscope reading in Y direction     
12| "tBodyGyroMeanZ"|mean time signal for body gyroscope reading in Z direction  
13| "tBodyGyroJerkMeanX"|mean time signal for jerk body gyroscope reading in X direction     
14| "tBodyGyroJerkMeanY"|mean time signal for jerk body gyroscope reading in Y direction                       
15| "tBodyGyroJerkMeanZ"|mean time signal for jerk body gyroscope reading in Z direction     
16| "tBodyAccMagMean"|mean of Euclidean norm of time signal for body acceleration
17| "tGravityAccMagMean"|mean of Euclidean norm of time signal for gravity acceleration     
18|  "tBodyAccJerkMagMean"|mean of Euclidean norm of time signal for jerk body acceleration                      
19|  "tBodyGyroMagMean"|mean of Euclidean norm of time signal for body gyroscope reading
20|  "tBodyGyroJerkMagMean"|mean of Euclidean norm of time signal for jerk body gyroscope reading                    
21|  "fBodyAccMeanX"|mean of FFT filtered body acceleration in X direction
22|  "fBodyAccMeanY"|mean of FFT filtered body acceleration in Y direction
23|  "fBodyAccMeanZ"|mean of FFT filtered body acceleration in Z direction
24|  "fBodyAccMeanFreqX"|mean fequency of FFT filtered body acceleration in X direction                   
25|  "fBodyAccMeanFreqY"|mean frequency of FFT filtered body acceleration in Y direction
26|  "fBodyAccMeanFreqZ"|mean frequency of FFT filtered body acceleration in Z direction                   
27|  "fBodyAccJerkMeanX"|mean of FFT filtered jerk body acceleration in X direction
28|  "fBodyAccJerkMeanY"|mean of FFT filtered body jerk acceleration in Y direction
29|  "fBodyAccJerkMeanZ"|mean of FFT filtered body acceleration in Z direction
30|  "fBodyAccJerkMeanFreqX"|mean frequency of FFT filtered jerk body acceleration in X direction               
31|  "fBodyAccJerkMeanFreqY"|mean frequency of FFT filtered jerk body acceleration in Y direction
32|  "fBodyAccJerkMeanFreqZ"|mean frequency of FFT filtered jerk body acceleration in Z direction               
 33| "fBodyGyroMeanX"|mean of FFT filtered body gyroscope reading in X direction
34|  "fBodyGyroMeanY"|mean of FFT filtered body gyroscope reading in Y direction
35|  "fBodyGyroMeanZ"|mean of FFT filtered body gyroscope reading in Z direction
36|  "fBodyGyroMeanFreqX"|mean frequency of FFT filtered body gyroscope reading in X direction                  
37|  "fBodyGyroMeanFreqY"|mean frequency of FFT filtered body gyroscope reading in Y direction
38|  "fBodyGyroMeanFreqZ"|mean frequency of FFT filtered body gyroscope reading in Z direction                  
39|  "fBodyAccMagMean"|mean of Euclidean norm of FFT filtered body acceleration
40|  "fBodyAccMagMeanFreq"|mean of Euclidean norm of mean frequency of FFT filtered body acceleration                
41|  "fBodyBodyAccJerkMagMean"|mean of Euclidean norm of FFT filtered jerk body acceleration
42|  "fBodyBodyAccJerkMagMeanFreq"|mean frequency of Euclidean norm of FFT filtered jerk body acceleration         
43|  "fBodyBodyGyroMagMean"|mean of Euclidean norm of FFT filtered body gyroscope reading
44|  "fBodyBodyGyroMagMeanFreq"|mean frequency of Euclidean norm of FFT filtered body gyroscope reading           
45|  "fBodyBodyGyroJerkMagMean"|mean of Euclidean norm of FFT filtered jerk body gyroscope reading
46|  "fBodyBodyGyroJerkMagMeanFreq"|mean frequency of Euclidean norm of FFT filtered jerk body gyroscope reading        
47|  "angle(tBodyAccMean,gravity)"|mean angle between the time signals of the mean body accleration and gravity
48|  "angle(tBodyAccJerkMean),gravityMean)"|mean angle between the time signals of the  mean jerk body accleration and mean gravity
49|  "angle(tBodyGyroMean,gravityMean)"|mean angle between the time signals of the mean body gyrometer readings and mean gravity
50|  "angle(tBodyGyroJerkMean,gravityMean)"|mean angle between the time signals of the meanjerk body gyrometer readings and mean gravity
51|  "angle(X,gravityMean)"|mean angle between the X direction and mean gravity     
52|  "angle(Y,gravityMean)"|mean angle between the Y direction and mean gravity   
53|  "angle(Z,gravityMean)"|mean angle between the Z direction and mean gravity
54|  "tBodyAccStdX"|mean of the standard deviation of the time signal of body acceleration in the X direction                        
55|  "tBodyAccStdY"|mean of the standard deviation of the time signal of body acceleration in the Y direction                  
56|  "tBodyAccStdZ"|mean of the standard deviation of the time signal of body acceleration in the Z direction                           
57|  "tGravityAccStdX"|mean of the standard deviation of the time signal of gravity acceleration in the X direction   
58|  "tGravityAccStdY"|mean of the standard deviation of the time signal of gravity acceleration in the Y direction                       
59|  "tGravityAccStdZ"|mean of the standard deviation of the time signal of gravity acceleration in the Z direction  
60|  "tBodyAccJerkStdX"|mean of the standard deviation of the time signal of jerk body acceleration in the X direction                      
61|  "tBodyAccJerkStdY"|mean of the standard deviation of the time signal of jerk body acceleration in the Y direction  
62|  "tBodyAccJerkStdZ"|mean of the standard deviation of the time signal of jerk body acceleration in the Z direction                      
63|  "tBodyGyroStdX"|mean of the standard deviation of the time signal of body gyrometer readings in the X direction  
64|  "tBodyGyroStdY"|mean of the standard deviation of the time signal of body gyrometer readings in the Y direction                       
65|  "tBodyGyroStdZ"|mean of the standard deviation of the time signal of body gyrometer readings in the Z direction
66|  "tBodyGyroJerkStdX"|mean of the standard deviation of the time signal of jerk body gyrometer readings in the X direction                   
67|  "tBodyGyroJerkStdY"|mean of the standard deviation of the time signal of jerk body gyrometer readings in the Y direction
68|  "tBodyGyroJerkStdZ"|mean of the standard deviation of the time signal of jerk body gyrometer readings in the Z direction                   
69|  "tBodyAccMagStd"|mean of the standard deviation of the Euclidean norm of time signal of body accleration
70|  "tGravityAccMagStd"|mean of the standard deviation of the Euclidean norm of time signal of gravity                   
71|  "tBodyAccJerkMagStd"|mean of the standard deviation of the Euclidean norm of time signal of jerk body accleration
72|  "tBodyGyroMagStd"|mean of the standard deviation of the Euclidean norm of time signal of body gyrometer readings                    
73|  "tBodyGyroJerkMagStd"|mean of the standard deviation of the Euclidean norm of time signal of jerk body gyrometer readings 
74|  "fBodyAccStdX"|mean of the standard deviation of FFT filtered body acceleration in the X direction                         
75|  "fBodyAccStdY"|mean of the standard deviation of FFT filtered body acceleration in the Y direction        
76|  "fBodyAccStdZ"|mean of the standard deviation of FFT filtered body acceleration in the Z direction                         
77|  "fBodyAccJerkStdX"|mean of the standard deviation of FFT filtered jerk body acceleration in the X direction 
78|  "fBodyAccJerkStdY"|mean of the standard deviation of FFT filtered jerk body acceleration in the Y direction                     
79|  "fBodyAccJerkStdZ"|mean of the standard deviation of FFT filtered jerk body acceleration in the Z direction 
80|  "fBodyGyroStdX"|mean of the standard deviation of FFT filtered body gyrometer readings in the X direction                        
81|  "fBodyGyroStdY"|mean of the standard deviation of FFT filtered body gyrometer readings in the Y direction
82|  "fBodyGyroStdZ"|mean of the standard deviation of FFT filtered body gyrometer readings in the Z direction                       
83|  "fBodyAccMagStd"|mean of the standard deviation of the Euclidean norm of FFT filtered body acceleration
84|  "fBodyBodyAccJerkMagStd"|mean of the standard deviation of the Euclidean norm of FFT filtered jerk body acceleration
85|  "fBodyBodyGyroMagStd"|mean of the standard deviation of the Euclidean norm of FFT filtered body gyrometer readings
86|  "fBodyBodyGyroJerkMagStd"|mean of the standard deviation of the Euclidean norm of FFT filtered jerk body gyrometer readings            

###Notes on Varaible names
The variable names 41-46 and 84-86 include the word "Body" twice. I assume that this is a typing error since there is no mention of measurements with doubly mentioned "Body" in the documentation of the raw data. Nevertheless I retained the double expression in the tidy data set.  
The column number of each variable in the tidy data set is 2 + the variable number in the above table. 


