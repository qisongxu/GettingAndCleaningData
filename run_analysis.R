
### run_analysis.R
# Step 0. Download zipfile from website and extract the data
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(url, destfile = "UCI-HAR-dataset.zip")
unzip(zipfile="UCI-HAR-dataset.zip")

# Step 1. Merges the training and the test sets to create one data set
x_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
x_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
x <- rbind(x_train, x_test)
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
y <- rbind(y_train, y_test)
subj_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subj_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subj <- rbind(subj_train, subj_test)

# Step 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement
features <- read.table('./UCI HAR Dataset/features.txt')
mean_sd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
x_mean_sd <- x[, mean_sd]

# Step 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table('./UCI HAR Dataset/activity_labels.txt')
y[, 1] = activities[y[, 1], 2]

# Step 4. Appropriately labels the data set with descriptive variable names
names(x_mean_sd) <- features[mean_sd,2]
colnames(y) <- 'activity'
colnames(subj) <- 'subject'
data1 <- cbind(subj,y, x_mean_sd)
write.table(data1, 'data1_merged.txt')

# Step 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject
library(plyr)
data2<-aggregate(. ~subject + activity, data1, mean)
data2<-data2[order(data2$subject,data2$activity),]
write.table(data2, 'data2_average.txt',row.name=FALSE)
