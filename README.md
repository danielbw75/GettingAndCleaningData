# GettingAndCleaningData
## Instructions
##
##PLEASE MAKE SURE YOU DID NOT RENAME THE SAMSUNG DATA FOLDER ("UCI HAR Dataset")
##PLEASE MAKE SURE THE SAMSUNG DATA FOLDER IS IN YOUR WORKING DIRECTORY
##
##
##
#####Run line by line, in the end you will get the tidy_data, with a index by activity and separated by blocks of subjects
##Example:
##
#####                          tBodyAcc-mean()-X     
##### SUBJECT                   1         ..
##### WALKING                   0.2773308 ..
##### WALKING_UPSTAIRS          0.2554617 ..
##### WALKING_DOWNSTAIRS        0.2891883 ..
#####.
#####.
#####.
##### SUBJECT                   2 ..
#####.
#####.
#####.

####CODEBOOK
######features> is the features.txt file
######activitylabels> is the activity_label.txt file
######formula> selects only the names of the variables of features
######Xtest> is the X_test.txt file
######Ytest> is the Y_test.txt file
######Subtest> is teh subject_test.txt file
######Xtrain> is the X_train.txt file
######Ytrain> is the Y_train.txt file
######Subtrain> is the subject_train.txt file
######Xtotal>is the Xtrain and Xtest joined
######Ytotal>is the Ytrain and Ytest joined
######Subtotal>is the Subtest and the Subtrain joined
######activities> is the Ytotal files, but with the activity label parsed with its name
######goodvars>gets the number of the column of the measured variables wich have the text "mean()" or "std()" in it
######extractedX> is the Xtotal subset of columns that match the columns of goodvars, that is, the measures of Means and Standard deviation
######extractedRaw> is the ExtractedX with the activity labels and names and the subjects
######media> gets the mean of every variable for one activity and one subject
######media2> stores the mean of all activities for one subject
######media3 stores the mean of all activities of all subjects
######namesrow> is the repetition of "subject" and the activities names to create a index column in the tidy_data
######tidy_data> is the tidy_data of the means of every measure variable of standard deviation or mean, by activity and subject

