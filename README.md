# Course Project for Getting and Cleaning data

## Description of Repo
This repo is set up for the requirement of the course project for Getting and Cleaning data.
There are four files in the repo: 
* README.md : Description of how the R script works and the code book describing the variables
* CodeBook.md : Description of variables, data and any transformations/work performed to clean the data
* run_analysis.R : R code that implement the getting and cleaning of data
* data2_average.txt : The final tidy data set

## Project objective
The purpose of the project is demonstrate the ability to collect, work with, and clean a data set.

## Description of data source
The data was obtained from the following source:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original data obtained as ZIP format as follows:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Procedures in the R script : run_analysis.R
Step 0: Download zipfile from website and extract the files
* The ZIP file is downloaded from the URL (as show above) and unzip to extract the files

Step 1: Merges the training and the test sets to create one data set
* The training and test sets are imported from the following textfiles:
X_train.txt, X_test.txt, y_train.txt, y_test.txt,subject_train.txt, subject_test.txt,
* The imported training and test data are concatenated row-wise into the respective three data sets: <b>x</b>,<b>y</b>,<b>subj</b>

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
* The data features is imported from the textfile features.txt
* The features was used to extract the measurements on the mean and standard deviation from
the data set <b>x</b>, giving rise the next data set <b>x_mean_sd</b>

Step 3: Uses descriptive activity names to name the activities in the data set
* The data activities is imported from the textfile activity_labels.txt
* The elements in variable <b>y</b> has been replaced with descriptive activity names

Step 4: Appropriately labels the data set with descriptive variable names
* The variables <b>subj</b> and <b>y</b> have labeled appropriate descriptive variable names
* The variables <b>subj</b>, <b>y</b> and <b>x_mean_sd</b> are concatenated column-wise to form a tidy data, <b>data1</b>
* The data set <b>data1</b> is output as textfile, 'data1_merged,.txt'

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
* Using the package <b>plyr</b>, the average of each variable for each activity and each subject is computed to give a data set <b>data2</b>.
* The data set <b>data2</b> is output as textfile, 'data2_average.txt'