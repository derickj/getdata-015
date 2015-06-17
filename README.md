# getdata-015
The Course Project repo for Getting and Cleaning Data course.
## Overview
The repo contains:
1. This "README.md" file providing a description of the usage and operation of the script
2. An R script "run_Analysis.R" which reads the Samsung data and converts it to 
a tidy data set as requested in the assignment.
3. A file "Codebook.md" whcih describes the tidy data set produced by the script
## Using the script
1. Upload the source data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. All files contained in the zip file should be extracted to the working directory
where you intend to run the script, i.e., the folder "UCI HAR Dataset" containing the "test"
and "train" sub folders should be located in your working directory.
3. Place the script "run_Analysis.R" also in the working directory.
4. To execute the script run it in R by executing 
```R
source("run_Analysis.R")
```

## Errors
If either of the required input files is not found, the script will print an error message and exit

## Output
The tidy data set is written into the working directory with the name "final.txt"

## Reading the data
The data set that was created can be read in R by the "read.table" command (use header=TRUE), e.g.
```R
tidydata<-read.table("final.txt",header=TRUE)
```

## run_Analysis.R Script's Operation
The following activities are performed by the script:
### Reading the source data
1. Read all measurement data into separate data frames
For test and train data respectively, the feature data (measurements) are read from the "X_" file, followed by the activity ids for these measurements from the "y_" file and lastly the ids of the subject for each measurement from the "subject_" file.
2. Read the names of the features (measurements) from the "features.txt" file.
3. Read the activity labels from the "activity_labels.txt" file.
4.  If either of these files does not exist in the expected location, an error message is printed and the script will exit.
### Creating a data table containing all the data to manipulate
1. For each of the test and train datasets the subject ids and the activity ids (y values) are added as column 1 and 2 of the data frame.
2. The two data frames are then combined by adding all the rows of the train data frame to the test dataframe into a single new data frame (named "dataset")
3. Convert the frame to a table for easier manipulation
### Use more descriptive labels for activities and variable (column) names for the feature data
1. The activity ids are then replaced by the more descriptive activity labels which were read from the activity_labels.txt file
2. Use the 561 feature names as the variable names for the variable values contained from column 3 to the end of the data frame.
3. It was found some feature names were duplicated, so these names are made unique by simply appending the index of the column in which it originally appeared in the X file to the name.
### Select the relavant variable data
1. Select all variable columns relating to either the mean or the standard deviation of a time or frequency variable by selecting those columns containing either the string "mean" or "std" (The assumption is that a naming convention was adhered to)
2. Make a narrow data set from the resulting data by adding a column for the "Feature" and its corresponding "Value" (the melt command was used for this)
3. Calculate the mean for each Variable for each Subject and Activity combination in order to create the final "tidy" data set.
4. Write the data table into the working directory using the "write.table" command.
