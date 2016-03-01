## Getting and Cleaning Data Course Project
# Test Change 2/28/2016
# Set working directory for consistancy
setwd("/Users/rcrown/GettingAndCleaningProject/")
# Windows Settings
# setwd("~/DataSciProjects/GettingNCleaning/Project/GettingAndCleaningProject")
# Download data and extract data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "./Dataset.zip",method="curl")
unzip("./Dataset.zip")
setwd("./UCI HAR Dataset/test")
library(dplyr)
#Prepare Test Data
#read data
x_test <- read.table("X_test.txt")
#read measure names
features <- read.table("../features.txt")
colnames(features) <- c("ID","NAME")
#apply measure names to data frame containing measure data
col_names <- features[,2]
colnames(x_test) <- col_names

#narrow columns only to mean and standard deviations
narrow <- x_test[(grep(("mean|std"),colnames(x_test)))]
#remove mean frequencies from columns
narrow <- narrow[-(grep(("Freq"),colnames(narrow)))]
# Assemble activity label for all measures
# read y_test
y_test <- read.table("./y_test.txt")
activity_labels <- read.table("../activity_labels.txt")
# join y_test to activity lables
names(y_test)
names(activity_labels)
y_activity_lables <- merge(y_test,activity_labels)
colnames(y_activity_lables) <-c("ID","Activity.Name")
# merge activity lables column into measure data
head(y_activity_lables)
y_activity_lables
y_activity_lables <- select(y_activity_lables, Activity.Name)
narrow <- cbind(y_activity_lables,narrow)
# read subject_test 
subjects <- read.table("subject_test.txt")
# merge subject_test with measure data
colnames(subjects) <-("Subject.ID")
head(subjects)
narrow <- cbind(subjects,narrow)
flip <- gather(narrow, measure_name, measure_value, 3:68)
head(flip)
## apply above steps to train data
# read y_train
setwd("../train")
x_train <- read.table("X_train.txt")
#apply measure names to data frame containing measure data
col_names <- features[,2]
colnames(x_train) <- col_names
y_train <- read.table("y_train.txt")
#activity_labels <- read.table("../activity_labels.txt")
# join y_train to activity lables
y_activity_lables <- merge(y_train,activity_labels)
colnames(y_activity_lables) <-c("ID","Activity.Name")
# merge activity lables column into measure data
x_train2 <- cbind(y_activity_lables$Activity.Name,x_train)
names(x_train2)
head(y_activity_lables)
# read subject_test 
subjects <- read.table("subject_train.txt")
# merge subject_test with measure data
colnames(subjects) <-("Subject.ID")
head(subjects)
x_train3 <- cbind(subjects,x_train2)
# subset only mean and std measures
names(x_train3)
# merge train and test data

# update column lables with easier to read names



#



#Identify columns which contain mean or deviation
col.subset.df <- filter(features, grepl('mean|std|Mean', NAME))
col.subset.df2 <- filter(col.subset.df, !grepl('Freq',NAME))
col.subset <- as.vector(col.subset.df2[,2])
col.subset
select_(x_train3,col.subset)
select_(x_train3,"tBodyAcc-mean()-x")
getwd()

head(ytest)
head(activity_labels)
# Join y lable ID to text descriptions
names(Xtest)
col_names
str(xtest)
head(xtest)