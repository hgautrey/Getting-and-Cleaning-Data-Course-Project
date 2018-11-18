if (!file.exists("data")) {
  dir.create("data")
  }
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "~/data/phone.zip")
dateDownloaded <- date()
unzipData <- unzip("~/data/phone.zip")
features <- read.table("~/data/phone/UCI HAR Dataset/features.txt")
X_test <- read.table("~/data/phone/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("~/data/phone/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("~/data/phone/UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("~/data/phone/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("~/data/phone/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("~/data/phone/UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("~/data/phone/UCI HAR Dataset/activity_labels.txt")
variables <- features$V2
colnames(X_test) <- variables
colnames(X_train) <- variables
test_df <- cbind(subject_test, y_test, X_test)
train_df <- cbind(subject_train, y_train, X_train)
combined_df <- rbind(train_df, test_df)
combined_df <- combined_df[, grepl("mean|std|V1", colnames(combined_df))]
combined_df <- merge(activity_labels, combined_df, by.x = c("V1"), by.y = c("V1.1"), all = TRUE)
library(dplyr)
combined_df <- select(combined_df, -V1)
combined_df <- rename(combined_df, Subject = V1.y, Activity = V2)
library(reshape2)
melt_df <- melt(combined_df, id.vars = c("Activity", "Subject"))
new_df <- dcast(melt_df, Activity + Subject ~ variable, mean)

