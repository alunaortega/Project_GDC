---
title: "Code book for Getting and Cleaning Data Course Project"
author: "Adrian Luna Ortega"
date: "22/12/2021"
output: html_document
---

# Introduction

The purpose of the document is to describe the variables, the data, transformations and
work that were performed according to Course Project "Getting and Cleaning Data".

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

**The goal** is to create one R script called run_analysis.R that does the following:

- 1) Merges the training and the test sets to create one data set.
- 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
- 3) Uses descriptive activity names to name the activities in the data set
- 4) Appropriately labels the data set with descriptive variable names. 
- 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Final Result

The final result consists of three data frames:

- Features_Data
- Feature_Average_By_ActivityName_And_IdVolunteer
- Inertial_Signals

## Features_Data

- Class: data.frame
- Number of rows: 10,299
- Number of columns: 88

From column 1 to 86 correspond to the measurements on the mean and standard deviation for each measurement. See **Annexed A** for a detailed information of each column.

Column 87 has the name *ActivityName* of *character* class. Describes the activity performed. Values are: WALKING,  WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

Column 88 has the name *IdVolunteer* of *integer* class. Describes the Numeric Identifier for the person who performed the activity. Values goes from 1 to 30.

**Features_Data** data frame is the result of joining the files:

- y_test.txt
- y_train.txt
- x_test.txt
- x_train.txt
- subject_test.txt
- subject_train.txt
- activity_labels.txt

## Feature_Average_By_ActivityName_And_IdVolunteer

- Class: data.frame
- Number of rows: 180
- Number of columns: 88

Column 1 has the name *ActivityName* of *character* class. Describes the activity performed. Values are: WALKING,  WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

Column 1 has the name *IdVolunteer* of *integer* class. Describes the Numeric Identifier for the person who performed the activity. Values goes from 1 to 30.

From column 3 to 88 correspond to the average of each Mean and Standard Deviation variable. See **Annexed A** for a detailed information of each column.

**Feature_Average_By_ActivityName_And_IdVolunteer** achieves the point *5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.*

## Inertial_Signals

- Class: data.frame
- Number of rows: 3,954,816
- Number of columns: 7

Inertial_Signals data frame is the tidy data of the next files join:

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

### Inertial_Signals Columns

- Column 1 has name *ObservationNumber*, numeric data type and indicates the observation number for the signal.
- Column 2 has name *ObservationType*, character data type and indicates the observation type. Vales are: "Body Acc", "Body Gyro" and "Total Acc"
- Column 3 has name *ActivityName*, character data type and indicates the activity associated to the signal. Values are: WALKING,  WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.
- Column 4 has name *IdVolunteer*, character data type and indicates the volunteer that generates  the signal. Values goes from 1 to 30.
- Column 5 has name *AxisX*, numeric data type and indicates the signal value on X axis.
- Column 6 has name *AxisY*, numeric data type and indicates the signal value on Y axis.
- Column 7 has name *AxisZ*, numeric data type and indicates the signal value on Z axis.


# Description of the Getting and Cleaning Data Process

**run_analisys.R** file was created using:

- RStudio 2021.09.1+372 "Ghost Orchid" Release (8b9ced188245155642d024aa3630363df611088a, 2021-11-08) for Windows
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.12.8 Chrome/69.0.3497.128 Safari/537.36
- platform       x86_64-w64-mingw32          
- arch           x86_64                      
- os             mingw32                     
- system         x86_64, mingw32             
- status                                     
- major          4                           
- minor          1.2                         
- year           2021                        
- month          11                          
- day            01                          
- svn rev        81115                       
- language       R                           
- version.string R version 4.1.2 (2021-11-01)
- nickname       Bird Hippie

on a computer with next characteristics:

- Processor 11th Gen Intel (R) Core (TM) i5-1135G7 @ 2.40GHz 1.38 GHz
- Installed RAM 8.00 GB (7.74 GB usable)
- System type 64-bit operating system, x64-based processor
- Edition	Windows 10 Pro
- Version	20H2
- Compilation	19042.1237

