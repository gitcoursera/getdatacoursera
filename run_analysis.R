# Read test set
fileTest <- readLines("test//X_test.txt")
length(fileTest) # [1] 2947
testSetTable <- read.table(textConnection(fileTest)) # testSetTable
dim(testSetTable)   # [1] 2947  561

# Getting all features names and renaming the columns
features <- readLines("features.txt")

for(i in 1:length(names(testSetTable))) {
  names(testSetTable)[i] <- features[i]
}

fileTestLabels <- readLines("test//y_test.txt")
testLabelTable <- read.table(textConnection(fileTestLabels))
nrow(testLabelTable)   # [1] 2947
names(testLabelTable) <- "Activity"

fileSubj <- readLines("test//subject_test.txt")
testSubjTable <- read.table(textConnection(fileSubj))
names(testSubjTable) <- "Subject"

testTable <- cbind(testSetTable, testLabelTable, testSubjTable)

# Make sure two new columns were added
tail(testTable[560:563])
# ------------------
# Read training set
fileTrain <- readLines("train//X_train.txt")
length(fileTrain) # [1] 7352
trainSetTable <- read.table(textConnection(fileTrain)) # testSetTable
dim(trainSetTable)   # [1] 7352  561

# Renaming columns
for(i in 1:length(names(trainSetTable))) {
  names(trainSetTable)[i] <- features[i]
}

fileTrainLabels <- readLines("train//y_train.txt")
trainLabelTable <- read.table(textConnection(fileTrainLabels))
nrow(trainLabelTable) 
names(trainLabelTable) <- "Activity"

fileSubj <- readLines("train//subject_train.txt")
trainSubjTable <- read.table(textConnection(fileSubj))
names(trainSubjTable) <- "Subject"

trainTable <- cbind(trainSetTable, trainLabelTable, trainSubjTable)

# Make sure two new columns were added
tail(trainTable[560:563])
