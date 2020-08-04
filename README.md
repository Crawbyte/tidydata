# Getting and Cleaning Data Project
## Original Instructions
You should create one R script called run_analysis.R that does the following:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data Source
### Data collected from the accelerometers from the Samsung Galaxy S smartphone
  * Original Dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  * Aditional Descriptions: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  * License: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

## How Does It Work?
**run_analysis.R**

  * Load the libraries `data.table` and `tidyr`
  * Download the zip file and unzip it in a new directory
  * Load the requiered dataset in the cache: _test_ and _train_ with their respectives _subject_
  * Merge the datasets
  * Load the necesary measurements from _features.txt_
  * Merge the labels into the tables from _activity_labels.txt_
  * Merge all the data into a single tidy dataset

Author: [Cristian Roso](https://github.com/Crawbyte) Date: 04.08.2020