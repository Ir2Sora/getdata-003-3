Getting and Cleaning Data. Course Project.
=============

The script **run_analysis.R** makes tidy data from bunch of files from **Human Activity Recognition Using Smartphones Dataset** and saves it into **tidyData.txt**.

For successful transformation **run_analysis.R** and raw data must be placed in your working directory.

###### Algorithm
1. Combine **x_train** and **x_test** into single dataset **x**
2. Filter **x** dataset **x_train** for getting only *mean* and *std* variables
3. Combine **subject_train** and **subject_test** into single dataset **subject**
4. Attach **subject** to **x** for getting **data** dataset
5. Combine **y_train** and **y_test** into single dataset **y** and attach it to **data**
6. Create **tidyData** set with the average of each variable for each activity and each subject
7. Remove redundant columns from **tidyData**
8. Rename column *activity* for using real activity names.
