# UCI HAR DataSet Analysis Script

## Repository Information

The run_analysis.R script processes the dataset: "Human Activity Recognition Using Smartphones" 

The CodeBook.md contains the code book of the analysis output.

## Data Set Information:
Source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Script Requirements

* The *dplyr* package.
 
* The following zipfile has to be downloaded and extracted in the current working directory. After unzipping the current working directory must have a directory called "UCI HAR Dataset" containing several txt files.
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
## Output

* The *samsung* data frame with the testing and training observations. 
* The *samsung_means* data frame with the means of the previous data frame grouped by *SubjectId* and *Activity*
* A *submission.txt* file is geneated in the current working directory using the *samsung_means* data frame.



 