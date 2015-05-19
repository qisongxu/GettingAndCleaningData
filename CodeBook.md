# Course Project for Getting and Cleaning data

## Data Set Information [1]
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

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
* The data set <b>data1</b> is output as textfile, 'data1_merged.txt'

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
* Using the package <b>plyr</b>, the average of each variable for each activity and each subject is computed to give a data set <b>data2</b>.
* The data set <b>data2</b> is output as textfile, 'data2_average.txt'

## Variables
* url: Link to the website for data source
* x_train: Data imported from X_train.txt
* x_test: Data imported from X_test.txt
* x: Combined data from x_train and x_test
* y_train: Data imported from y_train.txt
* y_test: Data imported from y_test.txt
* y: Combined data from y_train and y_test
* subj_train: Data imported from subject_train.txt
* subj_test: Data imported from subject_test.txt
* subj: Combined data from subj_train and subj_test
* features: Data imported from features.txt
* x_mean_sd: Selected x data with measurements of means and standard deviations
* activities: Data imported from activity_labels.txt
* data1: First tidy data set - Column-wise concatenation of subj,y and x_mean_sd
* data2: Second tidy data set - the average of each variable for each activity and each subject

## Output
'data1_merged.txt' contains a 10299X68 data frame
* First column: Subject IDs
* Second column: Activity names
* Last 66 column: Measurements that are means and standard deviations

'data2_average.txt' contains a 10299X68 data frame
* First column: Subject IDs
* Second column: Activity names
* Last 66 column: Averages of the measurements