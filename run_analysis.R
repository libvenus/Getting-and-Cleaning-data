#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#initialization
actLabelsF   <- "./getdata/UCI HAR Dataset/activity_labels.txt"
fileUrl      <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
featuresF    <- "./getdata/UCI HAR Dataset/features.txt"
testDataF    <- "./getdata/UCI HAR Dataset/test/X_test.txt"
testLabelsF  <- "./getdata/UCI HAR Dataset/test/y_test.txt"
subTestF     <- "./getdata/UCI HAR Dataset/test/subject_test.txt"
trainDataF   <- "./getdata/UCI HAR Dataset/train/X_train.txt"
trainLabelsF <- "./getdata/UCI HAR Dataset/train/y_train.txt"
subTrainF    <- "./getdata/UCI HAR Dataset/train/subject_train.txt"

#Download and unzip in "getdata" directory
if(!file.exists("getdata")) dir.create("getdata") 
download.file(fileUrl, destfile = "getdata/dataset.zip")
unzip("getdata/dataset.zip", exdir="getdata")

#Read Common files
actLabels       <- read.table(actLabelsF)[,2]
features        <- read.table(featuresF)[,2]
extractFeatures <- grep("mean|std", features)

#Prepare the test Data set - 
#read, extra relevant fields, and apply meaningfull names
subTest           <- read.table(subTestF)
testLabels        <- read.table(testLabelsF)
testData          <- read.table(testDataF)
names(testData)   <- features
testData          <- testData[, extractFeatures]
testLabels[,2]    <- actLabels[testLabels[,1]]
names(testLabels) <- c("Activity_ID", "Activity")
names(subTest)    <- "Subject"
testData          <- cbind(subTest, testLabels, testData)

#Prepare the train Data set - 
#read, extra relevant fields, and apply meaningfull names
subTrain           <- read.table(subTrainF)
trainLabels        <- read.table(trainLabelsF)
trainData          <- read.table(trainDataF)
names(trainData)   <- features
trainData          <- trainData[, extractFeatures]
trainLabels[,2]    <- actLabels[trainLabels[,1]]
names(trainLabels) <- c("Activity_ID", "Activity")
names(subTrain)    <- "Subject"
trainData          <- cbind(subTrain, trainLabels, trainData)

#Merge test and train data
allData <- rbind(testData, trainData)
if(!require("data.table")) install.packages("data.table")
setDT(allData)

#Mean subset of allData(4 to 79 colnums) and group by "Subject, Activity_ID"
tidyData <- allData[, lapply(.SD, mean), by="Subject,Activity", .SDcols=4:79]
print(tidyData)

