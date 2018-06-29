#Code Book

##Data Needed
*activity_labels.txt: Names and IDs for each of the 6 activities.
*features.txt: Names of the 561 features.
*subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
*X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.
*y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
*subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
*X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.
*y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.


##Steps
*All files are loaded into data frames (X, y, subject).
*Data frames for test and train are merged together.
*Filtered the mean and standard deviation columns.
*X, y, and subject data frames are merged together.
*Descriptive names are the assigned the activity column.
*The data is tidied and put in another data frame.
*The tidy data is then written to a .csv file called "Tidy Data.csv"
