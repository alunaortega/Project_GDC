---
title: "**ReadMe** file for Getting and Cleaning Data Course Project"
author: "Adrian Luna Ortega"
date: "23/12/2021"
output: html_document
---

The purpose of the document is to describe the files in this repository

## CodeBook.md

It is a R Markdown file that describe the variables, the data, transformations and
work that were performed according to Course Project "Getting and Cleaning Data".

## CodeBook.html

It is the HTML version of *CodeBook.md* file.

## run_analysis.R

It is a R source code file that does the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## UCI_HAR_Dataset folder

It is a folder that contains source data according to:

- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## Features_Data.txt

It is a text file with 10,299 and 88 columns

From column 1 to 86 correspond to the measurements on the mean and standard deviation for each measurement. See **Code Book Annexed A** for a detailed information of each column.

Column 87 has the name *ActivityName* of *character* data type. Describes the activity performed. Values are: WALKING,  WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

Column 88 has the name *IdVolunteer* of *integer* data type. Describes the Numeric Identifier for the person who performed the activity. Values goes from 1 to 30.

**Features_Data.txt** is the tidy data of joining the source data files:

- y_test.txt
- y_train.txt
- x_test.txt
- x_train.txt
- subject_test.txt
- subject_train.txt
- activity_labels.txt

## Feature_Average_By_ActivityName_And_IdVolunteer.txt

It is a text file with 180 rows and 88 columns.

Column 1 has the name *ActivityName* of *character* data tyoe. Describes the activity performed. Values are: WALKING,  WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

Column 1 has the name *IdVolunteer* of *integer* data type. Describes the Numeric Identifier for the person who performed the activity. Values goes from 1 to 30.

From column 3 to 88 correspond to the average of each Mean and Standard Deviation variable. See **Code Book Annexed A** for a detailed information of each column.

**Feature_Average_By_ActivityName_And_IdVolunteer.txt** file achieves the point *5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.*

## Inertial_Signals.txt

It is a tex file with 3,954,816 rows and 7 columns.

**Inertial_Signals.txt** file is the tidy data of the next source data files join:

- body_acc_x_test.txt
- body_acc_y_test.txt
- body_acc_z_test.txt
- body_gyro_x_test.txt
- body_gyro_y_test.txt
- body_gyro_z_test.txt
- total_acc_x_test.txt
- total_acc_y_test.txt
- total_acc_z_test.txt
- subject_test.txt
- subject_train.txt
- activity_labels.txt

### Inertial_Signals.txt Columns

- Column 1 has name *ObservationNumber*, numeric data type and indicates the observation number for the signal.
- Column 2 has name *ObservationType*, character data type and indicates the observation type. Vales are: "Body Acc", "Body Gyro" and "Total Acc"
- Column 3 has name *ActivityName*, character data type and indicates the activity associated to the signal. Values are: WALKING,  WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.
- Column 4 has name *IdVolunteer*, character data type and indicates the volunteer that generates  the signal. Values goes from 1 to 30.
- Column 5 has name *AxisX*, numeric data type and indicates the signal value on X axis.
- Column 6 has name *AxisY*, numeric data type and indicates the signal value on Y axis.
- Column 7 has name *AxisZ*, numeric data type and indicates the signal value on Z axis.


## ReadMe.md and ReadMe.html

- ReadMe.md is a R Markdown file.
- ReadMe.html is a HTML version of ReadMe.md file.
