# getdata-015
The Course Project repo for Getting and Cleaning Data course.
## Overview
The repo contains an R script "run_Analysis.R" which reads the Samsumng data and converts it to 
a tidy data set as requested in the assignment.
## Using the script
1. The source data can be uploaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. All files contained in the zip file should be extracted to the working directory
where you intend to run the script, i.e. the directory "UCI HAR Dataset" containing the "test"
and "train" sub folders should be located in your wokring directory.
3. Place the script "run_Analysis.R" also in the working directory.
4. To execute the script run it in R by executing "source("run_Analysis.R")" 

## Errors
If either of the required input files are not found, the script will print an error message and exit

## Output
The tidy data set is written into the working directory with the name "final.txt"

## Reading the data
The data could be read by the "read.table" command (use header=TRUE), e.g.
 tidydata<-read.table("final.txt",header=TRUE)