# Getting and Cleaning Data Project John Hopkins Coursera
# Author: Allen Brown

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data 
# | set with the average of each variable for each activity and each subject.

#Loads activity data sets from test and train within working directory

testactivity  <- read.table("test/Y_test.txt" , header = FALSE)
trainactivity <- read.table("train/Y_train.txt", header = FALSE)

#Loads subject data sets from test and train

testsubject  <- read.table("test/subject_test.txt", header = FALSE)
trainsubject <- read.table("train/subject_train.txt", header = FALSE)

#Loads features data sets from test and train

testfeatures  <- read.table("test/X_test.txt", header = FALSE)
trainfeatures <- read.table("train/X_train.txt", header = FALSE)

#Combines activity, subject, and features sets from test and train respectively
#Merges the training and the test sets to create one data set.

activity <- rbind(trainactivity, testactivity)
subject <- rbind(trainsubject, testsubject)
features <- rbind(trainfeatures, testfeatures)

#Changes factor levels(1-6) to match activity labels
labels <- read.table("activity_labels.txt", header = FALSE)
activity$V1 <- factor(activity$V1, levels = as.integer(labels$V1), labels = labels$V2)

#Names activity and subject columns

names(activity)<- c("activity")
names(subject)<-c("subject")

#Names feature columns from features text file

featurestxt <- read.table("features.txt", head=FALSE)
names(features)<- featurestxt$V2

#Selects columns with mean and standard deviation data and subsetting

meanSD<-c(as.character(featurestxt$V2[grep("mean\\(\\)|std\\(\\)", featurestxt$V2)]))
subdata<-subset(features,select=meanSD)

#Combines data sets with activity names and labels

subjectActivity <- cbind(subject, activity)
completedata <- cbind(subdata, subjectActivity)

#Clarifying variables
names(completedata)<-gsub("^t", "time", names(completedata))
names(completedata)<-gsub("^f", "frequency", names(completedata))
names(completedata)<-gsub("Acc", "Accelerometer", names(completedata))
names(completedata)<-gsub("Gyro", "Gyroscope", names(completedata))
names(completedata)<-gsub("Mag", "Magnitude", names(completedata))
names(completedata)<-gsub("Freq", "Frequency", names(completedata))
names(completedata)<-gsub("mean", "Mean", names(completedata))
names(completedata)<-gsub("std", "StandardDeviation", names(completedata))
names(completedata) <- gsub("BodyBody", "Body", names(completedata))

# Creates new data set with subject and activity means

suppressWarnings(tidydata <- aggregate(completedata, by = list(completedata$subject, completedata$activity), FUN = mean))
colnames(tidydata)[1] <- "Subject"
names(tidydata)[2] <- "Activity"

#Removes avg and stdev for non-aggregated sub and act columns
tidydata <- tidydata[1:68]

#Writes tidy data to text file
write.table(tidydata, file = "tidydata.txt", row.name = FALSE)