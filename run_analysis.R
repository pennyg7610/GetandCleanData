library(data.table)
library(dplyr)

# read in the data
activity_labels<- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("A_Code", "Activity"))
features<- read.table("UCI HAR Dataset/features.txt", col.names = c("F_Code", "Features"))

subject_train<- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$Features)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Labels")

subject_test<- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$Features)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Labels")



# 1.Merges the training and the test sets to create one data set.

X_DT<- rbind(X_train, X_test)
y_DT<- rbind(y_train, y_test)
subject<-rbind(subject_train, subject_test)

merged_DT<- cbind(subject, X_DT, y_DT)

head(merged_DT)


# 2.Extracts only the measurements on the mean (mean) and standard deviation (std) for each measurement. 

filtered_DT<- merged_DT %>% select(Subject, Labels, contains("mean"), contains("std") )


# 3.Uses descriptive activity names to name the activities in the data set

filtered_DT$Labels<- activity_labels[filtered_DT$Labels, 2] 


# 4.Appropriately labels the data set with descriptive variable names. 

names(filtered_DT) <- gsub("Acc", "Accelerometer" , names(filtered_DT))
names(filtered_DT) <- gsub("Gyro", "Gyroscope" , names(filtered_DT))
names(filtered_DT) <- gsub("Mag", "Magnitude" , names(filtered_DT))
names(filtered_DT) <- gsub("^t", "Time" , names(filtered_DT))
names(filtered_DT) <- gsub("^f", "Frequency" , names(filtered_DT))
names(filtered_DT) <- gsub("BodyBody", "Body" , names(filtered_DT))
names(filtered_DT) <- gsub("angle", "Angle" , names(filtered_DT))
names(filtered_DT) <- gsub("gravity", "Gravity" , names(filtered_DT))
names(filtered_DT) <- gsub("std", "STD" , names(filtered_DT))
names(filtered_DT) <- gsub("mean", "Mean" , names(filtered_DT))
names(filtered_DT) <- gsub("Freq", "Frequency" , names(filtered_DT))
names(filtered_DT) <- gsub("tBody", "TimeBody" , names(filtered_DT))
names(filtered_DT) <- gsub("Labels", "Activity" , names(filtered_DT))


# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


FinalTidyData<- filtered_DT %>% group_by(Subject, Activity) %>% summarise_all(list(mean))


write.table(FinalTidyData, "FinalTidyData.txt")

