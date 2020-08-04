# Library to use
library(data.table)
library(tidyr)

# Download the zip file and unzip it in a new directory
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(dataURL, temp)
unzip(temp, 
      files = NULL, 
      list = FALSE, 
      overwrite = TRUE, 
      junkpaths = FALSE, 
      exdir = ".", 
      unzip = "internal", 
      setTimes = FALSE)

# Read the source tables
testx <- read.table("./UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
trainx <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Request 1: Merges the training and the test sets to create one data set
  mergedx <- rbind(testx, trainx)
  mergedy <- rbind(testy, trainy)
  mergedsubject <- rbind(subjecttest, subjecttrain)
  
  # Add the column names from the feature file
  featuresnames <- read.table("./UCI HAR Dataset/features.txt")
  featuresnames <- featuresnames$V2
  colnames(mergedx)  <- featuresnames
  
## Request 2: Extracts only the measurements on the mean and standard deviation for each measurement 
  mergedsubset <- mergedx[, grep("mean|std", colnames(mergedx))]
  
## Request 3: Uses descriptive activity names to name the activities in the data set
  activitylabels       <- read.table("./UCI HAR Dataset/activity_labels.txt")
  mergedy$activity     <- activitylabels[mergedy$V1, 2]
  
## Request 4: Appropriately labels the data set with descriptive variable names  
  names(mergedy)       <- c("ID", "Activity")
  names(mergedsubject) <- "Subject"
  
## Request 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  mergedall <- cbind(mergedsubject, mergedy, mergedx)
  labelsall <- c("Subject", "ID", "Activity")
  datalabels = setdiff(colnames(mergedall), labelsall)
  
  # Make a final table with the tidy data of all the dataset
  melteddata = gather(mergedall, labelsall, datalabels, na.rm=TRUE)
  tidydata = dcast(melteddata, Subject + Label ~ variable, mean)
  
  write.table(tidydata, file = "./tidydata.txt", row.names = FALSE)