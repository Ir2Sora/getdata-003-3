run_analysis <- function(){
    activities <- read.table(file="activity_labels.txt", col.names = c("id", "name"))
    features <- read.table(file="features.txt", col.names = c("id", "name"))
    x_train <- read.table(file="train/X_train.txt")
    x_test <- read.table(file="test/x_test.txt")
    x <- rbind(x_train, x_test)
    names(x) <- paste("average_", features$name, sep = "")
    x <- x[,grepl("mean[(][)]", features$name) | grepl("std[(][)]", features$name)]
    
    subject_train <- read.table(file = "train/subject_train.txt", col.names = "subject_num")
    subject_test <- read.table(file = "test/subject_test.txt", col.names = "subject_num")
    subject <- rbind(subject_train, subject_test)
    data <- cbind(subject, x)
    
    y_train <- read.table(file="train/y_train.txt", col.names = "activity")
    y_test <- read.table(file="test/y_test.txt", col.names = "activity")
    y <- rbind(y_train, y_test)
    data <- cbind(y, data)
    
    tidyData <- aggregate(x = data, by = list(data$activity, data$subject), FUN = "mean")
    tidyData$Group.1 <- NULL
    tidyData$Group.2 <- NULL
    tidyData$activity <- factor(x = tidyData$activity, labels = activities$name)
    
    write.table(tidyData, file = "tidyData.txt", row.names = F)
}