## Set up initial variables

Set up a Working Directory variable.

```{r}
working_Directory <- paste(getwd(),"", sep = "")
```

Set up a directory variable that contains the source files
```{r}
wd_Dataset <- paste(working_Directory,"/UCI_HAR_Dataset",sep = "")
```
Set up a directory variable that contains the source Test Files
```{r}
wd_Dataset_Test <- paste(wd_Dataset,"/test",sep = "")
```
Set up a directory variable that contains the source Train Files
```{r}
wd_Dataset_Train <- paste(wd_Dataset,"/train",sep = "")
```

## Joining y_test.txt and y_train.txt files

Set up a path variable for **y_test.txt** file and read file data into a variable called **file_y_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/y_test.txt", sep="")
file_y_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **y_train.txt** file and read file data into a variable called **file_y_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/y_train.txt", sep="")
file_y_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of y_test.txt and y_train.txt files into a a variable called **file_y_merged**
```{r}
file_y_merged <- rbind(file_y_test, file_y_train)
```

Set up column names
```{r}
colnames(file_y_merged) <- c("ClassLabel")
```

Release unused data from memory
```{r}
rm(file_y_test)
rm(file_y_train)
```

## Joining x_test.txt and x_train.txt files

Set up a path variable for **x_test.txt** file and read file data into a variable called **file_x_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/x_test.txt", sep="")
file_x_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **x_train.txt** file and read file data into a variable called **file_x_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/x_train.txt", sep="")
file_x_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of x_test.txt and x_train.txt files into a a variable called **file_x_merged**
```{r}
file_x_merged <- rbind(file_x_test, file_x_train)
```

Release unused data from memory
```{r}
rm(file_x_test)
rm(file_x_train)
```

## Joining subject_test.txt and subject_train.txt files

Set up a path variable for **subject_test.txt** file and read file data into a variable called **file_subject_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/subject_test.txt", sep="")
file_subject_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **subject_train.txt** file and read file data into a variable called **file_subject_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/subject_train.txt", sep="")
file_subject_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of subject_test.txt and subject_train.txt files into a a variable called **file_subject_merged**
```{r}
file_subject_merged <- rbind(file_subject_test, file_subject_train)
```

Release unused data from memory
```{r}
rm(file_subject_test)
rm(file_subject_train)
```

## Read activity_labels.txt file

Set up a path variable for **activity_labels.txt** file and read file data into a variable called **file_activity_labels**
```{r}
file_Name <- paste(wd_Dataset,"/activity_labels.txt", sep="")
file_activity_labels <- read.table(file_Name, encoding = "UTF-8")
```

## Read features.txt file

Set up a path variable for **features.txt** file and read file data into a variable called **file_features**
```{r}
file_Name <- paste(wd_Dataset,"/features.txt", sep="")
file_features <- read.table(file_Name, encoding = "UTF-8")
```

Clone V2 column into a new V3 column, just for future reference
```{r}
file_features$V3 <- file_features$V2
```

Set up new column names for file_features
```{r}
colnames(file_features) <- c("feature_Id","feature_Name","feature_Original_Name")
```
  
### Make column feature_Name values understandable

Replace mean() with Mean
```{r}
file_features$feature_Name <- gsub("mean[[:punct:]][[:punct:]]","Mean",file_features$feature_Name)
```

Replace std() with Std
```{r}
file_features$feature_Name <- gsub("std[[:punct:]][[:punct:]]","Std",file_features$feature_Name)
```

Replace mad() with Mad
```{r}
file_features$feature_Name <- gsub("mad[[:punct:]][[:punct:]]","Mad",file_features$feature_Name)
```

Replace max() with Max
```{r}
file_features$feature_Name <- gsub("max[[:punct:]][[:punct:]]","Max",file_features$feature_Name)
```

Replace min() with Min
```{r}
file_features$feature_Name <- gsub("min[[:punct:]][[:punct:]]","Min",file_features$feature_Name)
```

Replace sma() with Sma
```{r}
file_features$feature_Name <- gsub("sma[[:punct:]][[:punct:]]","Sma",file_features$feature_Name)
```

