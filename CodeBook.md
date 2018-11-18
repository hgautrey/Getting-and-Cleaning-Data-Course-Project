---
title: Codebook
author: Hannah Gautrey
date: 17/11/2018
---

## Project Description
Human activity recognition using smartphones.

## Study design and data processing
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

### Collection of the raw data
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The raw data for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## Creating the tidy datafile

### Guide to create the tidy data file
1. Check if a directory exists and if not create one.
2. Download the data into the directory.
3. Record the date of the download
4. Unzip the data.
5. Read the data files (features.txt, X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt, activity_labels.txt) into R using read.table.
6. The variable names in column V2 in features file were assigned to variables.
7. Use variables to assign column names to the X_test and X_train data frames.
8. A data frame (test_df) containing all the test data was created through binding the columns of subject_test (contains subject id), y_test (contains activity id) and X_test (dataset).
9. A data frame (train_df) containing all the train data was created through binding the columns of subject_train (contains subject id), y_train (contains activity id) and X_train (dataset).
10. The train_df and test_df were merged through row binding (combined_df).
11. Subset the columns by using grepl to create a logical vector of the column names that contain either "mean"(means), "std"(standard deviation) or "V1". "V1" selects the columns with the subject and activity id's. 
12. To get descriptive activity names the combined_df is merged with the activity_labels data frame using the columns containing the activity id's(V1 for activity_labels and V1.1 for combined_df).
13. Then remove the column containing the activity id's using select()(dplyr).
14. Rename the columns in the data frame so that the variables have descriptive names using rename()(dplyr). Column "V1.y" containing the subject id's was renamed "Subject", and "V2" which containing the activity names was renamed "Activity".
15. Melt the data frame using melt()(reshape2), using "Activity" and "Subject" as the id variables.
16. Summerise the data using dcast() (reshape2) to obtain the mean of each variable for each Subject and Activity.

## Variables in the tidy_data.txt file
180 obs. of 81 variables.
180 obs. = 30 subjects performing 6 activities each

### Activity
Activity performed by the subject.
-Factor w/ 6 levels 
-WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

### Subject
The subject id
-Integer
-1 to 30

### tBodyAcc-mean()-X
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc- accelerometer
X- X axis

### tBodyAcc-mean()-Y
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc- accelerometer
Y- Y axis

### tBodyAcc-mean()-Z
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Z - Z axis

### tBodyAcc-std()-X
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc- accelerometer
X- X axis

### tBodyAcc-std()-Y
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc- accelerometer
X- X axis

### tBodyAcc-std()-Z 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc- accelerometer
X- X axis

### tGravityAcc-mean()-X 
Averaged mean value for each subject doing each activity
t - time domain signal
Gravity - gravity acceleration signal
Acc- accelerometer
X- X axis

### tGravityAcc-mean()-Y
Averaged mean value for each subject doing each activity
t - time domain signal
Gravity - gravity acceleration signal
Acc - accelerometer
Y - Y axis

### tGravityAcc-mean()-Z 
Averaged mean value for each subject doing each activity
t - time domain signal
Gravity - gravity acceleration signal
Acc- accelerometer
Z - Z axis

### tGravityAcc-std()-X 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Gravity - gravity acceleration signal
Acc- accelerometer
X- X axis

### tGravityAcc-std()-Y 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Gravity - gravity acceleration signal
Acc- accelerometer
Y - Y axis

### tGravityAcc-std()-Z 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Gravity - gravity acceleration signal
Acc- accelerometer
Z - Z axis

### tBodyAccJerk-mean()-X 
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
X - X axis

### tBodyAccJerk-mean()-Y 
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Y - Y axis

### tBodyAccJerk-mean()-Z 
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Z - Z axis

### tBodyAccJerk-std()-X
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
X - X axis

### tBodyAccJerk-std()-Y 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Y - Y axis

### tBodyAccJerk-std()-Z 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Z - Z axis

### tBodyGyro-mean()-X
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
X - X axis

### tBodyGyro-mean()-Y
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Y - Y axis

### tBodyGyro-mean()-Z 
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Z - Z axis

### tBodyGyro-std()-X 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
X - X axis

### tBodyGyro-std()-Y 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Y - Y axis

### tBodyGyro-std()-Z
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Z - Z axis

### tBodyGyroJerk-mean()-X 
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
X - X axis

### tBodyGyroJerk-mean()-Y 
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
Y - Y axis

### tBodyGyroJerk-mean()-Z
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
Z - Z axis

### tBodyGyroJerk-std()-X 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
X - X axis

