# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation
#   for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set
#   with the average of each variable for each activity and each subject.

## download dataset
library(dplyr)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="wearables.zip")
unzip("wearables.zip")


## determine duplicate columns to be removed
setwd("UCI HAR Dataset")
features<-read.table("features.txt", header = FALSE, sep = "")
features<-features[,2]
duplicates<-duplicated(features)
activity_labels <- read.table("activity_labels.txt", header = FALSE, sep = "")

## load test dataset
setwd("test")
xtest<-read.table("X_test.txt", header = FALSE, sep = "")

## add descriptive labels to test dataset
names(xtest) <- features
ytest<-read.csv("y_test.txt", header = FALSE, sep = "")
names(ytest) <- "activity"
idtest<-read.csv("subject_test.txt", header = FALSE, sep = "")
names(idtest) <- "subject"
test<-cbind(idtest, ytest, xtest)

## load train dataset
setwd("..")
setwd("train")
xtrain<-read.csv("X_train.txt", header = FALSE, sep = "")

## add descriptive labels to train dataset
names(xtrain) <- features
ytrain<-read.csv("y_train.txt", header = FALSE, sep = "")
idtrain<-read.csv("subject_train.txt", header = FALSE, sep = "")
names(ytrain) <- "activity"
names(idtrain) <- "subject"
train <- cbind(idtrain, ytrain, xtrain)

## part 1 - combine datasets
HAR_tidy_temp <- rbind(train, test)

## part 2 - extract means and standard deviations
HAR_tidy_temp<-HAR_tidy_temp[,!duplicates]
HAR_tidy_temp <- select(HAR_tidy_temp,matches("activity|subject|mean\\()|std\\()", ignore.case = TRUE))

## part 3 - add descriptive activity names to dataset
HAR_tidy_temp$activity <- activity_labels[match(HAR_tidy_temp$activity, activity_labels[,1]),2]

## part 5 - create tidy dataset and save
HAR_tidy <- HAR_tidy_temp %>% group_by(subject, activity) %>% summarize_all(list(mean))
HAR_tidy
setwd("..")
write.csv(HAR_tidy, file="HAR_tidy.csv")

## remove unused variables
rm(activity_labels, idtest, idtrain, test, train, xtest, xtest2, xtest3, xtrain, ytest, ytrain)
rm(duplicates, features, features1, mywd, url, HAR_tidy_temp)
