## Download the data into the current R working directory file structure
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile="./FUCI.zip",mode="wb")
unzip("./FUCI.zip",exdir=".")
dir.create("./UCI HAR Dataset/all")
## Create a combined file of all the observations by appending the files
file.copy("./UCI HAR Dataset/train/subject_train.txt","./UCI HAR Dataset/all/subject_all.txt",overwrite=TRUE)
file.copy("./UCI HAR Dataset/train/X_train.txt","./UCI HAR Dataset/all/X_all.txt",overwrite=TRUE)
file.copy("./UCI HAR Dataset/train/y_train.txt","./UCI HAR Dataset/all/y_all.txt",overwrite=TRUE)
file.append("./UCI HAR Dataset/all/subject_all.txt","./UCI HAR Dataset/test/subject_test.txt")
file.append("./UCI HAR Dataset/all/X_all.txt","./UCI HAR Dataset/test/X_test.txt")
file.append("./UCI HAR Dataset/all/y_all.txt","./UCI HAR Dataset/test/y_test.txt")
## Select the features that are of interest using a regular expression to find the mean() and std()
features<-read.table("./UCI HAR Dataset/features.txt",row.names=1)
i<-regexec("mean\\(\\)|std\\(\\)",as.character(features[,1]))
y<-i>0
CClasses<-rep("numeric",length(i))
for (n in seq_along(y)) {if(!y[n]) CClasses[n]<-"NULL"}
features$use<-y
featuresUsed<-features[which(features$use),1]
## Fix up the feature names so that they don't have any dashes or parentheses
featuresUsed<-sub("-mean\\(\\)-","Mean",featuresUsed)
featuresUsed<-sub("-std\\(\\)-","Std",featuresUsed)
featuresUsed<-sub("-mean\\(\\)","Mean",featuresUsed)
featuresUsed<-sub("-std\\(\\)","Std",featuresUsed)
## Read the datafile using the selected features in the colClasses list
meansAndStds<-read.table("./UCI HAR Dataset/all/X_all.txt",colClasses=CClasses)
colnames(meansAndStds)<-featuresUsed
subject<-read.table("./UCI HAR Dataset/all/subject_all.txt")
activity<-read.table("./UCI HAR Dataset/all/y_all.txt",colClasses=c("factor"))
activity_label<-read.table("./UCI HAR Dataset/activity_labels.txt",row.names=1)
## Add the subect and activity columns
meansAndStds$subject<-subject$V1
meansAndStds$activity<-activity$V1
levels(meansAndStds$activity)<-as.character(activity_label$V2)
## Write out the data file
write.table(meansAndStds,"./MeanStdDataset.txt",row.names=FALSE)
##Create the summary file of the means of each variable within an activity for a given subject
subjectArr<-subject$V1
activityArr<-activity$V1
levels(activity$V1)<-as.character(activity_label$V2)
factors<-list(s=subjectArr,a=activityArr)
for (j in seq_along(featuresUsed)) {
      tm <- tapply(meansAndStds[,j],factors,mean)
      if (j == 1 ) { tmFinal <- tm } else { tmFinal <- cbind(tmFinal,tm) }
}
colNames<-vector()
for (j in seq_along(featuresUsed)) {
for (i in seq_along(activity_label$V2)) {
 if (i == 1&j==1) { colNames <- c(paste((c(as.character(activity_label$V2[i]),featuresUsed[j])),sep=".",collapse="."))
 } else {
   colNames<-append(colNames,c(paste((c(as.character(activity_label$V2[i]),featuresUsed[j])),collapse=".")))
 }
}
}
colnames(tmFinal)<-colNames
write.table(tmFinal,"./MeanStdSummary.txt")