#Load libraries
library(plyr)
library(dplyr)

#Create objects from individual tables components assuming the assignment 
#files were all placed in the working directory
train1 <- read.table("./train/X_train.txt")
train2 <- read.table("./train/y_train.txt", col.names = "activity_label")
train3 <- read.table("./train/subject_train.txt", col.names = "subject")
test1 <- read.table("./test/X_test.txt")
test2 <- read.table("./test/y_test.txt", col.names = "activity_label")
test3 <- read.table("./test/subject_test.txt", col.names = "subject")

#Column bind training and test sets, then row bind the two sets together
#With the above, this fulfils number 1 in the project
fullSet <- rbind(cbind(train3,train2,train1), cbind(test3,test2,test1))

#Select only the appropriate columns--those that have either a mean or a standard deviation in the name
#I included all variables that had anything to do with a mean or standard deviation, given 
#the limited direction and limited knowledge of this data set. This fulfils number 2 of the project
narrowSet <- select(fullSet,subject:V6,V41:V46,V81:V86,V121:V126,
V161:V166,V201:V202,V214:V215,V227:V228,V240:V241,V253:V254,V266:V271,
V294:V296,V345:V350,V373:V375,V424:V429,V452:V454,V503:V504,V513,V516:V517,
V529:V530,V539,V542:V543,V552,V556:V561)

#Replace activity label with a more descriptive value. This fulfils number 3 of the project
narrowSet$activity_label <- replace(narrowSet$activity_label, narrowSet$activity_label == 1, "WALKING")
narrowSet$activity_label <- replace(narrowSet$activity_label, narrowSet$activity_label == 2, "WALKING_UPSTAIRS")
narrowSet$activity_label <- replace(narrowSet$activity_label, narrowSet$activity_label == 3, "WALKING_DOWNSTAIRS")
narrowSet$activity_label <- replace(narrowSet$activity_label, narrowSet$activity_label == 4, "SITTING")
narrowSet$activity_label <- replace(narrowSet$activity_label, narrowSet$activity_label == 5, "STANDING")
narrowSet$activity_label <- replace(narrowSet$activity_label, narrowSet$activity_label == 6, "LAYING")

#Replace variable label with more descriptive variable names, which came from the features.txt file
#The make.names function is used to ensure the names fit R's req's. This fulfils number 4 of the project.
varNames <- read.table("features.txt")
names(narrowSet)[3:86] <- make.names(varNames[c(1:6,41:46,81:86,121:126,161:166,201:202,
214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,
503:504,513,516:517,529:530,539,542:543,552,556:561),2])

#Create a independent tidy data set with the average of each variable for each activity/subject combination.
#The code below does this by creating a wide tidy set where each column is the mean value of a variable at
#each subject/activity grouping. This fulfils number 5 of the project.
meanTidySet <- narrowSet %>% group_by(subject, activity_label) %>% summarise_each(funs(mean))
meanTidySet <- data.frame(meanTidySet)




