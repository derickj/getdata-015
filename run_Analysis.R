##
## readfname is a function which constructs a path name from the two input parameters (a directory and file 
## name.  It then tests if the file exists - if not, an error message is displayed and the script is terminated
## If the file exists, the data is read using the read.table command and a data frame containing the data
## is returned
##
readfname<-function(directory,fname) {
    inpfile<-file.path(directory,fname)
    if(!file.exists(inpfile)) {
        msg<-paste(inpfile, "does not exist", sep=" ")
        stop(msg)
    }
    print (inpfile)
    data<-read.table(inpfile)
}

## Load the libraries used in the script
library(Hmisc)
library(plyr)
library(dplyr)

## Read the data files
testX<-readfname("UCI HAR Dataset/test","X_test.txt")
testY<-readfname("UCI HAR Dataset/test","y_test.txt")
testSubject<-readfname("UCI HAR Dataset/test","subject_test.txt")
trainX<-readfname("UCI HAR Dataset/train","X_train.txt")
trainY<-readfname("UCI HAR Dataset/train","y_train.txt")
trainSubject<-readfname("UCI HAR Dataset/train","subject_train.txt")
features<-readfname("UCI HAR Dataset","features.txt")
activityLabels<-readfname("UCI HAR Dataset","activity_labels.txt")

## During exploratory analysis, the dimensions were reported to investigate the data, no longer used
## print(dim(testX))
## print(dim(testY))
## print(dim(testSubject))
## print(dim(trainX))
## print(dim(trainY))
## print (dim(trainSubject))
## print (dim(activityLabels))

## Create a data frame with the subject and activity ids 
## the two leftmost columns for each of test and train data sets
## and then merge the data sets by appending the rows of the train data frame "below"
## the test data frame
dataset<-rbind(cbind(testSubject,testY,testX),cbind(trainSubject,trainY,trainX))

## Replace Activity IDs with the corresponding labels
dataset[,2]<-activityLabels[dataset[,2], 2]

## Convert to data table to use the dplyr package for easier manipulation
datatab<-tbl_df(dataset)

## Replace ',' in feature variable names with '_' to avoid syntax problems when used as column names
## and ensure each name is unique
varnames<-gsub(",","_",features$V2)
varnames<-c("Subject","Activity",varnames)
dups<-duplicated(varnames)
for (i in 1:length(varnames)) {
    if(dups[i]) {
        varnames[i]<-paste(varnames[i],i,sep="_")
    }
}
## Assign column names
colnames(datatab)<-varnames

## Select the identifying columns, as well as all features relating to the mean 
## or std dev of a time or frequency variable
meanAndStdTab<-select(datatab,Subject,Activity,matches("*mean*|*std*",ignore.case=FALSE))

## melt the data set to a narrow one
narrow<-melt(meanAndStdTab,1:2,variable.name="Feature",value.name="Value")

## Calculate the mean of each feature by Subject and Activity
grouped<-group_by(narrow,Subject,Activity,Feature)
inal<-summarize(grouped,mean(Value))

## Generate the output file
write.table(final,"final.txt",row.name=FALSE)
print("Output file final.txt created")


