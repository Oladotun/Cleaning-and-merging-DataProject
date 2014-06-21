
# Extract file to table format
setwd("~/SCHOOL/Coursera/CleaningAndMergingData/ClassProject/UCI HAR Dataset")
train_subject <- read.table("./train/subject_train.txt",sep="") ## Subject for train
train_set <- read.table("./train/X_train.txt",sep="") ## X_Train
train_labels <- read.table("./train/y_train.txt",sep="") ## Y_Train
test_subject <- read.table("./test/subject_test.txt",sep="")
test_set <- read.table("./test/X_test.txt",sep="") ## X_Test
test_labels <- read.table("./test/y_test.txt",sep="") ## Y_test
features<-read.table("./features.txt",sep=" ")

## Step 1 Combine train and test data and also combine the subject to the activities label data
trainData <- as.data.frame(train_set)
testData <- as.data.frame(test_set)
completeData <- rbind(trainData,testData)
subjectLabelData <- as.data.frame(rbind(cbind(train_subject,train_labels),cbind(test_subject,test_labels)))
## Step 2 and 4 Extract mean and data & name each column

colsNeeded <- grep(".*mean\\(\\).*|.*std\\(\\).*",features$V2)
features <- features[colsNeeded,]

## Substitute the name for each column
features$V2<- gsub("-mean","mean",features$V2)
features$V2 <- gsub("-std","std",features$V2)
features$V2 <- gsub("[-()]","",features$V2)
stepTwoData <- subset(completeData,,colsNeeded)

## Name columns by features
colnames(stepTwoData) <- c(as.vector(features$V2))
colnames(stepTwoData)<- tolower(colnames(stepTwoData))
## Label the subject and activity fields
colnames(subjectLabelData)<-c("subject","activity")
completedData <- cbind(subjectLabelData,stepTwoData)

## Step 3  Use descriptive names to name the activities in the data set
activity_labels <- read.table('./activity_labels.txt')
completedData$activity = factor(completedData$activity, levels=c(1,2,3,4,5,6), 
                                       labels=activity_labels$V2)


## Step 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject
completedData$activity<-as.factor(completedData$activity)
completedData$subject<-as.factor(completedData$subject)
tidy<-aggregate(completedData,by=list(subject=completedData$subject,activity=completedData$activity),mean)

## remove unwated columns
 tidy[,3] <- NULL
tidy[,3] <- NULL

write.table(tidy, "tidy.txt", sep="\t")