### tBodyGyroJerk-std()-Y
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
Y - Y axis

### tBodyGyroJerk-std()-Z 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
Z - Z axis

### tBodyAccMag-mean()
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Mag - magnitude of the three-dimensional signals

### tBodyAccMag-std() 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Mag - magnitude of the three-dimensional signals

### tGravityAccMag-mean()
Averaged mean value for each subject doing each activity
t - time domain signal
Gravity - gravity acceleration signal
Acc - accelerometer
Mag - magnitude of the three-dimensional signals

### tGravityAccMag-std() 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Gravity - gravity acceleration signal
Acc - accelerometer
Mag - magnitude of the three-dimensional signals

### tBodyAccJerkMag-mean()
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Mag - magnitude of the three-dimensional signals

### tBodyAccJerkMag-std()  
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Mag - magnitude of the three-dimensional signals

### tBodyGyroMag-mean()
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Mag - magnitude of the three-dimensional signals

### tBodyGyroMag-std() 
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Mag - magnitude of the three-dimensional signals

### tBodyGyroJerkMag-mean()
Averaged mean value for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
Mag - magnitude of the three-dimensional signals

### tBodyGyroJerkMag-std()
Averaged standard deviation for each subject doing each activity
t - time domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
Mag - magnitude of the three-dimensional signals

### fBodyAcc-mean()-X
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
X - X axis

### fBodyAcc-mean()-Y  
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Y - Y axis

### fBodyAcc-mean()-Z
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Z - Z axis

### fBodyAcc-std()-X 
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
X - X axis

### fBodyAcc-std()-Y  
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Y - Y axis

### fBodyAcc-std()-Z 
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Z - Z axis

### fBodyAcc-meanFreq()-X
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
X - X axis

### fBodyAcc-meanFreq()-Y
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Y - Y axis

### fBodyAcc-meanFreq()-Z
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Z - Z axis

### fBodyAccJerk-mean()-X 
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
X - X axis

### fBodyAccJerk-mean()-Y
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Y - Y axis

### fBodyAccJerk-mean()-Z 
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Z - Z axis

### fBodyAccJerk-std()-X
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
X - X axis

### fBodyAccJerk-std()-Y 
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Y - Y axis

### fBodyAccJerk-std()-Z
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Z - Z axis

### fBodyAccJerk-meanFreq()-X 
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
X - X axis

### fBodyAccJerk-meanFreq()-Y  
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Y - Y axis

### fBodyAccJerk-meanFreq()-Z
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Z - Z axis

### fBodyGyro-mean()-X 
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
X - X axis

### fBodyGyro-mean()-Y 
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Y - Y axis

### fBodyGyro-mean()-Z 
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Z - Z axis

### fBodyGyro-std()-X 
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
X - X axis

### fBodyGyro-std()-Y 
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Y - Y axis

### fBodyGyro-std()-Z
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Z - Z axis

### fBodyGyro-meanFreq()-X 
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
X - X axis

### fBodyGyro-meanFreq()-Y 
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Y - Y axis

### fBodyGyro-meanFreq()-Z
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Z - Z axis

### fBodyAccMag-mean()
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Mag - magnitude of the three-dimensional signals

### fBodyAccMag-std()  
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Mag - magnitude of the three-dimensional signals

### fBodyAccMag-meanFreq()
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Mag - magnitude of the three-dimensional signals

### fBodyBodyAccJerkMag-mean()
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Mag - magnitude of the three-dimensional signals

### fBodyBodyAccJerkMag-std() 
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Mag - magnitude of the three-dimensional signals

### fBodyBodyAccJerkMag-meanFreq() 
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Acc - accelerometer
Jerk - Jerk signal
Mag - magnitude of the three-dimensional signals

### fBodyBodyGyroMag-mean()   
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Mag - magnitude of the three-dimensional signals

### fBodyBodyGyroMag-std()  
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Mag - magnitude of the three-dimensional signals

### fBodyBodyGyroMag-meanFreq()
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Mag - magnitude of the three-dimensional signals

### fBodyBodyGyroJerkMag-mean()
Averaged mean value for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
Mag - magnitude of the three-dimensional signals

### fBodyBodyGyroJerkMag-std()
Averaged standard deviation for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
Mag - magnitude of the three-dimensional signals

### fBodyBodyGyroJerkMag-meanFreq()
Averaged mean frequency for each subject doing each activity
f - frequency domain signal
Body - body acceleration signal
Gyro - gyroscope
Jerk - Jerk signal
Mag - magnitude of the three-dimensional signals

## Sources
http://datasciencespecialization.github.io/getclean/
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/