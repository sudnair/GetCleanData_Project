# Human Activity Recognition Using Smartphones Dataset
---

## Background

The data presented here is a subset of the data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

## Features Selected from Raw Data (Mean and Standard Deviation)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc.XYZ and tGyro.XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc.XYZ and tGravityAcc.XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk.XYZ and tBodyGyroJerk.XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc.XYZ, fBodyAccJerk.XYZ, fBodyGyro.XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '.XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 
mean: Mean value
std : Standard deviation

## Transformation performed

The Features, Activity and Subject for the test and train data were combined to produce a single dataset.

The feature names were made more descriptive and activity ids were replaced by the activity descriptions.

The average of each selected mean and stand deviation variable for each activity and each subject combination was computed.

The dataset was converted from wide to narrow, so that all the features were now represented in rows and each feature had its mean and standard deviation displayed for every combination of activity and subject.

The result is a narrow data set with five columns: Activity, Subject, Feature, Mean, Standard Deviation

## Data Dictionary 



-  Activity    : Activity performed by subject

> 

         Factor with 6 levels:
         WALKING
         WALKING_UPSTAIRS
         WALKING_DOWNSTAIRS
         SITTING
         STANDING
         LAYING



-  Subject     : Identifier of the subject who carried out the experiment

> 

         Integer 
         Range from 1 to 30



-  Feature     : The features come from the accelerometer and gyroscope 3-axial raw signals

> 

         Factor with 33 levels:
         tBodyAccX : Time domain body Acceleration signal along X axis 
         tBodyAccY : Time domain body Acceleration signal along Y axis 
         tBodyAccZ : Time domain body Acceleration signal along Z axis 
         tGravityAccX : Time domain gravity Accelaration signal along X axis 
         tGravityAccY : Time domain gravity Accelaration signal along Y axis 
         tGravityAccZ : Time domain gravity Accelaration signal along Z axis 
         tBodyAccJerkX : Time domain body Acceleration Jerk signal along X axis
         tBodyAccJerkY : Time domain body Acceleration Jerk signal along X axis 
         tBodyAccJerkZ : Time domain body Acceleration Jerk signal along X axis 
         tBodyGyroX : Time domain body Gyroscopic signal along X axis 
         tBodyGyroY : Time domain body Gyroscopic signal along Y axis 
         tBodyGyroZ : Time domain body Gyroscopic signal along Z axis 
         tBodyGyroJerkX : Time domain body Gyroscopic Jerk signal along X axis 
         tBodyGyroJerkY : Time domain body Gyroscopic Jerk signal along Y axis
         tBodyGyroJerkZ : Time domain body Gyroscopic Jerk signal along Z axis 
         tBodyAccMag : Magnitude of time domain body Acceleration signal 
         tGravityAccMag : Magnitude of time domain gravity Acceleration signal 
         tBodyAccJerkMag : Magnitude of time domain body Acceleration Jerk signal 
         tBodyGyroMag : Magnitude of time domain body Gyroscopic signal 
         tBodyGyroJerkMag : Magnitude of time domain body Gyroscopic Jerk signal
         fBodyAccX : Frequency domain body Acceleration signal along X axis
         fBodyAccY : Frequency domain body Acceleration signal along Y axis 
         fBodyAccZ : Frequency domain body Acceleration signal along Z axis 
         fBodyAccJerkX : Frequency domain body Acceleration Jerk signal along X axis 
         fBodyAccJerkY : Frequency domain body Acceleration Jerk signal along Y axis 
         fBodyAccJerkZ : Frequency domain body Acceleration Jerk signal along Z axis 
         fBodyGyroX : Frequency domain body Gyroscopic signal along X axis 
         fBodyGyroY : Frequency domain body Gyroscopic signal along Y axis 
         fBodyGyroZ : Frequency domain body Gyroscopic signal along Z axis 
         fBodyAccMag : Magnitude of frequency domain body Acceleration signal 
         fBodyAccJerkMag : Magnitude of frequency domain body Acceleration Jerk signal 
         fBodyGyroMag : Magnitude of frequency domain body Gyroscopic signal 
         fBodyGyroJerkMag : Magnitude of frequency domain body Gyroscopic Jerk signal



-  Mean	     : Average of the Mean value. Computed for each Activity, Subject and Feature.

> 

         Numeric



-  StandardDeviation  : Average of the Standard Deviation value.  Computed for each Activity, Subject and Feature

> 

         Numeric