Replace energy() with Energy
```{r}
file_features$feature_Name <- gsub("energy[[:punct:]][[:punct:]]","Energy",file_features$feature_Name)
```

Replace iqr() with Iqr
```{r}
file_features$feature_Name <- gsub("iqr[[:punct:]][[:punct:]]","Iqr",file_features$feature_Name)
```

Replace entropy() with Entropy
```{r}
file_features$feature_Name <- gsub("entropy[[:punct:]][[:punct:]]","Entropy",file_features$feature_Name)
```

Replace arCoeff() with ArCoeff
```{r}
file_features$feature_Name <- gsub("arCoeff[[:punct:]][[:punct:]]","ArCoeff",file_features$feature_Name)
```

Replace correlation() with Correlation
```{r}
file_features$feature_Name <- gsub("correlation[[:punct:]][[:punct:]]","Correlation",file_features$feature_Name)
```

Replace maxInds with MaxInds
```{r}
file_features$feature_Name <- gsub("maxInds","MaxInds",file_features$feature_Name)
```

Replace meanFreq() with MeanFreq
```{r}
file_features$feature_Name <- gsub("meanFreq[[:punct:]][[:punct:]]","MeanFreq",file_features$feature_Name)
```

Replace skewness() with Skewness
```{r}
file_features$feature_Name <- gsub("skewness[[:punct:]][[:punct:]]","Skewness",file_features$feature_Name)
```

Replace kurtosis() with Kurtosis
```{r}
file_features$feature_Name <- gsub("kurtosis[[:punct:]][[:punct:]]","Kurtosis",file_features$feature_Name)
```

Replace bandsEnergy() with BandsEnergy
```{r}
file_features$feature_Name <- gsub("bandsEnergy[[:punct:]][[:punct:]]","BandsEnergy",file_features$feature_Name)
```

Replace gravity with Gravity
```{r}
file_features$feature_Name <- gsub("gravity","Gravity",file_features$feature_Name)
```

Replace character , with And
```{r}
file_features$feature_Name <- gsub("\\,","And",file_features$feature_Name)
```

Replace character . with And
```{r}
file_features$feature_Name <- gsub("\\.","And",file_features$feature_Name)
```

Remove all punctuation marks
```{r}
file_features$feature_Name <- gsub("[[:punct:]]","",file_features$feature_Name)
```

Replace anglet with angleT
```{r}
file_features$feature_Name <- gsub("anglet","angleT",file_features$feature_Name)
```
  

## Set up column names of *file_x_merged* using *file_features$feature_Name*

```{r}
colnames(file_x_merged) <- file_features$feature_Name
```
  
Replace on column names the character . with word Column

```{r}
colnames(file_x_merged) <- gsub("\\.","Column",colnames(file_x_merged))
```
  

## Add a new column on *file_y_merged* in order to set up activity name according to class label
```{r}
file_y_merged["ActivityName"] <- as.character(NA)
  
index_stop <- length(file_y_merged$ClassLabel)
for(index in 1:index_stop) {
  if(file_y_merged$ClassLabel[index] == 1) {
    file_y_merged$ActivityName[index] <- "WALKING"
  } else if (file_y_merged$ClassLabel[index] == 2) {
    file_y_merged$ActivityName[index] <- "WALKING UPSTAIRS"
  } else if (file_y_merged$ClassLabel[index] == 3) {
    file_y_merged$ActivityName[index] <- "WALKING DOWNSTAIRS"
  } else if (file_y_merged$ClassLabel[index] == 4) {
    file_y_merged$ActivityName[index] <- "SITTING"
  } else if (file_y_merged$ClassLabel[index] == 5) {
    file_y_merged$ActivityName[index] <- "STANDING"
  } else if (file_y_merged$ClassLabel[index] == 6) {
    file_y_merged$ActivityName[index] <- "LAYING"
  } else {
    file_y_merged$ActivityName[index] <- NA
  }
}

rm(index)
rm(index_stop)
```

