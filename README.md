# Getting-and-Cleaning-Data-Project
Project Description:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

References:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

This Repository Contains:
1. README.md
2. finalData.txt which contains the final data that has been cleaned, and merged
3. finalData2.txt which contains a second, independent tidy data set with the average of each variable for each activity and each subject using the dataset from finalData.txt
4. run_analysis.R that contains the R script used to clean and transform the raw data
5. CodeBook.md is a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data

Steps in run_analysis.R
1. Merges the training and test data 
2. Merges the subject data from training and test datasets
3. Merges the activity label data from training and test datasets
4. Read in feature list to be used as column names
5. Keep only the std and mean columns
6. Subsituting the numbers with corresponding activity names in the activity label data column
7. Combine the activity labels, subject numbers and records into the final dataset
8. Use data.table functions to group finalData by each subject and activity combinations and get the mean for every other variable


