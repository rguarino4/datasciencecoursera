run_analysis <- function() {
   
   # Download File
   #message("Downloding file...")
   #url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
   #if (!file.exists("./data1")) {
   #   dir.create("./data1")
   #}
   #download.file(url, destfile="./data1/UCI_HAR_Dataset.zip", method = "curl")
   #file.copy("./data/getdata-projectfiles-UCI HAR Dataset.zip","./data1/UCI_HAR_Dataset.zip")
   #downloadDate <- date()
   #downloadDate
   #unzip(zipfile="./data1/UCI_HAR_Dataset.zip", exdir="./data1")
   
   # Merges Train and Test datasets to create one dataset.
   message("Merging Train and Test datasets: X, y and subject...")
   X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
   y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
   subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
   X_test  <- read.table("UCI HAR Dataset/test/X_test.txt")
   y_test  <- read.table("UCI HAR Dataset/test/y_test.txt")
   subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
   
   X <- rbind(X_train, X_test)
   y <- rbind(y_train, y_test)
   subject <- rbind(subject_train, subject_test)
   
   # Take only mean and std measurements
   message("Creating X_new with only mean and std measurements...")
   X_new <- cbind(X[1:6],X[41:46],X[81:86],X[121:126],X[161:166],X[201:202],X[214:215],X[227:228],
                       X[240:241],X[253:254],X[266:271],X[294:296],X[345:350],X[373:375],X[424:429],
                       X[452:454],X[503:504],X[513],X[516:517],X[526],X[529:530],X[539],X[542:543],
                       X[552])
   
   
   message("     X_new created with ", ncol(X_new), " cols and ", nrow(X_new), " rows.")
   # Use descriptive labels for each activity
   message("Creating y_new with descriptive activities names...")
   y_new <- vector()
   for (i in 1:nrow(y)) {
      
      if (y[i,1]==1) y_new[i] <- "WALKING"
      if (y[i,1]==2) y_new[i] <- "WALKING_UPSTAIRS"
      if (y[i,1]==3) y_new[i] <- "WALKING_DOWNSTAIRS"
      if (y[i,1]==4) y_new[i] <- "SITTING"
      if (y[i,1]==5) y_new[i] <- "STANDING"
      if (y[i,1]==6) y_new[i] <- "LAYING"
      
   }
   message("     y_new created with 1 col and ", length(y_new), " rows.")
   
   message("Creating subject_new as merge between train and test subject's datasets...")
   subject_new <- vector()
   for (i in 1:nrow(subject)) {
      subject_new[i] <- subject[i,1]
   }
   message("     subject_new created with 1 col and ", length(subject_new), " rows.")
   
   # Appropriately labels the data set with descriptive variable names
   features <- read.table("UCI HAR Dataset/features.txt")
   descriptiveVarsNames <- vector()
   descriptiveVarsNames <- c(gsub("\\(\\)","",gsub("-","",as.character(features[1:6,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[41:46,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[81:86,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[121:126,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[161:166,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[201:202,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[214:215,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[227:228,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[240:241,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[253:254,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[266:271,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[294:296,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[345:350,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[373:375,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[424:429,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[452:454,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[503:504,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[513,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[516:517,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[526,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[529:530,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[539,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[542:543,2]))),
                             gsub("\\(\\)","",gsub("-","",as.character(features[552,2]))),
                             "subject","y")
   
   tidyDataSet <- cbind(X_new, subject_new, y_new)
   
   colnames(tidyDataSet) <- descriptiveVarsNames
   
   tidyAggregateDataSet <- aggregate(tidyDataSet,by = list(tidyDataSet$y,tidyDataSet$subject), FUN=mean,na.rm = TRUE)
   
   write.table(tidyAggregateDataSet,file="tidyAggregateDataSet.txt",row.name=FALSE)
   
   message("File tidyAggregateDataSet.txt was generated with SUCCESS !")
   
   #return (tidyAggregateDataSet)
   
}