## Add a new column on *file_x_merged* in order to set up activity name

```{r}
file_x_merged["ActivityName"] <- file_y_merged$ActivityName
```


## Add a new column on *file_x_merged* in order to set up the Id of person who perform the activity
```{r}
file_x_merged["IdVolunteer"] <- file_subject_merged$V1
```


## Create **the tidy data frame** with features, activities and volunteers for analisys 
```{r}
Features_Data <- file_x_merged
```

### Remove those columns that are not *Mean* or *Standard Deviation*
```{r}
index_stop <- length(colnames(Features_Data))
Features_Data_Column_Names <- colnames(Features_Data)
Column_Names_To_Remove <- as.character()
for(index in 1:index_stop) {
  if(!(
        grepl("Mean",Features_Data_Column_Names[index],fixed = TRUE) | 
        grepl("Std",Features_Data_Column_Names[index],fixed = TRUE) |
        grepl("ActivityName",Features_Data_Column_Names[index],fixed = TRUE) |
        grepl("IdVolunteer",Features_Data_Column_Names[index],fixed = TRUE) 
    )) {
    Column_Names_To_Remove <- append(Column_Names_To_Remove,Features_Data_Column_Names[index])
  }
}

Features_Data = Features_Data[,!(names(Features_Data) %in% Column_Names_To_Remove)]

rm(index)
rm(index_stop)
rm(Features_Data_Column_Names)
rm(Column_Names_To_Remove)
```

## Creation of a second, independent tidy data set with the average of each variable for each activity and each subject.
```{r}
Feature_Average_By_ActivityName_And_IdVolunteer <- aggregate(. ~ActivityName+IdVolunteer, data = Features_Data, FUN = mean)
```

## Remove unusual data frames and vectors
```{r}
rm(file_activity_labels)
rm(file_features)
rm(file_subject_merged)
rm(file_y_merged)
```


## Create a data frame called Inertial Signals

Inertial Signals is a tidy data of the next files join:

- body_acc_x_test.txt
- body_acc_y_test.txt
- body_acc_z_test.txt
- body_gyro_x_test.txt
- body_gyro_y_test.txt
- body_gyro_z_test.txt
- total_acc_x_test.txt
- total_acc_y_test.txt
- total_acc_z_test.txt

Set up a path variable for **body_acc_x_test.txt** file and read file data into a variable called **file_body_acc_x_test**

