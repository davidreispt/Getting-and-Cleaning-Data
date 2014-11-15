######################################################################################
## This script cleans and agregates data from the following dataset
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## 
## It will return two dataset and write a file on the working directory
##    1 - tabAllData dataset
##    2 - resultDF tidy dataset 
##    3 - file with the tidy dataset written to cleaning_result.txt
##
######################################################################################

library(data.table)

#Reads All features and prepares selected columns
columnNamesTbl=read.table("features.txt", header = FALSE)
columnNames=columnNamesTbl[[2]]
columnSelected=columnNamesTbl[which(regexpr("-(mean|std)\\(\\)",columnNamesTbl[,2])>0),]

#Reads Activity Labels
activityLabelsTbl=read.table("activity_labels.txt", header = FALSE,col.names=c("Label","Activity"))

#Read sample to define classes to read
sampleClasses <- read.table("train/X_train.txt", header = FALSE, nrows = 5)
classes <- sapply(sampleClasses, class)

#Read all train data set and aux tables 
tabTrainSet <- read.table("train/X_train.txt", header = FALSE, colClasses = classes,col.names=columnNames)
tabTrainLabel <- read.table("train/y_train.txt", header = FALSE, col.names=c("Label"))
tabTrainSubject <- read.table("train/subject_train.txt", header = FALSE, col.names=c("Subject"))

#Read all test data set and aux tables 
tabTestSet <- read.table("test/X_test.txt", header = FALSE, colClasses = classes,col.names=columnNames)
tabTestLabel <- read.table("test/y_test.txt", header = FALSE, col.names=c("Label"))
tabTestSubject <- read.table("test/subject_test.txt", header = FALSE, col.names=c("Subject"))

#works on TrainSet
tabTrainSet=tabTrainSet[,columnSelected[[1]]]
tabTestSet=tabTestSet[,columnSelected[[1]]]

tabTrainLabels=merge(tabTrainLabel, activityLabelsTbl, by="Label")
tabTestLabels=merge(tabTestLabel, activityLabelsTbl, by="Label")

tabTrainSet<-cbind(tabTrainLabels[2],tabTrainSet)
tabTestSet<-cbind(tabTestLabels[2],tabTestSet)

#all table data
tabAllData<-rbind(tabTrainSet,tabTestSet)

#removes all temp objects
rm(columnNamesTbl,sampleClasses,classes,columnNames,activityLabelsTbl)
rm(tabTestLabel,tabTrainLabel,columnSelected,tabTestSet,tabTrainSet)
rm(tabTrainLabels,tabTestLabels)

#all data with subject data
tabAllSubjectData<-rbind(tabTrainSubject,tabTestSubject)
tabAllDataWSubject<-cbind(tabAllSubjectData,tabAllData)

# create a new data set with all metrics mean by subject and activity
groupBy=unique(tabAllDataWSubject[,c(1,2)])
resultDF= data.frame()

for (i in c(1:nrow(groupBy))) {

  auxDF= data.frame(groupBy[i,c(1,2)])
  
  aux_tab=tabAllDataWSubject[tabAllDataWSubject$Subject==groupBy[i,1],]
  aux_tab=aux_tab[aux_tab$Activity==groupBy[i,2],c(3:68)]
  
  for (x in c(1:length(aux_tab))){
    auxDF=cbind(auxDF,mean(aux_tab[,x]))
  } 
  
  if (nrow(resultDF)==0)
    resultDF=auxDF
  else 
    resultDF=rbind(resultDF,auxDF)
}

#set columnnames
colnames(resultDF)=colnames(tabAllDataWSubject)

#removes all temp objects
rm(tabTestSubject,tabTrainSubject,tabAllSubjectData)
rm(aux_tab,auxDF,i,x,tabAllDataWSubject,groupBy)

#write output table
write.table(resultDF,"cleaning_result.txt",row.name=FALSE)


