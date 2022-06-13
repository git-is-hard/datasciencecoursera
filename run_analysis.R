library(dplyr)

filename <- "getdata_projectfiles_UCI HAR Dataset.zip"
                         
# Checking if archieve already exists.
if (!file.exists(filename)){
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, filename, method="curl")
                          }  
                          
# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
                          }
                          
#read activity record
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
                          
#read features record which contained col.names
features <- read.table("UCI HAR Dataset/features.txt")
                          
#extract the wanted col.names
wanted_col = grep("[Ss]td|[Mm]ean", features[, 2])
                          
#read the train record
x_train <- read.table("UCI HAR Dataset/train/x_train.txt")[wanted_col]
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
s_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

#rename the col.names of x_train
names(x_train) <- features[wanted_col, 2]
                          
#read the test record
x_test <- read.table("UCI HAR Dataset/test/x_test.txt")[wanted_col]
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")                          
s_test <- read.table("UCI HAR Dataset/test/subject_test.txt")  
                          
#rename the col.names of x_test
names(x_test) <- features[wanted_col, 2]
                          
#merge the data
train <- cbind(s_train, y_train, x_train)
test <- cbind(s_test, y_test, x_test)
df <- rbind(test, train)
                          
#replace the code to the activity
df$code <- activities[df$code, 2]
                          
#group by subject and activity
df <- df %>% group_by(V1, code)
                          
#summarise all by mean
final_df <- df %>% summarise_all(funs(mean))
                          
#extract the tidy data to file
write.table(final_df, "final_df.txt", row.name=FALSE)

                          