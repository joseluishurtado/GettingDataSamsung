**Contents - CodeBook.md**
I.- Context on Feature Selection (Source Files)
II.- List of Variables - Activity_SamsungII.txt (tidy dataset)


**I.- CONTEXT ON FEATURE SELECTION (SOURCE FILES)**
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals and used in the tidy dataset are:

mean(): Mean value
std(): Standard deviation


**II.- LIST OF VARIABLES - Activity_SamsungII.txt (tidy_dataset):**
Before describing the list of variables, some observations on the transformations that were made to the labels of the original list above:

**2.1 General Transformations:**
Labeling in a more clear way:
- Columns that started with 't': Substituted 't' with 'Time', to denote time-based variables in a more clear way
- Columns that started with 'f': Substituted 'f' with 'Freq', to denote frequency-based variables in a more clear way
- Columns that contain 'Acc': Substituted 'Acc' with 'Accel' to make more clear the Accelerator feature in the variable
- Columns that contain 'Mag': Substituted 'Mag' with 'Magnit' to make more clear the Magnitude feature in the variable 

Removing some characters in each column:
- Columns that contain '-mean()': Removed from the name as mean will be contained in a new variable named 'metric'
- Columns that contain '-std()': Removed from the column name as std will be contained in a new variable named 'metric'

Removing *_* from column names:
- For example: 'subject_id' renamed to 'subject'

**2.2 List of Variables:**
1- subject: This is a (char) variable, which contains each individual that participated in the experiment. It goes from 1 to 30
2- activity: This is a (char) variable, which denotes the activities conducted by each individual (Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying)
3- metric: This is a (char) variable, indicating whether the metric is a 'mean' or a 'std' for each of the variables
4- TimeBodyAccel-X: Time body accelerator signal for axial X
5- TimeBodyAccel-Y: Time body accelerator signal for axial Y
6- TimeBodyAccel-Z: Time body accelerator signal for axial Z
7- TimeGravityAccel-X: Time gravity accelerator signal for axial X
8- TimeGravityAccel-Y: Time gravity accelerator signal for axial Y
9- TimeGravityAccel-Z: Time gravity accelerator signal for axial Z
10- TimeBodyAccelJerk-X: Time body accelerator jerk signal for axial X
11- TimeBodyAccelJerk-Y: Time body accelerator jerk signal for axial Y
12- TimeBodyAccelJerk-Z: Time body accelerator jerk signal for axial Z
13- TimeBodyGyro-X: Time body gyro signal for axial X
14- TimeBodyGyro-Y: Time body gyro signal for axial Y
15- TimeBodyGyro-Z: Time body gyro signal for axial Z
16- TimeBodyGyroJerk-X: Time body gyro jerk signal for axial X
17- TimeBodyGyroJerk-Y: Time body gyro jerk signal for axial Y
18- TimeBodyGyroJerk-Z: Time body gyro jerk signal for axial Z
19- TimeBodyAccelMagnit: Time body accelerator signal magnitude
20- TimeGravityAccelMagnit: Time gravity accelerator signal magnitude
21- TimeBodyAccelJerkMagnit: Time body accelerator jerk signal magnitude
22- TimeBodyGyroMagnit: Time body gyro magnitude
23- TimeBodyGyroJerkMagnit: Time body gyro jerk magnitude
24- FreqBodyAccel-X: Frequency body accelerator signal for axial X
25- FreqBodyAccel-Y: Frequency body accelerator signal for axial Y
26- FreqBodyAccel-Z: Frequency body accelerator signal for axial Z
27- FreqBodyAccelJerk-X: Frequency body accelerator jerk signal for axial X
28- FreqBodyAccelJerk-Y: Frequency body accelerator jerk signal for axial Y
29- FreqBodyAccelJerk-Z: Frequency body accelerator jerk signal for axial X
30- FreqBodyGyro-X: Frequency body gyro signal for axial X
31- FreqBodyGyro-Y: Frequency body gyro signal for axial Y
32- FreqBodyGyro-Z: Frequency body gyro signal for axial Z
33- FreqBodyAccelMagnit: Frequency body accelerator signal magnitude
34- FreqBodyAccelJerkMagnit: Frequency body accelerator jerk signal magnitude
35- FreqBodyBodyGyroMagnit: Frequency body gyro signal magnitude
36- FreqBodyBodyGyroJerkMagnit: Frequency body body gyro jerk signal magnitude
































