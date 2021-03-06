Codebook
The run_analysis.R script performs the data preparation.
1.	Download the dataset: Dataset is downloaded and extracted under the folder called “UCI HAR Dataset”.
2.	Assign each datapoint to variables: 
a.	features <- features.txt is 561 rows by 2 columns. Features selected from this data come from the accelerator and gyroscope data
b.	activities <- activity_labels.txt is 6 rows by 2 columns. Lists activities performed when corresponding measure was taken along with its label
c.	subject_test <- test/subject_test.txt is 2947 rows by 1 column. Contains the data of 9/30 volunteers 
d.	x_test <- test/x_test.txt is 2947 rows and 561 columns. Contains recorded features of test results
e.	y_test <- test/y_test.txt is 2947 rows by 1 column. Contains the test data of activities label
f.	subject_train <- test/subject_train.txt is 7352 rows by 1 column. Contains the training data of 21/30 volunteers
g.	x_train <- test/x_train.txt is 7352 rows by 561 columns. Contains the recorded features of the training data
h.	y_train <- test/y_train.txt is 7352 rows and 1 column. Contains the data for activities labels
3.	Merge the training dataset and the test dataset to become one dataset
a.	x is 10299 rows and 561 columns. Created by merging the x_train and the x_test variables using rbind() command
b.	y is 10299 rows and 1 column. Created by merging the y_train and the y_test variables using the rbind() command
c.	Subject is 10299 rows and 1 column. Created by merging subject_train and subject_test using the rbind() command
d.	Merged_Data is 10299 rows and 563 columns. Created by merging Subject, y, and x using the cbind() command
4.	Extracting the means and standard deviations 
a.	TidyData is 10299 rows and 88 columns. Created by subsetting Merged_Data, selecting columns subject, code, mean, and std
5.	Descriptive names for the activites
a.	code column in TidyData replaced with the corresponding activity variable
6.	Label the dataset with descriptive names in TidayData
a.	code remaned to activities
b.	Acc renamed to Accelerometer
c.	Gyro renamed to Gyroscope
d.	BodyBody renamed to Body
e.	Mag renamed to Magnitude
f.	If characters started with f in any column renamed to Frequency
g.	If characters started with t in any column renamed to Time
7.	Create a final dataset
a.	FinalData is 180 rows by 88 columns. Created by summarizing TidyData by taking the means of each activity and each subject and grouping them by subject and activity
b.	Exported FinalData as FinalData.txt
