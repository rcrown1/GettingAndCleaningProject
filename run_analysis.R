## Getting and Cleaning Data Course Project
# Set working directory for consistancy
setwd("/Users/rcrown/GettingAndCleaningProject/")
# Download data and extract data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "./Dataset.zip",method="curl")
unzip("./Dataset.zip")
setwd("./UCI HAR Dataset")
library(dplyr)
#read and clean up measure names
features <- read.table("features.txt")
features[,2] = gsub('mean', 'Mean', features[,2])
features[,2] = gsub('std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

#Read Measure Data and assign cleaned up names
x_test <- read.table("./test/X_test.txt")
x_train <- read.table("./train/X_train.txt")
colnames(x_test) <- features[,2]
colnames(x_train) <- features[,2]

#narrow columns only to Mean and Standard Deviations (exclude Frequencies)
narrow_test <- x_test[(grep(("Mean|Std"),colnames(x_test)))]
narrow_test <- narrow_test[-(grep(("Freq"),colnames(narrow_test)))]
narrow_train <- x_train[(grep(("Mean|Std"),colnames(x_train)))]
narrow_train <- narrow_train[-(grep(("Freq"),colnames(narrow_train)))]

# merge subject IDs and activity lables
test_activity_lables <- merge(read.table("./test/y_test.txt"),read.table("activity_labels.txt"))
complete_test <- cbind(read.table("./test/subject_test.txt"),test_activity_lables[,2],narrow_test)
train_activity_lables <- merge(read.table("./train/y_train.txt"),read.table("activity_labels.txt"))
complete_train <- cbind(read.table("./train/subject_train.txt"),train_activity_lables[,2],narrow_train)

#merge two data sets 
colnames(complete_train)[1:2] <- c("Subject","Activity")
colnames(complete_test)[1:2] <- c("Subject","Activity")
complete_set <- rbind(complete_train, complete_test)
setwd("../")
write.table(complete_set, file = "tidy.txt", row.names = FALSE)

# create summary data set which has the Average Measure Value for each
# Subject, Activity and Measure
flip <- gather(complete_set, MeasureName, MeasureVal, 3:75)
tidy_smry <- summarise(group_by(flip,Subject, Activity, MeasureName),mean(MeasureVal))
write.table(tidy_smry, file = "tidy_smry.txt", row.names = FALSE)
