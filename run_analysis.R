## Use libraries
library(dplyr)
library(plyr)

## set working directory
setwd("UCI HAR Dataset")

## Obtain and select features
feature_names <- read.table("features.txt", sep = "", header = F, na.strings ="", stringsAsFactors= F)
feature_names <- select(feature_names, V2)
selected_features <- feature_names[grepl("mean|std", feature_names$V2, ignore.case = TRUE),]

## Obtain Activity Labels
activity_labels <- read.table("activity_labels.txt", sep = "", header = F, na.strings ="", stringsAsFactors= F)

## Obtain Test Data
test_X_test_data <- read.table("test/X_test.txt", sep = "", header = F, na.strings ="", stringsAsFactors= F)
names(test_X_test_data) <- as.character(feature_names$V2)

## Obtain Test Subject IDs
test_subject_data <- read.table("test/subject_test.txt", sep = "", header = F, na.strings ="", stringsAsFactors= F)

## Obtain Test activity IDs, create an order column not to lose sequence when arranging
test_Y_test_data <- read.table("test/Y_test.txt", sep = "", header = F, na.strings ="", stringsAsFactors= F)
test_Y_test_data <- cbind(test_Y_test_data, seq_len(nrow(test_Y_test_data)))
test_Y_test_data <- rename(test_Y_test_data, replace = c("seq_len(nrow(test_Y_test_data))"= "order"))
test_Y_test_data <- arrange(join(activity_labels,test_Y_test_data),order)
test_Y_test_data <- select(test_Y_test_data,V2)

## Merge all Test Data
test_data <- cbind(test_subject_data, test_Y_test_data, test_X_test_data)

## Obtain Train Data
train_X_train_data <- read.table("train/X_train.txt", sep = "", header = F, na.strings ="", stringsAsFactors= F)
names(train_X_train_data) <- as.character(feature_names$V2)

## Obtain Train Subject IDs
train_subject_data <- read.table("train/subject_train.txt", sep = "", header = F, na.strings ="", stringsAsFactors= F)

## Obtain Train activity IDs, create an order column not to lose sequence when arranging
train_Y_train_data <- read.table("train/Y_train.txt", sep = "", header = F, na.strings ="", stringsAsFactors= F)
train_Y_train_data <- cbind(train_Y_train_data, seq_len(nrow(train_Y_train_data)))
train_Y_train_data <- rename(train_Y_train_data, replace = c("seq_len(nrow(train_Y_train_data))"= "order"))
train_Y_train_data <- arrange(join(activity_labels,train_Y_train_data),order)
train_Y_train_data <- select(train_Y_train_data,V2)

## Merge all Train Data
train_data <- cbind(train_subject_data, train_Y_train_data, train_X_train_data)

## Merge Train and Test
all_data <- rbind(test_data, train_data)
all_data <- rename(all_data, replace = c("V1"= "subjectID"))
all_data <- rename(all_data, replace = c("V2"= "activity"))

## Create tidy data from selected features and extract mean from data
tidy_data <- all_data[,c("subjectID", "activity", selected_features)]
tidy_data_final <- transform(tidy_data, subjectID=factor(subjectID), activity=factor(activity))
tidy_data_final <- aggregate(. ~ subjectID + activity, FUN = mean, data=tidy_data_final)

## Write final data to file
write.table(tidy_data_final, "final_data.txt", row.names = FALSE)
