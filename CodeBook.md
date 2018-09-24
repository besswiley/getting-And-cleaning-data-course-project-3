# title: "Codebook"
# author: "Allen Brown"
# date: "2018-09-23"
# output:run_analysis.R

## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or 
|  work that you performed to clean up the data called CodeBook.md. 
|  You should also include a README.md in the repo with your scripts. 
|  This repo explains how all of the scripts work and how they are connected.

## Collection of the raw data
features.txt: Names of the 561 features.

activity_labels.txt: Names and IDs for each of the 6 activities.

X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.

subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.

y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.

subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.

y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.


## Guide to create the tidy data file
Loads activity data sets from test and train within working directory
Loads subject data sets from test and train
Loads features data sets from test and train
Combines activity, subject, and features sets from test and train respectively
Merges the training and the test sets to create one data set.
Changes factor levels(1-6) to match activity labels
Names activity and subject columns
Names feature columns from features text file
Selects columns with mean and standard deviation data and subsetting
Combines data sets with activity names and labels
Clarifying variables
Creates new data set with subject and activity means
Removes avg and stdev for non-aggregated sub and act columns
Writes tidy data to text file


## Dataset structure
#str(tidydata)

## Summary of variables
#summary(tidydata)
