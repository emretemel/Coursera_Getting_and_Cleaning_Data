Coursera:Getting and Cleaning Data => Course Project
========================================
HOw to run run_analysis.R script?

* Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* Unzip and rename the folder  "SamsungData".
* SamsungData Folder and run_analysis.R are both must be in the current working directory.
* Use source("run_analysis.R") in RStudio. 
* After script works tidydata.txt will generated in the current working directory
* YOu can read  tidydata.txt as tidyData <- read.table("tidy_dataset.txt",header=TRUE) 
 - It has 180 rows and 69 columns
 - 69 columns => subject_id , activities(act_id and act_name) and 66 measure columns
 - 180 rows => There are 30 subjects * 6 diffent activities

