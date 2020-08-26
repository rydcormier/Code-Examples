# run_analysis.R
#
# Author:  Ryan Cormier <rydcormier@gmail.com>
# Date:    April 18, 2018
#
# Using the 'Human Activity Recognition Using Smartphones Data Set' from
# the UCI Machine Learning Repository, this script will download the data,
# merge the training and test sets, extract measurements on the mean and
# standard deviation, descriptively name the activities and variable names,
# and then create a second tidy data set with the average of each variable by
# activity and subject.
#
# The dataset will be stored in an object called `dataset`, and the averaged
# data will be in an object called `dataset.averaged`. The averaged dataset
# is then written into the working directory as 'tidy_data.txt'.
#
# Note: Requires the `dplyr` and `readr` packages

library("dplyr")
library("readr")

# Downlad the data to a temporary file
temp <- tempfile(fileext = ".zip")
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file.url, destfile = temp, method = "curl")

# read and load data
activities <- read_table2(unz(temp, file.path("UCI HAR Dataset", "activity_labels.txt")),
                              col_names = c("activity"),
                              col_types = cols("_", "c"))
activities <- activities %>% mutate(activity = tolower(activity))

features <- read_table2(unz(temp, file.path("UCI HAR Dataset", "features.txt")),
                       col_names = c("feature"),
                       col_types = cols("_", "c"))

test.data <- read_table2(unz(temp, file.path("UCI HAR Dataset", "test",
                                             "X_test.txt")),
                         col_names = pull(features, feature))
test.subjects <- read_table2(unz(temp, file.path("UCI HAR Dataset", "test",
                                                 "subject_test.txt")),
                             col_names = c("subject"))
test.activities <- read_table2(unz(temp, file.path("UCI HAR Dataset", "test",
                                                   "y_test.txt")),
                               col_names = c("activity"))

train.data <- read_table2(unz(temp, file.path("UCI HAR Dataset", "train",
                                              "X_train.txt")),
                          col_names = pull(features, feature))
train.subjects <- read_table2(unz(temp, file.path("UCI HAR Dataset",
                                        "train", "subject_train.txt")),
                              col_names = c("subject"))
train.activities <- read_table2(unz(temp, file.path("UCI HAR Dataset", "train",
                                                    "y_train.txt")),
                                col_names = c("activity"))

# remove temporary file
unlink(temp)
rm(temp)

# Merge training and test data sets
train.data <- bind_cols(train.subjects, train.activities, train.data)
test.data <- bind_cols(test.subjects, test.activities, test.data)
dataset <- bind_rows(test.data, train.data)

rm(file.url, test.activities, test.subjects, train.activities,
   test.data, train.data, train.subjects)

# extract only values on the mean and standard deviation of each measurement
dataset <- dataset %>%
  select(subject, activity, contains("mean()"), contains("std()"))

# Name the activities descriptively and convert to factors
dataset <- dataset %>%
  mutate(activity = factor(pull(dataset, activity),
                           labels = pull(activities, activity)))

rm(activities, features)

# label the variables descriptively
names(dataset) <- sub("^t", "time", names(dataset))
names(dataset) <- sub("^f", "frequency", names(dataset))
names(dataset) <- sub("Acc", "Accelerometer", names(dataset))
names(dataset) <- sub("Gyro", "Gyroscope", names(dataset))
names(dataset) <- sub("Mag", "Magnitude", names(dataset))
names(dataset) <- sub("BodyBody", "Body", names(dataset))
names(dataset) <- sub("mean\\(\\)", "mean", names(dataset))
names(dataset) <- sub("std\\(\\)", "standardDeviation", names(dataset))

# create new data set with avarages for each variable by activity and subject
dataset.averaged <- dataset %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean)) %>%
  ungroup()

# write the data as a txt file
write.table(dataset.averaged, "tidy_data.txt", row.names = FALSE)
