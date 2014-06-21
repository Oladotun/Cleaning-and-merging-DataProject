Getting and Cleaning Data: Course Project by Oladotun Opasina
=============================================================

Introduction
------------
This file explains how the run_analysis.R scripts work and the step taken to get a tidy data set. The resulting data can be found in tidy.txt

Points about the raw data
-------------------------

The features are unlabeled data that are both test and training data sets.
The test data set are found in the X_test.txt file
The test activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.

The same holds for the training set with '_train.txt' prefix.

Script used to produce tidy data set
-------------------------------------
The script created is called run_analysis.R as required by the specification. It will be used to combine the test and training sets together,label the data sets and create a tidy data from the collected data.

Prerequisites for this script:

1. the UCI HAR Dataset zip file must be first downloaded and extracted
2. the current R working directory must be set to the UCI HAR Dataset folder


Steps Taken for tidy data set: 
1. Extract file to table format
2. Combine train and test data together 
3. Combine the subject to the activities label data for both test and train sequence.
4. Extract mean and data using regular expressions 
5. Rename each column using the gsub function
6. Label the subject and activity fields
7. Use descriptive names to name the activities in the data set
8. Use the aggregate function to group the subject by name, and activities then calculated the mean of the features extracted.
9. Removed unwanted columns from the tidy data sets
10. Created the tidy data set containing the means of all the columns per test subject and per activity in a tidy.txt file.

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.

