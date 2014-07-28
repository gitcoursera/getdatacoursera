activityDesc <- function(table) {
  for (i in 1:length(table$Activity)) { 
    if (table$Activity[i] == 1) table$Activity[i] = "WALKING"
    if (table$Activity[i] == 2) table$Activity[i] = "WALKING_UPSTAIRS"
    if (table$Activity[i] == 3) table$Activity[i] = "WALKING_DOWNSTAIRS"
    if (table$Activity[i] == 4) table$Activity[i] = "SITTING"
    if (table$Activity[i] == 5) table$Activity[i] = "STANDING"
    if (table$Activity[i] == 6) table$Activity[i] = "LAYING"
  }
  table
}

renameColNames <- function(table) {
  for(i in 1:length(names(table))) {
    names(table)[i] <- features[i]
  }
  table
}

# Read test set
fileTest <- readLines("test//X_test.txt")
length(fileTest) # [1] 2947
testSetTable <- read.table(textConnection(fileTest)) # testSetTable
dim(testSetTable)   # [1] 2947  561

# Getting all features names and renaming the columns
features <- readLines("features.txt")
testSetTable <- renameColNames(testSetTable)

# Reading labels
fileTestLabels <- readLines("test//y_test.txt")
testLabelTable <- read.table(textConnection(fileTestLabels))
nrow(testLabelTable)   # [1] 2947
names(testLabelTable) <- "Activity"
# Descriptive activity names
testLabelTable <- activityDesc(testLabelTable)

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
trainSetTable <- renameColNames(trainSetTable)

fileTrainLabels <- readLines("train//y_train.txt")
trainLabelTable <- read.table(textConnection(fileTrainLabels))
nrow(trainLabelTable) 
names(trainLabelTable) <- "Activity"
# Descriptive activity names
trainLabelTable <- activityDesc(trainLabelTable)

fileSubj <- readLines("train//subject_train.txt")
trainSubjTable <- read.table(textConnection(fileSubj))
names(trainSubjTable) <- "Subject"

trainTable <- cbind(trainSetTable, trainLabelTable, trainSubjTable)

# Make sure two new columns were added
tail(trainTable[560:563])
