# Codebook

This is a code book for the project [Getting and Cleaning Data](https://github.com/Crawbyte/tidydata) and their final product _tidydata.txt_. Let's go step by step.

Author: [Cristian Roso](https://github.com/Crawbyte) Date: 04.08.2020

## Data Source
### Data collected from the accelerometers from the Samsung Galaxy S smartphone
  * [1]Original Dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  * Aditional Descriptions: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  * License: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

## Dataset Description
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

> [1]

## Used Files
  * `README.txt`: License and general description
  * `train/X_train.txt`: Training sets
  * `test/X_test.txt`: Test sets
  * `train/y_train.txt`: Training labels
  * `test/y_test.txt`: Test sets
  * `train/subject_train.txt`: ID for the subjects
  * `train/subject_test.txt`: ID for the subjects
  * `features.txt`: List of features
  * `activity_labels.txt`: Activity names
  
## Transformation Instructions
  1. Merge the training and test datasets
  2. Extracts only the measurements on the mean and standard deviation for each measurement
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  
## How _run_analysis.R_ Work?

  * Load the libraries `data.table` and `tidyr`
  * Download the zip file and unzip it in a new directory
  * Load the requiered dataset in the cache: _test_ and _train_ with their respectives _subject_
  * Merge the datasets
  * Load the necesary measurements from _features.txt_ and apply it like features names
  * Extract measurements related to mean and standard deviations
  * Load and apply the labels for activity and ID from _activity_labels.txt_
  * Merge all the data into a single tidy dataset called _tidydata.txt_

## Variables
  * ID: Subject identification. Class: Integer
  * Activity: Measured activity. Class: Factor