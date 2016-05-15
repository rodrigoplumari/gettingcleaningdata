# Getting and Cleaning Data Project

### How the script works
Download the project from https://github.com/rodrigoplumari/gettingcleaningdata and set the folder where you extracted it as the working directory, before running, the script will set everything else.

Be sure to download the txt files as well from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and place the unzipped folder in the same directory as the R file.

This will be set as wd when the script runs, so make sure your extracted folder has this name:
```{r}
setwd("UCI HAR Dataset")
```

Open the script, select all lines and click run, a file called final_data.txt will be generated in the UCI HAR Dataset directory.

### CodeBook

To create the tidy data I used the txt files provided by the instructor in the link contained in this project description. The variables below are used in my script to generate the final tidy data file as requested.

* feature_names - The feature names, all of them
* selected_features - Only features that have mean or standard deviation values
* activity_labels - Values of the activities executed with the Samsung Phone
* test_X_test_data - Test Data
* test_subject_data - Subject IDS from test
* test_Y_test_data - Activities executed in test
* test_data - all merged data from test
* train_X_train_data - Train data
* train_subject_data - Subject IDS from train
* train_Y_train_data - Activities executed in train
* train_data - all merged data from train
* all_data - all merged data from test and train
* tidy_data - tidy data but with mean calculation still pending
* tidy_data_final - Final dataset containing subject ID, Activities in a more friendly classification and the fields with the mean for standard deviations and means for selected activities

The final tidy data file contains the following variables:
[1] "subjectID"                            "activity"                            
 [3] "tBodyAcc.mean...X"                    "tBodyAcc.mean...Y"                   
 [5] "tBodyAcc.mean...Z"                    "tBodyAcc.std...X"                    
 [7] "tBodyAcc.std...Y"                     "tBodyAcc.std...Z"                    
 [9] "tGravityAcc.mean...X"                 "tGravityAcc.mean...Y"                
[11] "tGravityAcc.mean...Z"                 "tGravityAcc.std...X"                 
[13] "tGravityAcc.std...Y"                  "tGravityAcc.std...Z"                 
[15] "tBodyAccJerk.mean...X"                "tBodyAccJerk.mean...Y"               
[17] "tBodyAccJerk.mean...Z"                "tBodyAccJerk.std...X"                
[19] "tBodyAccJerk.std...Y"                 "tBodyAccJerk.std...Z"                
[21] "tBodyGyro.mean...X"                   "tBodyGyro.mean...Y"                  
[23] "tBodyGyro.mean...Z"                   "tBodyGyro.std...X"                   
[25] "tBodyGyro.std...Y"                    "tBodyGyro.std...Z"                   
[27] "tBodyGyroJerk.mean...X"               "tBodyGyroJerk.mean...Y"              
[29] "tBodyGyroJerk.mean...Z"               "tBodyGyroJerk.std...X"               
[31] "tBodyGyroJerk.std...Y"                "tBodyGyroJerk.std...Z"               
[33] "tBodyAccMag.mean.."                   "tBodyAccMag.std.."                   
[35] "tGravityAccMag.mean.."                "tGravityAccMag.std.."                
[37] "tBodyAccJerkMag.mean.."               "tBodyAccJerkMag.std.."               
[39] "tBodyGyroMag.mean.."                  "tBodyGyroMag.std.."                  
[41] "tBodyGyroJerkMag.mean.."              "tBodyGyroJerkMag.std.."              
[43] "fBodyAcc.mean...X"                    "fBodyAcc.mean...Y"                   
[45] "fBodyAcc.mean...Z"                    "fBodyAcc.std...X"                    
[47] "fBodyAcc.std...Y"                     "fBodyAcc.std...Z"                    
[49] "fBodyAcc.meanFreq...X"                "fBodyAcc.meanFreq...Y"               
[51] "fBodyAcc.meanFreq...Z"                "fBodyAccJerk.mean...X"               
[53] "fBodyAccJerk.mean...Y"                "fBodyAccJerk.mean...Z"               
[55] "fBodyAccJerk.std...X"                 "fBodyAccJerk.std...Y"                
[57] "fBodyAccJerk.std...Z"                 "fBodyAccJerk.meanFreq...X"           
[59] "fBodyAccJerk.meanFreq...Y"            "fBodyAccJerk.meanFreq...Z"           
[61] "fBodyGyro.mean...X"                   "fBodyGyro.mean...Y"                  
[63] "fBodyGyro.mean...Z"                   "fBodyGyro.std...X"                   
[65] "fBodyGyro.std...Y"                    "fBodyGyro.std...Z"                   
[67] "fBodyGyro.meanFreq...X"               "fBodyGyro.meanFreq...Y"              
[69] "fBodyGyro.meanFreq...Z"               "fBodyAccMag.mean.."                  
[71] "fBodyAccMag.std.."                    "fBodyAccMag.meanFreq.."              
[73] "fBodyBodyAccJerkMag.mean.."           "fBodyBodyAccJerkMag.std.."           
[75] "fBodyBodyAccJerkMag.meanFreq.."       "fBodyBodyGyroMag.mean.."             
[77] "fBodyBodyGyroMag.std.."               "fBodyBodyGyroMag.meanFreq.."         
[79] "fBodyBodyGyroJerkMag.mean.."          "fBodyBodyGyroJerkMag.std.."          
[81] "fBodyBodyGyroJerkMag.meanFreq.."      "angle.tBodyAccMean.gravity."         
[83] "angle.tBodyAccJerkMean..gravityMean." "angle.tBodyGyroMean.gravityMean."    
[85] "angle.tBodyGyroJerkMean.gravityMean." "angle.X.gravityMean."                
[87] "angle.Y.gravityMean."                 "angle.Z.gravityMean."   