```{r}
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_acc_x_test.txt", sep="")
file_body_acc_x_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **body_acc_x_train.txt** file and read file data into a variable called **file_body_acc_x_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_acc_x_train.txt", sep="")
file_body_acc_x_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of *body_acc_x_test.txt* and *body_acc_x_train.txt* files into a a variable called **file_body_acc_x_merged**
```{r}
file_body_acc_x_merged <- rbind(file_body_acc_x_test, file_body_acc_x_train)
```

Release unused data from memory
```{r}
rm(file_body_acc_x_test)
rm(file_body_acc_x_train)
```

Set up a path variable for **body_acc_y_test.txt** file and read file data into a variable called **file_body_acc_y_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_acc_y_test.txt", sep="")
file_body_acc_y_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **body_acc_y_train.txt** file and read file data into a variable called **file_body_acc_y_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_acc_y_train.txt", sep="")
file_body_acc_y_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of *body_acc_y_test.txt* and *body_acc_y_train.txt* files into a a variable called **file_body_acc_y_merged**
```{r}
file_body_acc_y_merged <- rbind(file_body_acc_y_test, file_body_acc_y_train)
```

Release unused data from memory
```{r}
rm(file_body_acc_y_test)
rm(file_body_acc_y_train)
```

Set up a path variable for **body_acc_z_test.txt** file and read file data into a variable called **file_body_acc_z_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_acc_z_test.txt", sep="")
file_body_acc_z_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **body_acc_z_train.txt** file and read file data into a variable called **file_body_acc_z_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_acc_z_train.txt", sep="")
file_body_acc_z_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of *body_acc_z_test.txt* and *body_acc_z_train.txt* files into a a variable called **file_body_acc_z_merged**
```{r}
file_body_acc_z_merged <- rbind(file_body_acc_z_test, file_body_acc_z_train)
```

Release unused data from memory
```{r}
rm(file_body_acc_z_test)
rm(file_body_acc_z_train)
```

Set up a path variable for **body_gyro_x_test.txt** file and read file data into a variable called **file_body_gyro_x_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_gyro_x_test.txt", sep="")
file_body_gyro_x_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **body_gyro_x_train.txt** file and read file data into a variable called **body_gyro_x_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_gyro_x_train.txt", sep="")
file_body_gyro_x_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of *body_gyro_x_test.txt* and *body_gyro_x_train.txt* files into a a variable called **file_body_gyro_x_merged**
```{r}
file_body_gyro_x_merged <- rbind(file_body_gyro_x_test, file_body_gyro_x_train)
```

Release unused data from memory
```{r}
rm(file_body_gyro_x_test)
rm(file_body_gyro_x_train)
```

Set up a path variable for **body_gyro_y_test.txt** file and read file data into a variable called **file_body_gyro_y_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_gyro_y_test.txt", sep="")
file_body_gyro_y_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **body_gyro_y_train.txt** file and read file data into a variable called **file_body_gyro_y_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_gyro_y_train.txt", sep="")
file_body_gyro_y_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of *body_gyro_y_test.txt* and *body_gyro_y_train.txt* files into a a variable called **file_body_gyro_y_merged**
```{r}
file_body_gyro_y_merged <- rbind(file_body_gyro_y_test, file_body_gyro_y_train)
```

Release unused data from memory
```{r}
rm(file_body_gyro_y_test)
rm(file_body_gyro_y_train)
```

Set up a path variable for **body_gyro_z_test.txt** file and read file data into a variable called **file_body_gyro_z_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_gyro_z_test.txt", sep="")
file_body_gyro_z_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **body_gyro_z_train.txt** file and read file data into a variable called **file_body_gyro_z_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_gyro_z_train.txt", sep="")
file_body_gyro_z_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of *body_gyro_z_test.txt* and *body_gyro_z_train.txt* files into a a variable called **file_body_gyro_z_merged**
```{r}
file_body_gyro_z_merged <- rbind(file_body_gyro_z_test, file_body_gyro_z_train)
```

Release unused data from memory
```{r}
rm(file_body_gyro_z_test)
rm(file_body_gyro_z_train)
```

Set up a path variable for **total_acc_x_test.txt** file and read file data into a variable called **file_total_acc_x_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/total_acc_x_test.txt", sep="")
file_total_acc_x_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **total_acc_x_train.txt** file and read file data into a variable called **file_total_acc_x_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/total_acc_x_train.txt", sep="")
file_total_acc_x_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of *total_acc_x_test.txt* and *total_acc_x_train.txt* files into a a variable called **file_total_acc_x_merged**
```{r}
file_total_acc_x_merged <- rbind(file_total_acc_x_test, file_total_acc_x_train)
```

Release unused data from memory
```{r}
rm(file_total_acc_x_test)
rm(file_total_acc_x_train)
```

Set up a path variable for **total_acc_y_test.txt** file and read file data into a variable called **file_total_acc_y_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/total_acc_y_test.txt", sep="")
file_total_acc_y_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **total_acc_y_train.txt** file and read file data into a variable called **file_total_acc_y_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/total_acc_y_train.txt", sep="")
file_total_acc_y_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of *total_acc_y_test.txt* and *total_acc_y_train.txt* files into a a variable called **file_total_acc_y_merged**
```{r}
file_total_acc_y_merged <- rbind(file_total_acc_y_test, file_total_acc_y_train)
```

Release unused data from memory
```{r}
rm(file_total_acc_y_test)
rm(file_total_acc_y_train)
```

Set up a path variable for **total_acc_z_test.txt** file and read file data into a variable called **file_total_acc_z_test**
```{r}
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/total_acc_z_test.txt", sep="")
file_total_acc_z_test <- read.table(file_Name, encoding = "UTF-8")
```

Set up a path variable for **total_acc_z_train.txt** file and read file data into a variable called **file_total_acc_z_train**
```{r}
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/total_acc_z_train.txt", sep="")
file_total_acc_z_train <- read.table(file_Name, encoding = "UTF-8")
```

Joining the data of *total_acc_z_test.txt* and *total_acc_z_train.txt* files into a a variable called **file_total_acc_z_merged**
```{r}
file_total_acc_z_merged <- rbind(file_total_acc_z_test, file_total_acc_z_train)
```

Release unused data from memory
```{r}
rm(file_total_acc_z_test)
rm(file_total_acc_z_train)
```

Consolidation of the data into a  data frame called Inertial_Signals
```{r}
Inertial_Signals <- data.frame(ObservationNumber=double(),ObservationType=character(),ActivityName=character(),IdVolunteer=integer(),AxisX=double(),AxisY=double(),AxisZ=double(),stringsAsFactors=FALSE)

