# getdata-015
The Course Project repo for Getting and Cleaning Data course.
## Overview
The repo contains:

1. This "README.md" file providing a description of the usage and operation of the script.
2. An R script "run_Analysis.R" which reads the Samsung data and converts it to 
a tidy data set as requested in the assignment.
3. A file "Codebook.md" which describes the tidy data set produced by the script.

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

## Output
If either of the required input files is not found, the script will print an error message and exit

The tidy data set is written into the working directory with the name "final.txt"

The data set that was created can be read in R by the "read.table" command (use header=TRUE), e.g.
```R
tidydata<-read.table("final.txt",header=TRUE)
```

## run_Analysis.R Script's Operation
The following activities are performed by the script:

### Read the source data

1. Read all measurement data into separate data frames
For test and train data respectively, the feature data (measurements) are read from the "X_" file, followed by the activity ids for these measurements from the "y_" file and lastly the ids of the subject for each measurement from the "subject_" file.
2. Read the names of the features (measurements) from the "features.txt" file.
3. Read the activity labels from the "activity_labels.txt" file.
4.  If either of these files does not exist in the expected location, an error message is printed and the script will exit.

### Create a single data table containing all the test and train data

1. For each of the test and train datasets the subject ids and the activity ids (y values) are added as column 1 and 2 of the data frame.
2. The two data frames are then combined by adding all the rows of the train data frame to the test dataframe into a single new data frame (named "dataset")
3. Convert the frame to a table for easier manipulation

### Assign descriptive activity labels and variable (column) names

1. The activity ids are replaced by the more descriptive activity labels which were read from the activity_labels.txt file
2. Use the 561 time and frequency variable names from the "features.txt" file as the variable names for the columns of the feature vector (from column 3 to the end of the data frame).
3. It was found some feature names were duplicated, so these names are made unique by simply appending the index of the column in which it originally appeared in the feature vector to the name.

### Select the relevant variable data relating to means or standard deviation

1. Select all variable columns relating to either the mean or the standard deviation of a time or frequency variable by selecting those columns containing either the string "mean" or "std" (The assumption is that a naming convention was adhered to) (79 such column names exist)
2. Make a narrow data set from the resulting data by adding a column for the "Feature" and its corresponding "Value" (the melt command was used for this)

### Calculate the means and write the output text file

3. Calculate the mean for each Variable for each Subject and Activity combination in order to create the final "tidy" data set.  (For each of the 30 subjects, for each of 6 activities, the means of the 79 variables selected above are calculated, resulting in a final data set of 14220 values, one for each combination of subject, activity and "feature" variable (30x6x79))
4. Write the data table into the working directory using the "write.table" command.
