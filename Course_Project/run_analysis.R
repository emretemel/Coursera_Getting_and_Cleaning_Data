# check data.table package
if ( "data.table" %in% rownames(installed.packages()) == FALSE) {install.packages("data.table")}

library(data.table)

#read all files and extract them to data.table
set_test <- fread("SamsungData/test/X_test.txt", header = FALSE )  # read test set
set_train <- fread("SamsungData/train/X_train.txt", header = FALSE ) # read train set
activity_test <- fread("SamsungData/test/y_test.txt", header = FALSE ) # read activity test
activity_train <- fread("SamsungData/train/y_train.txt", header = FALSE ) # read activity train
activity_labels <-  fread("SamsungData/activity_labels.txt", header = FALSE ) # read activity labels
subject_test <- fread("SamsungData/test/subject_test.txt", header = FALSE ) # read subject test
subject_train <- fread("SamsungData/train/subject_train.txt", header = FALSE ) # read subject train
#read all 561 features
features <-  fread("SamsungData/features.txt", header = FALSE ) 


# 1.Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.  
mean_std_cols <- features[(V2 %like% c("mean\\(\\)") | V2 %like% c("std\\(\\)"))] # finding mean & std measurements
dataset <- rbind(set_test[,c(mean_std_cols[,V1]),with=FALSE],set_train[,c(mean_std_cols[,V1]),with=FALSE])
dataset[, recid := dataset[,.I]]    # set record_id
setkey(dataset,recid) # set record_id as a key
activity <- rbind(activity_test,activity_train)
activity[, recid := activity[,.I]]    # set record_id
subjects <- rbind(subject_test,subject_train) 
subjects[, recid := subjects[,.I]]    # set record_id
setkey(subjects,recid) # set record_id as a key



# 3.Uses descriptive activity names to name the activities in the data set
setkey(activity,V1)
setkey(activity_labels,V1)
activity_labels[,V2:=tolower(activity_labels$V2)]   #converting lowercase
activity_set <- setnames(merge(activity,activity_labels),c("V1","V2"), c("act_id","act_name"))
setkey(activity_set,recid) # set record_id as a key

#merging 3 tables: measure_data, activities and subjects 
fdataset <- Reduce(merge,list(dataset,subjects,activity_set))

# 4.Appropriately labels the data set with descriptive variable names. 
mean_std_cols[,V2:=gsub("-mean\\(\\)-","Mean",mean_std_cols$V2)]
mean_std_cols[,V2:=gsub("-std\\(\\)-","Std",mean_std_cols$V2)]
setnames(fdataset,c(2:67),c(mean_std_cols$V2))
setnames(fdataset,"V1.y","subject_id")

# 5.independent tidy data set with the average of each variable for each activity and each subject.
tiny_dataset <- fdataset[, lapply(.SD,mean), by=.(subject_id,act_id,act_name),.SDcols = names(fdataset)[2:67]][order (subject_id,act_id)]

#extracting "tiny data set" as text file
write.table(tiny_dataset, row.name=FALSE,"tidy_dataset.txt")

