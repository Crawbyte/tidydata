# Library to use
library(data.table)
# Download the zip file in a new directory
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
#