===========================
CodeBook for run_analysis.R
===========================

Data
===========
Raw data for this project is available here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Tidy data for this project is available in:
'FinalTidyData.txt'


Transformations performed to clean up the data
==================================================

Steps:
1. Downloaded the dataset and unzipped the file 'UCI HAR Dataset' 

2. Uploaded and assigned variables to the following files in R.

activity_labels<- "UCI HAR Dataset/activity_labels.txt"  
Provides activity and associated code#. (6 observations, 2 variables)

features<- "UCI HAR Dataset/features.txt" 
Provides listing of features and associated code#. (561 observations, 2 variables)

subject_train<- "UCI HAR Dataset/train/subject_train.txt"
Subject involved in the study identified by a # from 1-30 (7352 observations, 1 variable)

X_train<-"UCI HAR Dataset/train/X_train.txt"
A 561-feature vector with time and frequency domain variables. (7352 observations, 561 variables)

y_train<-"UCI HAR Dataset/train/y_train.txt"
Activity code associated to X_train feature vectors.(7352 observations, 1 variable)

subject_test<- "UCI HAR Dataset/test/subject_test.txt"
Subject involved in the study identified by a # from 1-30 (2947 observations, 1 variable)

X_test<- "UCI HAR Dataset/test/X_test.txt"
A 561-feature vector with time and frequency domain variables. (2947 observations, 561 variables)

y_test<- "UCI HAR Dataset/test/y_test.txt" 
Activity code associated to x_test feature vectors.(2947 observations, 1 variable)


3. Merge the training ang test sets to create one data set

Utilized rbind() to bind the rows to create the following data tables:
X_DT (consists of X_train and X_test data)  
y_DT (consist of y_train and y_test data)
subject  (consists of subject_train and subject_test) 

Then utilized cbind() to bind the columns into one single data table named merged_DT


4. Extract only the measurements on the mean and standard deviation for each measurement. 

Filtered merged_DT by utilizing select() to create a data table named filtered_DT that only contains the following column names:
"Subject"
"Labels"
and column names containing "mean" and "std"


5. Uses descriptive activity names to name the activities in the data set

Utilized the activity_labels data table to replace the code# under the "Labels" column in filter_DT


6. Appropriately labels the data set with descriptive variable names.

Replaced "Acc" within column names with "Accelerometer" 
Replaced "Gyro" within column names with "Gyroscope" 
Replaced "Mag" within column names with "Magnitude" 
Replaced "t" within column names with "Time" 
Replaced "f" within column names with "Frequency" 
Replaced "BodyBody" within column names with "Body" 
Replaced "angle" within column names with "Angle"
Replaced "gravity" within column names with "Gravity"
Replaced "std" within column names with "STD" 
Replaced "mean" within column names with "Mean" 
Replaced "Freq" within column names with "Frequency" 
Replaced "tBody" within column names with "TimeBody" 
The column "Labels" was replaced with "Activity" 

7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Created the data table named FinalTidyData by summarizing all the data using the mean() function and grouping it by "Subject" and "Activity"




Variable description 
(description below is pulled from the raw data file in 'features_info.tst')
========================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

