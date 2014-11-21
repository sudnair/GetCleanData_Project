# Download and unzip the datafile in the working directory 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file (fileUrl, destfile = "dataset.zip",mode="wb")
unzip ("dataset.zip")

# Load list of features and activities into variables from their respective files
featureList <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
activityList <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)

# Determine column classes for X test to help speed up data load and load test dataset
tab5rows <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE, nrows = 5)
classes <- sapply(tab5rows, class)
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE,colClasses = classes)

# Determine column classes for X train to help speed up data load and load train dataset 
tab5rows <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE, nrows = 5)
classes <- sapply(tab5rows, class)
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE,colClasses = classes)

# Merge the training and the test sets to create one data set.
# and appropriately label the data set with descriptive variable names
TrainTestData <- rbind(xTrain,xTest)
colnames(TrainTestData) <- featureList[,2]

# Extract only the measurements on the mean and standard deviation for each measurement
# For mean, only measures with "mean()" in description are considererd.
# Other descriptions with mean in description like angle(tBodyAccJerkMean) & meanFreq() are excluded.
# For std, only measures with "std" in description are considered
TrainTestDataSubset <- TrainTestData[, grep("mean\\(|std",colnames(TrainTestData))]

# Load activity data for Test and Train datasets into variables
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)

# Merge the activity training and test sets to create one data set and label with descriptive variable name
TrainTestActivity <- rbind(yTrain,yTest)
names(TrainTestActivity) <- "Activity"

# Load subject data for Test and Train datasets into variables
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

# Merge the subject training and test sets to create one data set and label with descriptive variable name
TrainTestSubject <- rbind(subjectTrain,subjectTest)
names(TrainTestSubject) <- "Subject"

# Combine the measures, activity and subject datasets
TrainTestMaster <- cbind(TrainTestDataSubset,TrainTestSubject,TrainTestActivity) 

# Use descriptive activity names to describe the activities in the data set
TrainTestMaster$Activity <- factor(TrainTestMaster$Activity, labels = activityList[,2])

# Appropriately label the data set with descriptive variable names and remove unnecessary characters.
colnames(TrainTestMaster)<- make.names(colnames(TrainTestMaster), unique = TRUE, allow_ = FALSE)
colnames(TrainTestMaster) <- gsub("BodyBody", "Body", colnames(TrainTestMaster))
colnames(TrainTestMaster) <- gsub("\\.\\.", "", colnames(TrainTestMaster))

# From the data subset, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
TrainTestAverage <- aggregate( TrainTestMaster[,1:66], by=list(TrainTestMaster$Subject,TrainTestMaster$Activity), FUN=mean)

# Provide the grouping labels with descriptive variable names 
names(TrainTestAverage)[2] <- "Activity"
names(TrainTestAverage)[1] <- "Subject"

# The code section below will now to convert the wide data set into a narrow tidy dataset

# Using melt function separate the mean variable dataset and std variable dataset
library(reshape2)
meanMelt <- melt(TrainTestAverage, id=c("Activity","Subject"),measure.vars=grep(".mean",colnames(TrainTestAverage)))
stdMelt <- melt(TrainTestAverage, id=c("Activity","Subject"),measure.vars=grep(".std",colnames(TrainTestAverage)))

# Clean the descriptive variable names to remove extra characters and make feature name generic (remove mean)
meanMelt$variable <- gsub(".mean", "", meanMelt$variable)
meanMelt$variable <- gsub("\\.", "", meanMelt$variable)
meanMelt$variable <- factor(meanMelt$variable)
# Rename the varible to Feature and value to mean
names(meanMelt)[3] <- "Feature"
names(meanMelt)[4] <- "Mean"

# Clean the descriptive variable names to remove extra characters and make feature name generic (remove std)
stdMelt$variable <- gsub(".std", "", stdMelt$variable)
stdMelt$variable <- gsub("\\.", "", stdMelt$variable)
stdMelt$variable <- factor(stdMelt$variable)
# Rename the varible to Feature and value to Standard Deviation
names(stdMelt)[3] <- "Feature"
names(stdMelt)[4] <- "StandardDeviation"

# Use join function from plyr to join the Mean and Std datasets into one dataset 
# Use Activity, Subject and Feature columns as key for the join
library(plyr)
TrainTestAverageMelt <- join( meanMelt, stdMelt, by=c("Activity","Subject","Feature"))

# Order the dataset for better readability
TrainTestAverageTidy <- TrainTestAverageMelt[with(TrainTestAverageMelt,order(Activity,Subject,Feature)),]

# Write the narrow tidy data set to a text file
write.table(TrainTestAverageTidy, file = "TidyData.txt", row.names = FALSE)

