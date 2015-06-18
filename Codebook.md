---
# Codebook for Getting and Cleaning Data Course Project Final Data Set
## Author: "derickj"
## Date: "18 June 2015"
---
 
## Project Description
The purpose of this project is to demonstrate the student's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The project uses as input a data set consisting of data collected from the accelerometers from the Samsung Galaxy S smartphone.

##Study Design and Data Processing

The data linked to from the course website represent data collected from. A full description of the study design and data processing is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 561 features was obtained by calculating variables from the time and frequency domain.

### Feature Selection 

The features selected for the input database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.
"
 
## Creating the Tidy Datafile
The purpose of the project is to create a tidy datafile from the above mentioned data set, consisting only of the means of the features relating to mean value (mean()) and standard deviation (std()) of the above mentioned estimated feature set.  The tidy data set needs to conform to the criteria for a tidy data set as described in Wickham's paper ([2]):
- Each variable forms a column
- Each observation forms a row.
- Each type of observational unit forms a table.

As described in Wickham's paper, either a wide or narrow format of data is acceptable.  In the case of this project, the student selected to use a narrow format data set, i.e., each observation consists of the mean of the estimates in the original feature vector for a single mean() or std() feature for a single subject and activity pair.  (An equally valid tidy data set would have been to include the names of these features as variables in columns)
 
###Guide to Create the Tidy Data File
The README.md file in the same repo as this file describes in detail how the data is to be downloaded, extracted and analysed using the accompanying "run_Analysis.R" script.
The script converts the input data set to the tidy data set described below.
 
See the README.md file also for more detail on the data processing done to create the tidy data set.
 
##Description of the Variables 
The tidy data set contains 4 variables (The first 3 describe the Subject and Activity pair and a Feature variable name). The last variable is the value of the mean of all estimates of that feature for the specific subject-activity pair in the original (input) daatabase. 

- There are 14220 rows of the above mentioned 4 variables in the resulting tidy data set (14220, 4)
- The first few rows of the data set is the following:
```R
  Subject Activity           Feature mean(Value)
1       1   LAYING tBodyAcc-mean()-X  0.22159824
2       1   LAYING tBodyAcc-mean()-Y -0.04051395
3       1   LAYING tBodyAcc-mean()-Z -0.11320355
4       1   LAYING  tBodyAcc-std()-X -0.92805647
5       1   LAYING  tBodyAcc-std()-Y -0.83682741
6       1   LAYING  tBodyAcc-std()-Z -0.82606140
```
 
## Variables Present in the Dataset
 
