
###########################################################
###########################################################
## Date: December 18th, 2021
## Author: Adrian Luna Ortega
## Course: Getting and Cleaning Data Course Project
## Current script does:

## 1) Merges the training and the test sets to create one data set.

## 2) Extracts only the measurements on the mean and standard deviation 
##    for each measurement. 

## 3) Uses descriptive activity names to name the activities in the data set.

## 4) Appropriately labels the data set with descriptive variable names. 

## 5) From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

###########################################################
###########################################################

## Set up Working Directory
working_Directory <- paste(getwd(),"", sep = "")
## Set up directory that contains files
wd_Dataset <- paste(working_Directory,"/UCI_HAR_Dataset",sep = "")
## Set up directory that contains Test Files
wd_Dataset_Test <- paste(wd_Dataset,"/test",sep = "")
## Set up directory that contains Train Files
wd_Dataset_Train <- paste(wd_Dataset,"/train",sep = "")

##########################################################
## Joining y_test.txt and y_train.txt
##########################################################
## Set up path for y_test.txt
file_Name <- paste(wd_Dataset_Test,"/y_test.txt", sep="")
## read y_test.txt file
file_y_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for y_train.txt
file_Name <- paste(wd_Dataset_Train,"/y_train.txt", sep="")
## read y_train.txt file
file_y_train <- read.table(file_Name, encoding = "UTF-8")

## Joining y_test.txt and y_train.txt
file_y_merged <- rbind(file_y_test, file_y_train)

## Set up column names
colnames(file_y_merged) <- c("ClassLabel")

##Release memory
rm(file_y_test)
rm(file_y_train)

##########################################################
## Joining x_test.txt and x_train.txt
##########################################################

## Set up path for x_test.txt
file_Name <- paste(wd_Dataset_Test,"/x_test.txt", sep="")
## read x_test.txt file
file_x_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for x_train.txt
file_Name <- paste(wd_Dataset_Train,"/x_train.txt", sep="")
## read x_test.txt file
file_x_train <- read.table(file_Name, encoding = "UTF-8")

## Joining x_test.txt and x_train.txt
file_x_merged <- rbind(file_x_test, file_x_train)

##Release memory
rm(file_x_test)
rm(file_x_train)

##########################################################
## Joining subject_test.txt and subject_train.txt
##########################################################

## Set up path for subject_test.txt
file_Name <- paste(wd_Dataset_Test,"/subject_test.txt", sep="")
## read subject_test.txt file
file_subject_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for subject_train.txt
file_Name <- paste(wd_Dataset_Train,"/subject_train.txt", sep="")
## read subject_test.txt file
file_subject_train <- read.table(file_Name, encoding = "UTF-8")

## Joining subject_test.txt and subject_train.txt
file_subject_merged <- rbind(file_subject_test, file_subject_train)

##Release memory
rm(file_subject_test)
rm(file_subject_train)




##########################################################
## Read activity_labels.txt file
##########################################################

## Set up path for activity_labels.txt
file_Name <- paste(wd_Dataset,"/activity_labels.txt", sep="")
## Read activity_labels.txt file
file_activity_labels <- read.table(file_Name, encoding = "UTF-8")

##########################################################
## Read features.txt file
##########################################################

