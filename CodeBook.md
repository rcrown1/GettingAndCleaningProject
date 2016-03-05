# GettingAndCleaningProject

## Introduction
This repository contains all the required files for the assembly of the two tidy
sets of data described in the Coursera - Getting and Cleaning Data Course Project.

## Data Used to Build The Tidy Data Sets
X_test.txt - Pre-processed cell phone accelerometer and gyroscope sensor measurements.
X_train.txt - Pre-processed cell phone accelerometer and gyroscope sensor measurements.
Y_test.txt - Activity ID at time of measurement for x_test.txt measurements.
Y_train.txt - Activity ID at time of measurement for x_train.txt measurements.
subject_test.txt - Subject ID performing activity measured in x_test.txt.
subject_train.txt - Subject ID performing activity measured in x_train.txt.
features.txt - Labels for all measurements in x_test.txt and x_train.txt.
activity_lables.txt - Provides a description of the Activity ID contained in y_test.txt and y_train.txt.

###### [Description of Data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
###### [Data to Use for Project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## The Script and Produced Tidy Data Sets
The run_analysis.R script downloads, extracts and performs several transformations before creating the two files containing the tidy data sets.  The transformations are as follows:

1. Read the feature Labels and clean them up.
2. Read the measure data and assign the Labels
3. Narrow the measures to only Standard Deviations and Mean Features
4. Assign the appropriate Activity and Subject to each row of measurements.
5. Merge the test and training sets of data.
6. Write the first tidy data set to tidy.txt.
7. Piviot and summarize so rows contain the average measurement for each subject, activity and feature.
8. Write the second tidy data set to tidy_smry.txt.