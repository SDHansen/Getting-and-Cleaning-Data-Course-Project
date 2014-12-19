## This is the class project for the Getting and Cleaning Data class as part of the data science specialization on Coursera
## It creates one R script called run_analysis.R that does the following. 
##    1.  Merges the training and the test sets to create one data set.
##    2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
##    3.  Uses descriptive activity names to name the activities in the data set
##    4.  Appropriately labels the data set with descriptive variable names. 
##    5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##  It is based on the work done by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto at Smartlab - Non Linear Complex Systems Laboratory.
##  The data and information is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
 

## Programatically load multiple Libraries
toLoad<-list("reshape2", "data.table")
invisible(lapply(toLoad, library, character.only=T))

##  Load file meta-data

activity_labels<-read.table("./activity_labels.txt", col.names=c("activity_id", "activity_label"))

features<-read.table("./features.txt")
features<-features[,2]

##  Load Test data

X_test<-read.table("./test/X_test.txt", col.names = features)
subject<-read.table("./test/subject_test.txt", col.names="subject")
activity_id<-read.table("./test/y_test.txt", col.names="activity_id")
test_data<-cbind(subject, activity_id, X_test)

## Load Train data

X_train<-read.table("./train/X_train.txt", col.names = features)
subject<-read.table("./train/subject_train.txt", col.names="subject")
activity_id<-read.table("./train/y_train.txt", col.names="activity_id")
train_data<-cbind(subject, activity_id, X_train)

## Combine both train and test into a single data source

allData <- rbind(test_data, train_data)
allData<- merge(allData, activity_labels, by.x="activity_id", by.y="activity_id")

## Determine what variables to keep
KeepCol<-grep("mean", names(allData), ignore.case = TRUE, value = TRUE)
KeepCol<-c("subject", "activity_label", KeepCol, grep("std", names(allData), ignore.case = TRUE, value = TRUE))

##  Recast data set with desired variables
allData<-allData[,KeepCol]

##  Create tidy data set
tidyAllData<-melt(allData, id=c("subject", "activity_label"))

##  Calculate summary (means) of all data
summaryData<-dcast(tidyAllData, subject+activity_label~variable, mean)

##  Recast summary data as a tidy data set
tidySummaryData<-melt(summaryData, id=c("subject", "activity_label"))

##  Write summary data to csv file
write.table(tidySummaryData, file="tidySummaryData.txt", row.name=F)
