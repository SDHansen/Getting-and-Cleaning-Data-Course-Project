---
title: "Code Book"
author: "Scott Hansen"
date: "Friday, December 19, 2014"
output: html_document
---

## Original Data Set Information
### Human Activity Recognition Using Smartphones Data Set 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

URL to data:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Steps to process Data
1. Load file meta-data from activity_labels.txt and features.txt
2. Load Test data and combine into a single data frame X_test.txt, subject_test.txt, and y_test.txt
3. Load Training data and combine into a single data frame X_train.txt, subject_train.txt, and y_train.txt
4. Merge test and training data sets
5. Drop all columns not pertaining to Mean and Standard deviation of the data set as well as subject and activity label


 [1] "subject"                              "activity_label"                       "tBodyAcc.mean...X"                   
 [4] "tBodyAcc.mean...Y"                    "tBodyAcc.mean...Z"                    "tGravityAcc.mean...X"                
 [7] "tGravityAcc.mean...Y"                 "tGravityAcc.mean...Z"                 "tBodyAccJerk.mean...X"               
[10] "tBodyAccJerk.mean...Y"                "tBodyAccJerk.mean...Z"                "tBodyGyro.mean...X"                  
[13] "tBodyGyro.mean...Y"                   "tBodyGyro.mean...Z"                   "tBodyGyroJerk.mean...X"              
[16] "tBodyGyroJerk.mean...Y"               "tBodyGyroJerk.mean...Z"               "tBodyAccMag.mean.."                  
[19] "tGravityAccMag.mean.."                "tBodyAccJerkMag.mean.."               "tBodyGyroMag.mean.."                 
[22] "tBodyGyroJerkMag.mean.."              "fBodyAcc.mean...X"                    "fBodyAcc.mean...Y"                   
[25] "fBodyAcc.mean...Z"                    "fBodyAcc.meanFreq...X"                "fBodyAcc.meanFreq...Y"               
[28] "fBodyAcc.meanFreq...Z"                "fBodyAccJerk.mean...X"                "fBodyAccJerk.mean...Y"               
[31] "fBodyAccJerk.mean...Z"                "fBodyAccJerk.meanFreq...X"            "fBodyAccJerk.meanFreq...Y"           
[34] "fBodyAccJerk.meanFreq...Z"            "fBodyGyro.mean...X"                   "fBodyGyro.mean...Y"                  
[37] "fBodyGyro.mean...Z"                   "fBodyGyro.meanFreq...X"               "fBodyGyro.meanFreq...Y"              
[40] "fBodyGyro.meanFreq...Z"               "fBodyAccMag.mean.."                   "fBodyAccMag.meanFreq.."              
[43] "fBodyBodyAccJerkMag.mean.."           "fBodyBodyAccJerkMag.meanFreq.."       "fBodyBodyGyroMag.mean.."             
[46] "fBodyBodyGyroMag.meanFreq.."          "fBodyBodyGyroJerkMag.mean.."          "fBodyBodyGyroJerkMag.meanFreq.."     
[49] "angle.tBodyAccMean.gravity."          "angle.tBodyAccJerkMean..gravityMean." "angle.tBodyGyroMean.gravityMean."    
[52] "angle.tBodyGyroJerkMean.gravityMean." "angle.X.gravityMean."                 "angle.Y.gravityMean."                
[55] "angle.Z.gravityMean."                 "tBodyAcc.std...X"                     "tBodyAcc.std...Y"                    
[58] "tBodyAcc.std...Z"                     "tGravityAcc.std...X"                  "tGravityAcc.std...Y"                 
[61] "tGravityAcc.std...Z"                  "tBodyAccJerk.std...X"                 "tBodyAccJerk.std...Y"                
[64] "tBodyAccJerk.std...Z"                 "tBodyGyro.std...X"                    "tBodyGyro.std...Y"                   
[67] "tBodyGyro.std...Z"                    "tBodyGyroJerk.std...X"                "tBodyGyroJerk.std...Y"               
[70] "tBodyGyroJerk.std...Z"                "tBodyAccMag.std.."                    "tGravityAccMag.std.."                
[73] "tBodyAccJerkMag.std.."                "tBodyGyroMag.std.."                   "tBodyGyroJerkMag.std.."              
[76] "fBodyAcc.std...X"                     "fBodyAcc.std...Y"                     "fBodyAcc.std...Z"                    
[79] "fBodyAccJerk.std...X"                 "fBodyAccJerk.std...Y"                 "fBodyAccJerk.std...Z"                
[82] "fBodyGyro.std...X"                    "fBodyGyro.std...Y"                    "fBodyGyro.std...Z"                   
[85] "fBodyAccMag.std.."                    "fBodyBodyAccJerkMag.std.."            "fBodyBodyGyroMag.std.."              
[88] "fBodyBodyGyroJerkMag.std.." 

6. Create tidy data set by melting the data frame into subject, activity_label, and variables listed above
7. Recast the data taking the mean of all the data for each variable for each activity and each subject
8. Recast summary data as a tidy data set
9. Write the results to a new tidy data file

##Resulting Date Set
A new data set is saved in a text file with the file name of tidySummaryData.txt.
It contains 4 columns: 

* Subject  
* Variable  
* Value  
