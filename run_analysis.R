#Assumes that the required files are already downloaded and extracted
#and the working direcctory is already the UCI HAR Dataset folder.

#Load necessary libraries
library(reshape2)

#Read text files and put to variables
subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")
X_test <- read.table("test/X_test.txt")
X_train <- read.table("train/X_train.txt")
y_test <- read.table("test/y_test.txt")
y_train <- read.table("train/y_train.txt")

activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")  

#Merges the training and the test sets to create one data set
##use rbind to combine the data sets
data <- rbind(X_test, X_train)
subject <- rbind(subject_train, subject_test)
activity <- rbind(y_train, y_test)

#Extract only the measurements on the mean and standard deviation for each measurement.
## Get the index of the mean and std of current data
## Remove all non-mean and non-std from data
dataIndex <- grep("mean()|std()", features[, 2]) 
data <- data[,dataIndex] 

#Appropriately labels the data set with descriptive variable names.
## Remove all () from current feature names
## Assign feature names to headers of data
featureNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
names(data) <- featureNames[dataIndex]
names(subject) <- 'subject'
names(activity) <- 'activity'

## Combine data, subject, and activity
data <- cbind(subject,activity, data)

#Use descriptive activity names to name the activities in the data set
data$activity <- factor(data$activity, labels = activity_labels$V2)

#From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
meltedData <- melt(data,(id.vars=c("subject","activity")))
tidyData <- dcast(meltedData, subject + activity ~ variable, mean)
write.csv(tidyData, "Tidy Data.csv", row.names=FALSE)