## Set up path for features.txt
file_Name <- paste(wd_Dataset,"/features.txt", sep="")
## Read features.txt file
file_features <- read.table(file_Name, encoding = "UTF-8")
## Clone V2 column into a new V3 column, just for future reference
file_features$V3 <- file_features$V2
## Set up new column names for file_features
colnames(file_features) <- c("feature_Id","feature_Name","feature_Original_Name")
  #############################################################
  ## Make column feature_Name values understandable
  #############################################################

  ## Replace mean() with Mean
  file_features$feature_Name <- gsub("mean[[:punct:]][[:punct:]]","Mean",file_features$feature_Name)
  
  ## Replace std() with Std
  file_features$feature_Name <- gsub("std[[:punct:]][[:punct:]]","Std",file_features$feature_Name)
  
  ## Replace mad() with Mad
  file_features$feature_Name <- gsub("mad[[:punct:]][[:punct:]]","Mad",file_features$feature_Name)
  
  ## Replace max() with Max
  file_features$feature_Name <- gsub("max[[:punct:]][[:punct:]]","Max",file_features$feature_Name)
  
  ## Replace min() with Min
  file_features$feature_Name <- gsub("min[[:punct:]][[:punct:]]","Min",file_features$feature_Name)
  
  ## Replace sma() with Sma
  file_features$feature_Name <- gsub("sma[[:punct:]][[:punct:]]","Sma",file_features$feature_Name)
  
  ## Replace energy() with Energy
  file_features$feature_Name <- gsub("energy[[:punct:]][[:punct:]]","Energy",file_features$feature_Name)
  
  ## Replace iqr() with Iqr
  file_features$feature_Name <- gsub("iqr[[:punct:]][[:punct:]]","Iqr",file_features$feature_Name)
  
  ## Replace entropy() with Entropy
  file_features$feature_Name <- gsub("entropy[[:punct:]][[:punct:]]","Entropy",file_features$feature_Name)
  
  ## Replace arCoeff() with ArCoeff
  file_features$feature_Name <- gsub("arCoeff[[:punct:]][[:punct:]]","ArCoeff",file_features$feature_Name)
  
  ## Replace correlation() with Correlation
  file_features$feature_Name <- gsub("correlation[[:punct:]][[:punct:]]","Correlation",file_features$feature_Name)
  
  ## Replace maxInds with MaxInds
  file_features$feature_Name <- gsub("maxInds","MaxInds",file_features$feature_Name)
  
  ## Replace meanFreq() with MeanFreq
  file_features$feature_Name <- gsub("meanFreq[[:punct:]][[:punct:]]","MeanFreq",file_features$feature_Name)
  
  ## Replace skewness() with Skewness
  file_features$feature_Name <- gsub("skewness[[:punct:]][[:punct:]]","Skewness",file_features$feature_Name)
  
  ## Replace kurtosis() with Kurtosis
  file_features$feature_Name <- gsub("kurtosis[[:punct:]][[:punct:]]","Kurtosis",file_features$feature_Name)
  
  ## Replace bandsEnergy() with BandsEnergy
  file_features$feature_Name <- gsub("bandsEnergy[[:punct:]][[:punct:]]","BandsEnergy",file_features$feature_Name)
  
  ## Replace gravity with Gravity
  file_features$feature_Name <- gsub("gravity","Gravity",file_features$feature_Name)
  
  ## Replace character , with And
  file_features$feature_Name <- gsub("\\,","And",file_features$feature_Name)
  
  ## Replace character . with And
  file_features$feature_Name <- gsub("\\.","And",file_features$feature_Name)
  
  ## Remove all punctuation marks
  file_features$feature_Name <- gsub("[[:punct:]]","",file_features$feature_Name)
  
  ## Replace anglet with angleT
  file_features$feature_Name <- gsub("anglet","angleT",file_features$feature_Name)
  
##############################################################################
##Set up column names of file_x_merged using file_features$feature_Name
##############################################################################
colnames(file_x_merged) <- file_features$feature_Name
  
  ## Replace on column names the character . with word Column
  colnames(file_x_merged) <- gsub("\\.","Column",colnames(file_x_merged))
  
##############################################################################
##Add a new column on file_y_merged in order to set up activity name according to class label
##############################################################################  

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
##############################################################################
##Add a new column on file_x_merged in order to set up activity name
############################################################################## 

file_x_merged["ActivityName"] <- file_y_merged$ActivityName

##############################################################################
##Add a new column on file_x_merged in order to set up the Id of person who perform the activity
##############################################################################

file_x_merged["IdVolunteer"] <- file_subject_merged$V1

##############################################################################
## Create the tidy data frame with feautures, activities and volunteers for analisys 
##############################################################################

Features_Data <- file_x_merged

## Remove those columns that are not Mean or Standard Deviation

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

##############################################################################
##Creation of a second, independent tidy data set with the average of each variable for each activity and each subject.
##############################################################################

Feature_Average_By_ActivityName_And_IdVolunteer <- aggregate(. ~ActivityName+IdVolunteer, data = Features_Data, FUN = mean)

##############################################################################
## Remove unusual data frames $ vectors
##############################################################################

rm(file_activity_labels)
rm(file_features)
rm(file_subject_merged)
rm(file_y_merged)

##############################################################################
## Create a data frame called Inertial Signals that is a tidy data for the merged of files:
## body_acc_x_test.txt
## body_acc_y_test.txt
## body_acc_z_test.txt
## body_gyro_x_test.txt
## body_gyro_y_test.txt
## body_gyro_z_test.txt
## total_acc_x_test.txt
## total_acc_y_test.txt
## total_acc_z_test.txt
##############################################################################

##########################################################
## Joining body_acc_x_test.txt and body_acc_x_train.txt
##########################################################

