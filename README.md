# README for run_analysis.R script 
---

This file describes how the run_analysis.R code script works.

## Get the source data

### Fetch the source data file
The first step is to download the file from the url provided. The file is at the following location:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The file is retrieved using the download.file command and placed in the working directory.

It is then unzipped to the current working directory using the unzip command. The data unzips to a sub-directory named "UCI HAR Dataset" inside the working directory. 

You can navigate this directory to familiarize yourself with the folder structure and files.

The test related datasets are present in the "/UCI HAR Dataset/test/" folder.

The train related datasets are present in the "/UCI HAR Dataset/train/" folder.

## Prepare a wide dataset with averages of mean and std features from test and train data

### Load variable descriptions 
Load the list of features from "features.txt" and activity list from "activity_labels.txt" which are under the "UCI HAR Dataset" folder.

### Load XTest and XTrain data
Load the XTest data from "X_test.txt" and XTrain data from "X_train.txt" using read.table function.

In each case, we use read.table to read a 5 row sample first to identify classes that will help load these files faster.

### Merge XTest and XTrain data
This is done using the rbind function. The resulting dataset is named as TrainTestData. 

### Provide descriptive names to the merged dataset
The feature names from the features.txt file are assigned to the column names of the merged dataset (TrainTestData).

### Extract only those columns realated to mean and standard deviation 
For mean, only measures with "mean()" in description are considererd.

Other descriptions with mean in description like angle(tBodyAccJerkMean) & meanFreq() are excluded.

For standard deviation, only measures with "std" in description are considered.

The grep function is used to identify columns that have mean and std in them. 

The TrainTestDataSubset is created by selecting only the mean and std columns from the TrainTestData dataset.

### Load activity data for Test and Train datasets
Load the activity data for Test from "y_test.txt". The activity data for Train is available in "y_train.txt".

Merge the two datasets using rbind function. The resulting dataset is named as TrainTestActivity.

Provide the descriptive column name as "Activity".

### Load subject data for Test and Train datasets
Load the subject data for Test from "subject_test.txt". The subject data for Train is available in "subject_train.txt".

Merge the two datasets using rbind function. The resulting dataset is named as TrainTestSubject.

Provide the descriptive column name as "Subject"

### Merge the TrainTestDataSubset with Activity and Subject datasets
This is performed using cbind with TrainTestDataSubset, TrainTestActivity and TrainTestSubject.

The resulting combined dataset is called TrainTestMaster.

### Use descriptive names for Activity column
The activity names from the "activity_labels.txt" are used to replace numeric values with their text equivalents.

### Clean up the descriptive names in the dataset
The column names contain characters like paranthesis, hypens etc which are not desirable.

Using the make.names function the column names for TrainTestMaster dataset can be made more acceptable. Also remove extra "." characters and repeated words (BodyBody).

### Create an wide data set with the averages
From the TrainTestMaster dataset create an independent tidy data set with the average of each variable for each activity and each subject.

We can use the aggregate function for this purpose. We aggregate the 66 numeric columns by Activity and Subject and store the result in a new dataset called TrainTestAverage.

Also name the grouping columns in the newly created dataset, to better reflect their data (Activity and Subject).

## Create a narrow dataset from the wide dataset

### Separate mean and std values into separate datasets
From the TrainTestAverage dataset, create 2 datasets, one for the mean variables and another for the standard devation variables using the melt function. The mean and std related columns are identified using the grep function. The datasets are named meanMelt and stdMelt respectively.

### Standardize the feature names
All extra characters like "." are cleaned up using the gsub function. References to "mean" and "std" are also removed resulting in generic field names.

The columns are also provided with descriptive column names such as "Feature", "Mean" and "Standard Deviation".

### Combine the cleaned up mean and Standard deviation datasets into a single tidy dataset
Using the join function, meanMelt and stdMelt are now joined based on the 3 common columns: Activity, Subject and Feature.

The resulting dataset has five columns: Activity, Subject, Feature, Mean, Standard Deviation.

This provides the tidy dataset named as TrainTestAverageTidy.

### Write the tidy dataset to a text file
We write the TrainTestAverageTidy dataset to a text file (TidyData.txt), so that this information can be later uploaded to the course website.

Please refer to the Codebook.md file for a detailed description of the variables in the Tidy dataset.


