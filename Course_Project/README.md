
##Getting and Cleaning Data (Course Project)
####How to run run_analysis.R?
######Emre Temel / 18 Nov 2015

! This script requires "data.table" package. If not exist; package will be installed at the beginning. 

* Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* Unzip and rename the folder  "SamsungData".
* SamsungData folder and run_analysis.R must be in the current working directory.
* Use ``` source("run_analysis.R") ```
* After script works; tidydata.txt will generated in the current working directory
* Yuu can read  tidydata.txt as  ```  tidyData <- read.table("tidy_dataset.txt",header=TRUE)  ```
 - It has 180 rows and 69 columns
 - 69 columns => subjects(subject_id) , activities(act_id and act_name) and 66 measure columns
 - 180 rows   => There are 30 subjects * 6 different activities