## Set up path for body_acc_x_test.txt
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_acc_x_test.txt", sep="")
## read body_acc_x_test.txt file
file_body_acc_x_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for body_acc_x_train.txt
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_acc_x_train.txt", sep="")
## read body_acc_x_train.txt file
file_body_acc_x_train <- read.table(file_Name, encoding = "UTF-8")

## Joining body_acc_x_test.txt and body_acc_x_train.txt
file_body_acc_x_merged <- rbind(file_body_acc_x_test, file_body_acc_x_train)

##Release memory
rm(file_body_acc_x_test)
rm(file_body_acc_x_train)

##########################################################
## Joining body_acc_y_test.txt and body_acc_y_train.txt
##########################################################

## Set up path for body_acc_y_test.txt
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_acc_y_test.txt", sep="")
## read body_acc_y_test.txt file
file_body_acc_y_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for body_acc_y_train.txt
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_acc_y_train.txt", sep="")
## read body_acc_y_train.txt file
file_body_acc_y_train <- read.table(file_Name, encoding = "UTF-8")

## Joining body_acc_x_test.txt and body_acc_x_train.txt
file_body_acc_y_merged <- rbind(file_body_acc_y_test, file_body_acc_y_train)

##Release memory
rm(file_body_acc_y_test)
rm(file_body_acc_y_train)

##########################################################
## Joining body_acc_z_test.txt and body_acc_z_train.txt
##########################################################

## Set up path for body_acc_z_test.txt
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_acc_z_test.txt", sep="")
## read body_acc_z_test.txt file
file_body_acc_z_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for body_acc_z_train.txt
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_acc_z_train.txt", sep="")
## read body_acc_z_train.txt file
file_body_acc_z_train <- read.table(file_Name, encoding = "UTF-8")

## Joining body_acc_z_test.txt and body_acc_z_train.txt
file_body_acc_z_merged <- rbind(file_body_acc_z_test, file_body_acc_z_train)

##Release memory
rm(file_body_acc_z_test)
rm(file_body_acc_z_train)


##########################################################
## Joining body_gyro_x_test.txt and body_gyro_x_train.txt
##########################################################

## Set up path for body_gyro_x_test.txt
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_gyro_x_test.txt", sep="")
## read body_gyro_x_test.txt file
file_body_gyro_x_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for body_gyro_x_train.txt
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_gyro_x_train.txt", sep="")
## read body_gyro_x_train.txt file
file_body_gyro_x_train <- read.table(file_Name, encoding = "UTF-8")

## Joining body_gyro_x_test.txt and body_gyro_x_train.txt
file_body_gyro_x_merged <- rbind(file_body_gyro_x_test, file_body_gyro_x_train)

##Release memory
rm(file_body_gyro_x_test)
rm(file_body_gyro_x_train)

##########################################################
## Joining body_gyro_y_test.txt and body_gyro_y_train.txt
##########################################################

## Set up path for body_gyro_y_test.txt
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_gyro_y_test.txt", sep="")
## read body_gyro_y_test.txt file
file_body_gyro_y_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for body_gyro_y_train.txt
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_gyro_y_train.txt", sep="")
## read body_gyro_y_train.txt file
file_body_gyro_y_train <- read.table(file_Name, encoding = "UTF-8")

## Joining body_gyro_y_test.txt and body_gyro_y_train.txt
file_body_gyro_y_merged <- rbind(file_body_gyro_y_test, file_body_gyro_y_train)

##Release memory
rm(file_body_gyro_y_test)
rm(file_body_gyro_y_train)

##########################################################
## Joining body_gyro_z_test.txt and body_gyro_z_train.txt
##########################################################

## Set up path for body_gyro_z_test.txt
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/body_gyro_z_test.txt", sep="")
## read body_gyro_z_test.txt file
file_body_gyro_z_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for body_gyro_z_train.txt
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/body_gyro_z_train.txt", sep="")
## read body_gyro_z_train.txt file
file_body_gyro_z_train <- read.table(file_Name, encoding = "UTF-8")

## Joining body_gyro_z_test.txt and body_gyro_z_train.txt
file_body_gyro_z_merged <- rbind(file_body_gyro_z_test, file_body_gyro_z_train)

##Release memory
rm(file_body_gyro_z_test)
rm(file_body_gyro_z_train)

##########################################################
## Joining total_acc_x_test.txt and total_acc_x_train.txt
##########################################################

## Set up path for total_acc_x_test.txt
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/total_acc_x_test.txt", sep="")
## read total_acc_x_test.txt file
file_total_acc_x_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for total_acc_x_train.txt
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/total_acc_x_train.txt", sep="")
## read total_acc_x_train.txt file
file_total_acc_x_train <- read.table(file_Name, encoding = "UTF-8")