index_Observation_stop <- 10299L

for(index_Observation in 1:index_Observation_stop) {
  for(index_Column_Signal in 1:128) {
  
    Inertial_Signals[nrow(Inertial_Signals)+1,] = c(as.integer(index_Observation),"Body Acc",file_x_merged$ActivityName[index_Observation],as.integer(file_x_merged$IdVolunteer[index_Observation]),as.numeric(file_body_acc_x_merged[index_Observation,index_Column_Signal]),as.numeric(file_body_acc_y_merged[index_Observation,index_Column_Signal]),as.numeric(file_body_acc_z_merged[index_Observation,index_Column_Signal]))
    
    Inertial_Signals[nrow(Inertial_Signals)+1,] = c(as.integer(index_Observation),"Body Gyro",file_x_merged$ActivityName[index_Observation],as.integer(file_x_merged$IdVolunteer[index_Observation]),as.numeric(file_body_gyro_x_merged[index_Observation,index_Column_Signal]),as.numeric(file_body_gyro_y_merged[index_Observation,index_Column_Signal]),as.numeric(file_body_gyro_z_merged[index_Observation,index_Column_Signal]))
    
    Inertial_Signals[nrow(Inertial_Signals)+1,] = c(as.integer(index_Observation),"Total Acc",file_x_merged$ActivityName[index_Observation],as.integer(file_x_merged$IdVolunteer[index_Observation]),as.numeric(file_total_acc_x_merged[index_Observation,index_Column_Signal]),as.numeric(file_total_acc_y_merged[index_Observation,index_Column_Signal]),as.numeric(file_total_acc_z_merged[index_Observation,index_Column_Signal]))
    
  }
}
```

Change column data type
```{r}
Inertial_Signals$IdVolunteer <- as.integer(Inertial_Signals$IdVolunteer)
Inertial_Signals$AxisX <- as.numeric(Inertial_Signals$AxisX)
Inertial_Signals$AxisY <- as.numeric(Inertial_Signals$AxisY)
Inertial_Signals$AxisZ <- as.numeric(Inertial_Signals$AxisZ)
Inertial_Signals$ObservationNumber <- as.integer(Inertial_Signals$ObservationNumber)
```

Release unused data from memory
```{r}
rm(index_Observation_stop)
rm(index_Observation)
rm(index_Column_Signal)
rm(file_body_acc_x_merged)
rm(file_body_acc_y_merged)
rm(file_body_acc_z_merged)
rm(file_body_gyro_x_merged)
rm(file_body_gyro_y_merged)
rm(file_body_gyro_z_merged)
rm(file_total_acc_x_merged)
rm(file_total_acc_y_merged)
rm(file_total_acc_z_merged)
rm(file_x_merged)
rm(working_Directory)
rm(wd_Dataset)
rm(wd_Dataset_Test)
rm(wd_Dataset_Train)
rm(file_Name)
```
# Annexed A

The detailed information of each column is described into next files:

- /UCI_HAR_Dataset/README.txt
- /UCI_HAR_Dataset/features_info.txt