##Getting and Cleaning Data (Course Project)
####CodeBook for run_analysis.R
######Emre Temel / 18 Nov 2015


i)
- The data used at run_analysis.R is extracted from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Project website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


ii) First we read all necessary files from current working directory (as data.table class)
  * x_train.txt(7352 records) and x_test.txt (2947 records) used for measurements ( variables: set_train and set_test)
  * y_train.txt(7352 records) and y_test.txt (2947 records)used for activities ( variables: activity_train and activity_test)
  * subject_train.txt (7352 records) and subject_test.txt (2947 records) used for subjects (variables:subject_train and subject_test) 

iii) We read dimension files for descriptive variable names and filtering measurements
 * activity_labels.txt to "activity_labels" , total 6 kind of activities
 * features.txt (561 features are exist) to  "features" variable

iv) Extracts only the measurements on the mean and standard deviation for each measurement. 
  * We only extract "mean" and "standard deviation" features from features to mean_std_cols
  * Filter the records as mean() for mean features and std() for "standard deviation" features
  * Total 66 features will extracted

v) Merges the training and the test sets to create one data set.
  * set_train & set_test --> dataset (10299 records) (using  mean_std_cols for mean and std features only)
  * activity_train & activity_test  (10299 records) --> activity
  * subject_train & subject_test (10299 records) -->  subjects

vi) Appropriately labels the data set with descriptive measure and activity names.
 * Merging activity and activity_labels to activity_set with converting activity names to lower case
 * We remove "()" and "-" from mean_std_cols and replace "mean" and "std" as "Mean" and "Std"  
vii) We merge subjects,measures and activity data
  * activity_set,subjects and dataset be merged and measure columns are replace with the names at mean_std_cols
  * fdataset is the final data.table for merged data
  * It has 10299 rows and 70 columns
  * 1 record_id (used when merging tables)
  * 66 measures 
  * 1 subject_id
  * 2 columns for activity (act_id and 1 act_name)

viii) Finally we create a tidy data set with the average of each variable for each activity and each subject
  * With using fdataset we create a tiny data set named "tidy_dataset"
  * It has 180 rows and 69 columns
  * 69 columns => subjects(subject_id) , activities(act_id and act_name) and 66 measure columns
  * 180 rows   => There are 30 subjects and  6 different activities : 180 combinations

ix) Write tidy_dataset to "tidy_dataset.txt" file in current working directory  