## Joining total_acc_x_test.txt and total_acc_x_train.txt
file_total_acc_x_merged <- rbind(file_total_acc_x_test, file_total_acc_x_train)

##Release memory
rm(file_total_acc_x_test)
rm(file_total_acc_x_train)

##########################################################
## Joining total_acc_y_test.txt and total_acc_y_train.txt
##########################################################

## Set up path for total_acc_y_test.txt
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/total_acc_y_test.txt", sep="")
## read total_acc_y_test.txt file
file_total_acc_y_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for total_acc_y_train.txt
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/total_acc_y_train.txt", sep="")
## read total_acc_y_train.txt file
file_total_acc_y_train <- read.table(file_Name, encoding = "UTF-8")

## Joining total_acc_y_test.txt and total_acc_y_train.txt
file_total_acc_y_merged <- rbind(file_total_acc_y_test, file_total_acc_y_train)

##Release memory
rm(file_total_acc_y_test)
rm(file_total_acc_y_train)

##########################################################
## Joining total_acc_z_test.txt and total_acc_z_train.txt
##########################################################

## Set up path for total_acc_z_test.txt
file_Name <- paste(wd_Dataset_Test,"/Inertial Signals/total_acc_z_test.txt", sep="")
## read total_acc_z_test.txt file
file_total_acc_z_test <- read.table(file_Name, encoding = "UTF-8")

## Set up path for total_acc_z_train.txt
file_Name <- paste(wd_Dataset_Train,"/Inertial Signals/total_acc_z_train.txt", sep="")
## read total_acc_z_train.txt file
file_total_acc_z_train <- read.table(file_Name, encoding = "UTF-8")

## Joining total_acc_z_test.txt and total_acc_z_train.txt
file_total_acc_z_merged <- rbind(file_total_acc_z_test, file_total_acc_z_train)

##Release memory
rm(file_total_acc_z_test)
rm(file_total_acc_z_train)

##############################################################################
## Create a data frame called Inertial Signals
##############################################################################

Inertial_Signals <- data.frame(ObservationNumber=double(),ObservationType=character(),ActivityName=character(),IdVolunteer=integer(),AxisX=double(),AxisY=double(),AxisZ=double(),stringsAsFactors=FALSE)

index_Observation_stop <- 10299L
for(index_Observation in 1:index_Observation_stop) {
  for(index_Column_Signal in 1:128) {
    Inertial_Signals[nrow(Inertial_Signals)+1,] = c(as.integer(index_Observation),"Body Acc",file_x_merged$ActivityName[index_Observation],as.integer(file_x_merged$IdVolunteer[index_Observation]),as.numeric(file_body_acc_x_merged[index_Observation,index_Column_Signal]),as.numeric(file_body_acc_y_merged[index_Observation,index_Column_Signal]),as.numeric(file_body_acc_z_merged[index_Observation,index_Column_Signal]))
    Inertial_Signals[nrow(Inertial_Signals)+1,] = c(as.integer(index_Observation),"Body Gyro",file_x_merged$ActivityName[index_Observation],as.integer(file_x_merged$IdVolunteer[index_Observation]),as.numeric(file_body_gyro_x_merged[index_Observation,index_Column_Signal]),as.numeric(file_body_gyro_y_merged[index_Observation,index_Column_Signal]),as.numeric(file_body_gyro_z_merged[index_Observation,index_Column_Signal]))
    Inertial_Signals[nrow(Inertial_Signals)+1,] = c(as.integer(index_Observation),"Total Acc",file_x_merged$ActivityName[index_Observation],as.integer(file_x_merged$IdVolunteer[index_Observation]),as.numeric(file_total_acc_x_merged[index_Observation,index_Column_Signal]),as.numeric(file_total_acc_y_merged[index_Observation,index_Column_Signal]),as.numeric(file_total_acc_z_merged[index_Observation,index_Column_Signal]))
  }
}

## Change column data type
Inertial_Signals$IdVolunteer <- as.integer(Inertial_Signals$IdVolunteer)
Inertial_Signals$AxisX <- as.numeric(Inertial_Signals$AxisX)
Inertial_Signals$AxisY <- as.numeric(Inertial_Signals$AxisY)
Inertial_Signals$AxisZ <- as.numeric(Inertial_Signals$AxisZ)
Inertial_Signals$ObservationNumber <- as.integer(Inertial_Signals$ObservationNumber)

rm(index_Observation_stop)
rm(index_Observation)
rm(index_Column_Signal)

##############################################################################
## Remove unusual data frames $ vectors
##############################################################################

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
