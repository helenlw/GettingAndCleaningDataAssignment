# Assignment Code Book - Getting and Cleaning Data

## Study Design

Download data from the following web address

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Extract data from the downloaded zip file
Copy extracted text files to the working directory
Run script Run_analyst.R
  Read train and test datasets
  Combine to one dataset
  Extract variables of interest (average(mean) of all measurements)
  Reshape data to to list each variable for each subject and acivity combination
  Write text file.


## Code Book

Label Description - Describes the activity of each subject eg WALKING.
Subject - The subject number.
variables - Each variable represents the mean of a measurement in the experiment

The unique list of varibles is listed below.

tBodyAccMag-mean() 
tGravityAccMag-mean()
tBodyAccJerkMag-mean()
tBodyGyroMag-mean()
tBodyGyroJerkMag-mean()
fBodyAccMag-mean()
fBodyBodyAccJerkMag-mean()
fBodyBodyGyroMag-mean()
fBodyBodyGyroJerkMag-mean()

Value - Value of each variable.

For more information please read the ReadMe.txt from download.
Also see - 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


Reference


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
