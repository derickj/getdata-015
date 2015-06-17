readfname<-function(directory,fname) {
    inpfile<-file.path(directory,fname)
    if(!file.exists(inpfile)) {
        msg<-paste(inpfile, "does not exist", sep=" ")
        stop(msg)
    }
    print (inpfile)
    data<-read.table(inpfile)
}

library(Hmisc)
library(plyr)
library(dplyr)

## Read the data files
testX<-readfname("test","X_test.txt")
print(dim(testX))
testY<-readfname("test","y_test.txt")
print(dim(testY))
testSubject<-readfname("test","subject_test.txt")
print(dim(testSubject))
trainX<-readfname("train","X_train.txt")
print(dim(trainX))
trainY<-readfname("train","y_train.txt")
print(dim(trainY))
trainSubject<-readfname("train","subject_train.txt")
print (dim(trainSubject))
features<-readfname(".","features.txt")
print (dim(features))
activityLabels<-readfname(".","activity_labels.txt")
print (dim(activityLabels))

## Create a data frame with the subject and activity labels 
## on the left for each of test and train
## and then merge the data sets by appending the data frames "below"
## each other
dataset<-rbind(cbind(testSubject,testY,testX),cbind(trainSubject,trainY,trainX))

## Replace Activity IDs with the corresponding labels
dataset[,2]<-activityLabels[dataset[,2], 2]
## Convert to data table to use the dplyr package for selection of columns
datatab<-tbl_df(dataset)
## varnames<-gsub("[,()-]","_",features$V2)
## varnames<-gsub(",","_",varnames)
varnames<-gsub(",","_",features$V2)
varnames<-c("Subject","Activity",varnames)
dups<-duplicated(varnames)
for (i in 1:length(varnames)) {
    if(dups[i]) {
        varnames[i]<-paste(varnames[i],i,sep="_")
    }
}
colnames(datatab)<-varnames
## Select the identifying columns, as well as all features relating to the mean 
## or std dev of a measurement
meanAndStdTab<-select(datatab,Subject,Activity,matches("*mean*|*std*",ignore.case=FALSE))
## melt the data set to a narrow one
narrow<-melt(meanAndStdTab,1:2,variable.name="Feature",value.name="Value")
grouped<-group_by(narrow,Subject,Activity,Feature)
## Calculate the mean of each feature by Subject and Activity
final<-summarize(grouped,mean(Value))
## Generate the output
write.table(final,"final.txt",row.name=FALSE)



