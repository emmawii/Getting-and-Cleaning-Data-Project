#Merge the training and test data
testData<-read.table("test/X_test.txt")
trainData<-read.table("train/X_train.txt")
Xdata<-rbind(testData,trainData)
#Remove redundant variables
rm(testData)
rm(trainData)
#Combine subjects
testSubjects<-read.table("test/subject_test.txt")
trainSubjects<-read.table("train/subject_train.txt")
Sub<-rbind(testSubjects,trainSubjects)
names(Sub)<-"subjects"
#Remove redundant variables
rm(testSubjects)
rm(trainSubjects)
#Combine data labels
testLabels<-read.table("test/y_test.txt")
trainLabels<-read.table("train/y_train.txt")
Ydata<-rbind(testLabels,trainLabels)
#Remove redundant variables
rm(testLabels)
rm(trainLabels)
#Read in feature list to be used as column names
featureList<-read.table("features.txt",stringsAsFactors = FALSE)
features<-featureList$V2
#Keeping only std and mean columns
ColumnsToKeep<-grepl("(std|mean[^F])",features,perl = TRUE)
Xdata<-Xdata[,ColumnsToKeep]
names(Xdata)<-features[ColumnsToKeep]
names(Xdata)<-gsub("\\(|\\)","",names(Xdata))
names(Xdata)<-tolower(names(Xdata))
#Reading the activities label
ActLab<-read.table("activity_labels.txt")
#Make the activities labels human readable
ActLab[,2]<-gsub("_","",ActLab[,2])
#Substitute number in Ydata with labels
Ydata[,1]<-ActLab[Ydata[,1],2]
names(Ydata)<-tolower(names(Ydata))
names(Ydata)<-"activities"
#combine subject, activities, and Xdata into new dataframe
finalData<-cbind(Sub,Ydata,Xdata)
write.table(finalData,file="finalData.txt")
#Use data.table functions to group finalData by each subject and activity combinations and get the mean for everyother variable
finalData2<-data.table(finalData)
finalData2<-finalData2[,lapply(.SD,mean),by=list(subjects,activities)]
finalData2<-as.data.frame(finalData2)
write.table(finalData2,file="finalData2.txt")











