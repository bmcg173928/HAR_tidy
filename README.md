## README

## Overview

The 'run_analysis.R' script loads the Human Activity Recognition (HAR) Using Smartphones Dataset [1] and tidys the dataset.  The HAR data were provided as two sets; the two sets were combined for use in this script.  The combined initial dataset used in this script is 10299 observations of 561 movement variables with 2 identifying parameters.  Identifying parameters include the subject identification number (1-30) and the activity performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  The 561 output variables includes various acceleration measurements, mean, and standard deviations for each activity performed by each subject.  This script tidys the dataset by calculating and reporting means for each activity for each subject of the mean and standard deviation values calculated in the original study.

## Required Actions 

1) Install the 'dplyr' package
2) Configure data
2.1) Option 1 - Data manually downloaded
2.1.1) Download the Human Activity Recognition Using Smartphones Dataset
2.1.2) Unzip the files
2.1.3) Set the R working directory as the "UCI HAR Dataset" parent directory
2.2) Option 2 - Data automatically downloaded
2.2.1) Open 'run_analysis.R' script
2.2.2) Uncomment the 'download dataset' section
2.2.3) Run the 'download dataset' setction.  The dataset will be downloaded, unzipped, and set as the working directory with the script.


## Detailed steps

The 'run_analysis.R' script downloads the Human Activity Recognition Using Smartphones Dataset [1] and performs the following operations:

1) Loads the training dataset (7352 observations of 561 variables).
2) Adds subject identifiers and actvity labels to the training dataset (7352 observations of 563 variables).
3) Loads the test dataset (2947 observations of 561 variables).
4) Adds subject identifiers and actvity labels to the test dataset (2947 observations of 563 variables).
5) Combines the test and training datasets to form one dataset (10299 observations of 563 variables).
6) Extracts mean and standard deviations calculated for variables shown in the codebook (66 applicable variables).
7) Calculates the mean for each variable in (6) per activity per subject (180 observations).
8) Outputs the tidy dataset as dataframe labeled 'HAR_tidy'.  The 'HAR_tidy' dataset has 180 observations of 68 variables.  A full list of variables is provided in the HAR_tidy codebook.
9) Saves the 'HAR_tidy' dataframe as 'HAR_tidy.txt'

## The script includes the following files:

-'run_analysis.R': script which downloads data and performs tidying operations

-'README.md': this file; explains data, operations, and included files

-'CodeBook.md': provides list of identifying parameters and output variables

-'HAR_tidy.txt': tidy dataset output from this script

## Source

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
