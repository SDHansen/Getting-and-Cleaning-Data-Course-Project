Getting-and-Cleaning-Data-Course-Project
========================================

Course project for Getting and Cleaning Data.  Cleans up Human Activity Recognition Using Smartphones Data Set 

This git contains 4 files:
1. CodeBook.html
2. CodeBook.md
3. run_analysis.R
4. tidySummaryData.txt

The code book contains information about the processing that is accomplished as part of the R script.  
In summary we are:
* Loading the data files from our working directory
* Binding them into a single data frame
* Dropping all unused columns
* Creating a summary data frame to determine the mean for each subject, activity, and variable
* Re-casting the data in a tidy data file for future analysis

The R code performs all required manipulations necessary to output the updated data

tidySummaryData.txt is the data output
