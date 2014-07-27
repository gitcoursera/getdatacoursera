# Read test set
fileTest <- readLines("test//X_test.txt")
length(fileTest) # [1] 2947
testSetTable <- read.table(textConnection(fileTest)) # testSetTable
dim(testSetTable)   # [1] 2947  561

fileTestLabels <- readLines("test//y_test.txt")
testLabelTable <- read.table(textConnection(fileTestLabels))
nrow(testLabelTable)   # [1] 2947

fileSubj <- readLines("test//subject_test.txt")
testSubjTable <- read.table(textConnection(fileSubj))

testTable <- cbind(testSetTable, testLabelTable, testSubjTable)
# Rename the 2 new columns for clarity
names(testTable)[562] <- "Activity"
names(testTable)[563] <- "Subject"
# Make sure two new columns were added
tail(testTable[560:563])
# ------------------
# Read training set
fileTrain <- readLines("train//X_train.txt")
length(fileTrain) # [1] 2947
trainSetTable <- read.table(textConnection(fileTrain)) # testSetTable
dim(trainSetTable)   # [1] 2947  561

fileTrainLabels <- readLines("train//y_train.txt")
trainLabelTable <- read.table(textConnection(fileTrainLabels))
nrow(trainLabelTable)   # [1] 2947

fileSubj <- readLines("train//subject_train.txt")
trainSubjTable <- read.table(textConnection(fileSubj))

trainTable <- cbind(trainSetTable, trainLabelTable, trainSubjTable)
names(trainTable)[562] <- "Activity"
names(trainTable)[563] <- "Subject"
# Make sure two new columns were added
tail(trainTable[560:563])
