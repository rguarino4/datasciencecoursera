### Author
Rodrigo Guarino, rguarino4@yahoo.com.br

### Introduction
This files contains the overview of Course Project from Getting and Cleanning Data 16th edition. The Course Project is composed by the files:

* README.md = > This file. 
* CODEBOOK.md = > Gives a brief description of variables present in tidy data set produced by run_analysis.R script
* run_analysis.R = > R script that getting and cleanning data of https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

### Script run_analysis.R
This is the script that produces a tidy data from raw data getdata-projectfiles-UCI HAR Dataset.zip, downloaded from url https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. It follows the algorithm:

* Considering getdata-projectfiles-UCI HAR Dataset.zip downloded and unzip in the same directory as the script, reads X_{train, test}, y_{train, test}, subject_{train,test} to produce a merged dataset with train and test. Final merge is X, y and subject new variables. 
* Take only variables(columns) that according with features file represents mean and standard deviation(std) of the measurements. The new variable is called X_new
* Creates y_new with description of the activities not its numbers.
* Creates a vector,descriptiveVarsNames, with the names of columns(variables) of X_new
* Creates the new dataset tidyDataSet as a cbind(X_new, subject_new, y_new)
* Names the columns of tidyDataSet with descriptiveVarsNames names vector.
* Finally, performs an aggregation of the data, calculating the mean of each numeric column of tidyDataSet grouping by y, subject.
* The final result, is saved as tidyAggregateDataSet.txt file in the same directory as the script run_analysis.R.

 