Num | Name | Description
--- | ------------------------------------------------ | --------------------------------------------------
1 | Subject | The id of the subject who performed the activity for each window sample.
.|.| This is an integer value from 1 to 30 (there were 30 subjects participating in the study)
2 | Activity | Activity performed by the subject at the moment the signal was captured.  
.|.| This is a factor variable with the following 6 levels:
.|.| WALKING
.|.| WALKING_UPSTAIRS
.|.| WALKING_DOWNSTAIRS
.|.| SITTING
.|.| STANDING
.|.| LAYING
||
3 | Feature | The name of the time or frequency variable for whom the mean or std deviation was calculated in the original data set.  This  is a factor variable consisting of 79 levels (all features from the orgininal feature vector relating to the mean or standard deviation estimates).  The following 79 levels are used:
.| tBodyAcc-mean()-X | (Time domain Signal). Body acceleration signal, derivated by applying an additional low pass butterworth filter with a corner frequency of 30Hz to the tAcc value. Mean estimated from the signals on the 'X' axis.
.| tBodyAcc-mean()-X |
.| tBodyAcc-mean()-Y |
.| tBodyAcc-mean()-Z |
.| tBodyAcc-std()-X |
.| tBodyAcc-std()-Y |
.| tBodyAcc-std()-Z |               
.| tGravityAcc-mean()-X |
.| tGravityAcc-mean()-Y |
.| tGravityAcc-mean()-Z |
.| tGravityAcc-std()-X |
.| tGravityAcc-std()-Y |
.| tGravityAcc-std()-Z |
.| tBodyAccJerk-mean()-X |
.| tBodyAccJerk-mean()-Y |          
.| tBodyAccJerk-mean()-Z |
.| tBodyAccJerk-std()-X |
.| tBodyAccJerk-std()-Y |
.| tBodyAccJerk-std()-Z |
.| tBodyGyro-mean()-X |
.| tBodyGyro-mean()-Y |
.| tBodyGyro-mean()-Z |
.| tBodyGyro-std()-X |
.| tBodyGyro-std()-Y |
.| tBodyGyro-std()-Z |
.| tBodyGyroJerk-mean()-X |
.| tBodyGyroJerk-mean()-Y |
.| tBodyGyroJerk-mean()-Z |
.| tBodyGyroJerk-std()-X |
.| tBodyGyroJerk-std()-Y |
.| tBodyGyroJerk-std()-Z |
.| tBodyAccMag-mean() |
.| tBodyAccMag-std() |
.| tGravityAccMag-mean() |
.| tGravityAccMag-std() |
.| tBodyAccJerkMag-mean() |
.| tBodyAccJerkMag-std() |          
.| tBodyGyroMag-mean() |
.| tBodyGyroMag-std() |
.| tBodyGyroJerkMag-mean() |
.| tBodyGyroJerkMag-std() |
.| fBodyAcc-mean()-X |
.| fBodyAcc-mean()-Y |
.| fBodyAcc-mean()-Z |
.| fBodyAcc-std()-X |
.| fBodyAcc-std()-Y |
.| fBodyAcc-std()-Z |
.| fBodyAcc-meanFreq()-X |
.| fBodyAcc-meanFreq()-Y |
.| fBodyAcc-meanFreq()-Z |
.| fBodyAccJerk-mean()-X |
.| fBodyAccJerk-mean()-Y |
.| fBodyAccJerk-mean()-Z |
.| fBodyAccJerk-std()-X |
.| fBodyAccJerk-std()-Y |
.| fBodyAccJerk-std()-Z |
.| fBodyAccJerk-meanFreq()-X |
.| fBodyAccJerk-meanFreq()-Y |
.| fBodyAccJerk-meanFreq()-Z |
.| fBodyGyro-mean()-X |
.| fBodyGyro-mean()-Y |
.| fBodyGyro-mean()-Z |
.| fBodyGyro-std()-X |
.| fBodyGyro-std()-Y |
.| fBodyGyro-std()-Z |
.| fBodyGyro-meanFreq()-X |
.| fBodyGyro-meanFreq()-Y |
.| fBodyGyro-meanFreq()-Z |
.| fBodyAccMag-mean() |
.| fBodyAccMag-std() |
.| fBodyAccMag-meanFreq()         
.| fBodyBodyAccJerkMag-mean() |
.| fBodyBodyAccJerkMag-std() |
.| fBodyBodyAccJerkMag-meanFreq() |
.| fBodyBodyGyroMag-mean() |
.| fBodyBodyGyroMag-std() |
.| fBodyBodyGyroMag-meanFreq() |
.| fBodyBodyGyroJerkMag-mean() 
.| fBodyBodyGyroJerkMag-std() |
.| fBodyBodyGyroJerkMag-meanFreq() |
4 | mean(Value) | The calculated mean of the feature variable named in "Feature" across all observations in the original data set for the row's Subject-Activity pair.  The original vector contained normalised values between -1.0 and 1.0, hence the resulting mean of a set of such estimated values is also a real value in the same range.


##Sources
1. UCI Machine Learning Repository "Human Activity Recognition Using Smartphones Data Set" at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. Wickham, Hadley "Tidy Data" at http://vita.had.co.nz/papers/tidy-data.pdf 

 
