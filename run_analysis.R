# You should create one R script called run_analysis.R that does the following.

#Before starting script, setting up working directory and libraries
setwd("c://users//jh126//coursera//UCI HAR Dataset//")
library(plyr)
library(dplyr)
library(tibble)
library(tidyr)

# (1) Merges the training and the test sets to create one data set.

# 1.1 TRAINING DATASET:
# (a) Use activity_labels.txt and y_train.txt to match activity labels to activity numbers
# (b) Combine the resulting data frame "activity_train" with the table "subject_train.txt"
# ...to get a table that has the individual who conducted the train and the corresponding activity
# ...Add a column that indicates that this data frame is the training dataset
# (c) Add labels to the training set ("features.txt")
# ....We need to vectorize the column so that it can be appended to the train data set

#(a)
act_labels <- read.table("activity_labels.txt",sep="")
colnames(act_labels) <- c("activity_id", "activity")
act_train <- read.table(".//train//y_train.txt",sep="")
colnames(act_train) <- c("activity_id")
activity_train <- join(act_train, act_labels)   # Output is "activity_train" dataset
activity_train <- mutate(activity_train, dataset = rep("training", times = nrow(activity_train)))


#(b)
subj_train <- read.table(".//train//subject_train.txt", sep="")
colnames(subj_train) <- c("subject_id")
train_temp <- cbind(subj_train, activity_train)
train_temp <- mutate(train_temp, subject_id = as.factor(train_temp$subject_id), activity_id = as.factor(activity_id))


#(c)
features_x <- read.table("features.txt",sep="")
x1_label <- as.vector(features_x$V2)
x1_train <- read.table(".//train//X_train.txt",sep="")
colnames(x1_train) <- x1_label
x2_train <- cbind(train_temp, x1_train)


# 1.2 TEST DATA:
# Repeat the steps (a) - (c) used to create the training dataset
#a
act_labels_test <- read.table("activity_labels.txt",sep="")
colnames(act_labels_test) <- c("activity_id", "activity")
act_test <- read.table(".//test//y_test.txt",sep="")
colnames(act_test) <- c("activity_id")
activity_test <- join(act_test, act_labels_test)   # Output is "activity_train" dataset
activity_test <- mutate(activity_test, dataset = rep("test", times = nrow(activity_test)))

#b
subj_test <- read.table(".//test//subject_test.txt", sep="")
colnames(subj_test) <- c("subject_id")
test_temp <- cbind(subj_test, activity_test)
test_temp <- mutate(test_temp, subject_id = as.factor(test_temp$subject_id), activity_id = as.factor(activity_id))

#c
features_x_test <- read.table("features.txt",sep="")
str(features_x_test)
x1_label_test <- as.vector(features_x_test$V2)
head(x1_label_test)
x1_test <- read.table(".//test//X_test.txt",sep="")
colnames(x1_test) <- x1_label_test
x2_test <- cbind(test_temp, x1_test)


# 1.3 Merge Training and Test Datasets 
merged_dataset <- rbind(x2_train, x2_test)


# (2) Extracts only the measurements on the mean and standard deviation for each measurement.

df2 <- merged_dataset[,!duplicated(colnames(merged_dataset))] #removing duplicate columns that are present in the original tables
df2<- select(df2, grep("^(activity|dataset|subject)|(mean\\(|std\\()",colnames(df2)))  #Only keeping columns that are categorical and those with mean() and std()


df2_mean <- select(df2, grep("^(activity|dataset|subject)|(mean\\()",colnames(df2))) #create dataframe with category variables and the mean variables
names(df2_mean) <- sub("-mean\\()","",names(df2_mean))  #simplify column names with mean()
df2_mean <- mutate(df2_mean, metric = "mean") #add column with "mean" metric to tidy it up

df2_std <- select(df2, grep("^(activity|dataset|subject)|(std\\()",colnames(df2))) #create dataframe with category variables and mean variables
names(df2_std) <- sub("-std\\()","",names(df2_std)) #simplify column names with std()
df2_std <- mutate(df2_std, metric = "std") #add column with "std" metric to tidy it up


df2_mean <- mutate(df2_mean, experiment = 1:nrow(df2_mean)) # add column to denote experiment.
df2_std <- mutate(df2_std, experiment = 1:nrow(df2_std)) # add column to denote experiment - should be the same for metric
df2_total <- rbind(df2_mean, df2_std) # union both dataframes


# (3) Uses descriptive activity names to name the activities in the data set
df2_total <- select(df2_total, -(activity_id))
df2_total <- select(df2_total, experiment, dataset, subject_id, activity, metric, everything()) 
df2_total <- mutate(df2_total, subject_id = as.character(subject_id), activity = tolower(activity))
df2_total <- rename(df2_total, subject = subject_id)


# (4) Appropriately labels the data set with descriptive variable names.
names(df2_total) <- sub("^t","Time",names(df2_total)) # For columns that are time-based
names(df2_total) <- sub("^f","Freq",names(df2_total)) # For columns that are frequency-based 
names(df2_total) <- sub("Acc","Accel",names(df2_total)) # To make clear that it corresponds to Accelerator type
names(df2_total) <- sub("Mag","Magnit",names(df2_total)) # To make clear that it corresponds to Magnitude type

head(df2_total) 


# (5) From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

df2_summary <- select(df2_total, -(experiment:dataset)) #excluding variables that will not be part of the summary
df2_grouped <- group_by(df2_summary,subject,activity,metric) # group 
df2_final <- summarize_all(df2_grouped, mean)
head(df2_final) #check rows of final dataset





