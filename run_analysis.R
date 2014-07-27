# Read test set
fileTest <- readLines("test//X_test.txt")
length(fileTest) # [1] 2947
testSetTable <- read.table(textConnection(fileTest)) # testSetTable
dim(testTable)   # [1] 2947  561

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
