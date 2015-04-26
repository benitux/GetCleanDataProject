#You should create one R script called run_analysis.R that does the following. 

library(dplyr)

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 

base_path <- "./UCI HAR Dataset"

activities <- read.table(file.path(base_path, "activity_labels.txt"), col.names=c("ActId", "Activity"))
features <- read.table(file.path(base_path, "features.txt"))

features_columns <- gsub("_$", "", gsub("_+", "_", chartr("-,()", "____", features[,2])))

want_feature_columns <- features_columns[grep("mean\\(\\)|std\\(\\)", features[,2])]

# Assume features are sorted

test_x <- read.table(file.path(base_path, "test", "X_test.txt"), col.names = features_columns)
test_y <- read.table(file.path(base_path, "test", "y_test.txt"))
test_s <- read.table(file.path(base_path, "test", "subject_test.txt"), col.names=c("SubjectID"))
test_y <- merge(test_y, activities, by.x="V1", by.y="ActId")
test_xx <- test_x[,want_feature_columns]
test <- cbind(test_s, Activity= test_y$Activity, test_xx)



train_x <- read.table(file.path(base_path, "train", "X_train.txt"), col.names = features_columns)
train_y <- read.table(file.path(base_path, "train", "y_train.txt"))
train_s <- read.table(file.path(base_path, "train", "subject_train.txt"), col.names=c("SubjectID"))
train_y <- merge(train_y, activities, by.x="V1", by.y="ActId")
train_xx <- train_x[,want_feature_columns] #select(train_x, contains("mean"), contains("std"))
train <- cbind(train_s, Activity= train_y$Activity, train_xx)


## This is the tidy data
samsung <- rbind(test, train)

# Clean up temp veriables
rm(base_path, activities, features, features_columns, want_feature_columns)
rm(test, test_x, test_y, test_s, test_xx)
rm(train, train_x, train_y, train_s, train_xx)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
samsung_means <- samsung %>% group_by(SubjectID, Activity) %>% summarise_each(funs(mean))

# Output file for submission
write.table(samsung_means, "./submission.txt", row.name=FALSE)



