#Merge the training and test data into one datset
x <- rbind(x_train, x_test)
y <- rbind (y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, x, y)

#Extract mean and standard deviations 
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

#Name activities
TidyData$code <- activities[TidyData$code, 2]

#Label Variables
names(TidyData) [2] = "activity"
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))

#Create New Dataset
FinalData <- TidyData %>% 
  group_by(subject, activity) %>%
  summarize_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.names = FALSE)