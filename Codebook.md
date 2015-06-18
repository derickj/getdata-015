Num | Name | Description
--- | ------------------------------------------- | ----------------------------------------------------
1 | Subject | The subject who performed the activity for each window sample
2 | Activity | WALKING
||  WALKING_UPSTAIRS
||  WALKING_DOWNSTAIRS
||  SITTING
||  STANDING
||  LAYING
||Activity performed by the subject at the moment the signal was captured
3 | Feature | 
|| tBodyAcc-mean()-X | (Time domain Signal). Body acceleration signal, derivated by applying an additional low pass butterworth filter with a corner frequency of 30Hz to the tAcc value. Mean estimated from the signals on the 'X' axis.
4 | mean(Value) | The calculated mean of the feature variable named in "Feature" across all observations in the original data set for the row's Subject-Activity pair

---
title: "Codebook for Getting and Cleaning Data Course Project Final Data Set"
author: "derickj"
date: "18 June 2015"
output:
  html_document:
    keep_md: yes
---
 
## Project Description
The purpose of this project is to demonstrate the student's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
##Study design and data processing
 
###Collection of the raw data
Description of how the data was collected.
 
###Notes on the original (raw) data 
Some additional notes (if avaialble, otherwise you can leave this section out).
 
##Creating the tidy datafile
 
###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/
 
###Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()
 
##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.
 
Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.
 
##Sources
Sources you used if any, otherise leave out.
 
##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
