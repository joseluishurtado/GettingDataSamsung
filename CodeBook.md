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
- subject: This is a (char) variable, which contains each individual that participated in the experiment. It goes from 1 to 30
- activity: This is a (char) variable, which denotes the activities conducted by each individual (Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying)
- metric: This is a (char) variable, indicating whether the metric is a 'mean' or a 'std' for each of the variables
- TimeBodyAccel-X: Time body accelerator signal for axial X
- TimeBodyAccel-Y: Time body accelerator signal for axial Y
- TimeBodyAccel-Z: Time body accelerator signal for axial Z
- TimeGravityAccel-X: Time gravity accelerator signal for axial X
- TimeGravityAccel-Y: Time gravity accelerator signal for axial Y
- TimeGravityAccel-Z: Time gravity accelerator signal for axial Z
- TimeBodyAccelJerk-X: Time body accelerator jerk signal for axial X
- TimeBodyAccelJerk-Y: Time body accelerator jerk signal for axial Y
- TimeBodyAccelJerk-Z: Time body accelerator jerk signal for axial Z
- TimeBodyGyro-X: Time body gyro signal for axial X
- TimeBodyGyro-Y: Time body gyro signal for axial Y
- TimeBodyGyro-Z: Time body gyro signal for axial Z
- TimeBodyGyroJerk-X: Time body gyro jerk signal for axial X
- TimeBodyGyroJerk-Y: Time body gyro jerk signal for axial Y
- TimeBodyGyroJerk-Z: Time body gyro jerk signal for axial Z
- TimeBodyAccelMagnit: Time body accelerator signal magnitude
- TimeGravityAccelMagnit: Time gravity accelerator signal magnitude
- TimeBodyAccelJerkMagnit: Time body accelerator jerk signal magnitude
- TimeBodyGyroMagnit: Time body gyro magnitude
- TimeBodyGyroJerkMagnit: Time body gyro jerk magnitude
- FreqBodyAccel-X: Frequency body accelerator signal for axial X
- FreqBodyAccel-Y: Frequency body accelerator signal for axial Y
- FreqBodyAccel-Z: Frequency body accelerator signal for axial Z
- FreqBodyAccelJerk-X: Frequency body accelerator jerk signal for axial X
- FreqBodyAccelJerk-Y: Frequency body accelerator jerk signal for axial Y
- FreqBodyAccelJerk-Z: Frequency body accelerator jerk signal for axial X
- FreqBodyGyro-X: Frequency body gyro signal for axial X
- FreqBodyGyro-Y: Frequency body gyro signal for axial Y
- FreqBodyGyro-Z: Frequency body gyro signal for axial Z
- FreqBodyAccelMagnit: Frequency body accelerator signal magnitude
- FreqBodyAccelJerkMagnit: Frequency body accelerator jerk signal magnitude
- FreqBodyBodyGyroMagnit: Frequency body gyro signal magnitude
- FreqBodyBodyGyroJerkMagnit: Frequency body body gyro jerk signal magnitude
































