library(dplyr)
## Reading in data
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("index", "feature"))

activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("index","activity"))

test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$feature)

test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")

test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$feature)

train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")

train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Merging and binding data
data <- rbind(test, train)

# Get only the columns with mean and std measurements
mean_and_std_col <- names(data)[grep("mean\\.|std", names(data))] 
data <- select(data, mean_and_std_col)

# Binding data with activity and subject
data_activity <- rbind(test_activity, train_activity)
data_subject <- rbind(test_subject, train_subject)
data <- cbind(data_subject, data_activity, data)

# Replacing activity with descriptive names
match_activity_label <- function(x){
  activities$activity[[grep(x, activities$index)]]
} # A function to replace a number by the activity to which the numeber corresponds

data$activity <- lapply(data$activity, FUN = match_activity_label)
data$activity <- as.character(data$activity)

# creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
names(data)
avg_data <- data %>% group_by(activity, subject) %>% summarize_all(mean)

avg_data
View(avg_data)
