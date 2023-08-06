# Importing file

filename <- "Fina_Project_Week4.zip"

# Checking if file already exists.

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Reading test and training. Additionally assigning variables to all data set
library(dplyr)

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Step 1: Merging Data----

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, x)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement----

tidy_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

# Step 3: Uses descriptive activity names to name the activities in the data set----

tidy_data$code <- activities[tidy_data$code, 2]

# Step 4: Appropriately labes the data set with descriptive variables names

names(tidy_data)[2] = "activity"
names(tidy_data)<-gsub("Acc", "accelerometer", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "gyroscope", names(tidy_data))
names(tidy_data)<-gsub("BodyBody", "body", names(tidy_data))
names(tidy_data)<-gsub("Mag", "magnitude", names(tidy_data))
names(tidy_data)<-gsub("^t", "time", names(tidy_data))
names(tidy_data)<-gsub("^f", "frequency", names(tidy_data))
names(tidy_data)<-gsub("tBody", "timebody", names(tidy_data))
names(tidy_data)<-gsub("-mean()", "mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-std()", "std", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-freq()", "frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("angle", "angle", names(tidy_data))
names(tidy_data)<-gsub("gravity", "gravity", names(tidy_data))

# Step 5: Create a nw tidy data with the average of each variable fo each activity and subject

final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

write.table(final_data, "final_data.txt", row.name=FALSE)

str(final_data)

final_data
