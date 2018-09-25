# GettingDataSamsung
Coursera - Getting and Cleaning Data Project - Human Activity Recognition using Smartphones (Samsung Galaxy S II)

**I.- CONTEXT - PROJECT DESCRIPTION - (Taken from Readme file in project document)**

Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws



The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

**II.- DESCRIPTION OF FILES:**

1.-  run_analysis.R: 
It contains the code that was used to do the following steps
1.1- Merges the training and the test sets to create one data set.
1.2- Extracts only the measurements on the mean and standard deviation for each measurement.
1.3- Uses descriptive activity names to name the activities in the data set
1.4- Appropriately labels the data set with descriptive variable names.
1.5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

2.- Activity_SamsungII.txt: 
This is the tidy dataset, containing the summary of means and std for subjects, activities, and variables

3.- CodeBook.MD: 
It contains the variables that are part of the "Activity_SamsungII.txt" file

4.- README.md:
This file. It provides a summary of the project, files available in the repository, and steps taken to address the requirements of the project

**III.- STEPS TAKEN TO DEVELOP THE PROJECT:**

The code was structured so as to be in line with the requirements of the project, from the initial collecting of the input datasets to the generation of the final tidy data outcome. Below I will describe each of those components:

**1. Merge training and test sets to create one data set:**
1.1- First, we create the training data set adding activity data, labeling, and subject data
(a) Use activity_labels.txt and y_train.txt to match activity labels to activity numbers
(b) Combine the resulting data frame "activity_train" with the table "subject_train.txt" to get a table that has the individual who conducted the training and the corresponding activity. Add a column that indicates that this data frame is the training dataset
(c) Add labels to the training set ("features.txt")
(d) We need to vectorize the column so that it can be appended to the train data set
1.2- We repeat the same steps (a)-(b) to create the test data set
1.3- We merge the training and test datasets using rbind. 
1.4- The resulting data frame of this step is named "merged_dataset"

**2. Extracts only the measurements on the mean and standard deviation for each measurement.**
2.1- Before extracting the measurements, we explore the resulting the dataset a little further, with functions such as str(), head(), tail(). We also look for potential null values as well as duplicated columns.
2.2- As a result of it, we create a dataframe (I named it "df2") which will remove duplicated columns
2.3- Using dplyr package and grep, extract all the dimension columns as well as all variables with mean() and std()
2.4- My proposed way to simplify the dataset and make it tidy is by creating a column named "metrics", which will contain the mean and std for each of the activity variables
- To do that, I create two data frames: "df2_mean" and "df2_std". Each of them contains the corresponding metric component for each of the categories and corresponding variables
- To each dataset, I remove from the column names the "-mean()" and "-std()" strings, as they will be contained in the new metrics column
- In order to keep both the "mean" and "std" metrics associated to the same subject and activity, I create another column named "experiment", which is essentially an index that ties the mean and std for each activity and subject
- Then, I merge the "df2_mean" and "df2_std" datasets by using rbind()
2.5- The resulting data frame from this step is named "df2_total"

**3. Uses descriptive activity names to name the activities in the data set**
3.1- Here, I continue using the "df2_total" data frame. I use the dplyr library to select the columns that will be needed in further steps
- As a result, the column "activity_id" is removed because it is already covered by the "activity" variable, which contains the labels for each activity
3.2- I also rename the column "subject_id" to "subject" 
3.3- The resulting data frame from this step continues to be named "df2_total"

**4. Appropriately labels the data set with descriptive variable names.**
Considering the significant number of activities that need to be measured, here I made the following modifications to the way these activities are named
4.1- For columns that start with "t": I substitute the initial "t" for "Time", to show that these activities are time-based
4.2- For columns that start with "f": I substitute the initial "f" for "Freq", to show that those activities are frequency-based
4.3- For those columns with string "Acc": I substitute it with "Accel" to make it more clear that it corresponds to accelerator-type initiatives
4.4- For those columns with string "Mag": I substitute it with "Magnit" to make it more clear that it corresponds to magnitude-type initiatives
4.5 The resulting data frame continues to be named "df2_total". It is from this version that the tidy dataset will be extracted

**5.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**
5.1- I create a subset data frame named "df_summary", excluding variables that will not be part of the requested final dataset
5.2- I use the "group_by" function from dplyr package to group the categories subject, activity, and metric, that will be part of the final dataset with means
5.3- I obtain the average of each variable for each activity and subject by using the "summarize_all" function from dplyr package
5.4- The final dataset is named "df2_final"

It is from df2_final dataframe that the file "Activity_SamsungII.txt" is created




















