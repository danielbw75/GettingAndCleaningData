#Getting-and-Cleaning-data Course Project

#open the Features and activity_labels data

features<-read.table("Courseproject/features.txt", col.names=c("vector", "formula"))
actlabels<-read.table("Courseproject/activity_labels.txt", row.names=c("1","2","3","4","5","6"), col.names=c("label", "activity"))
activities<-matrix(actlabels[,"activity"])
#select the Formulas used in Features and the Activity used in activity_labels
#to name the test/train columns and better see the data instead of numbers


formula<-features[,"formula"]

#open test files
Xtest<-read.table("Courseproject/test/X_test.txt", col.names=formula)
Ytest<-read.table("Courseproject/test/Y_test.txt")
Subtest<-read.table("Courseproject/test/subject_test.txt")
#open train files
Xtrain<-read.table("Courseproject/train/X_train.txt", col.names=formula)
Ytrain<-read.table("Courseproject/train/Y_train.txt")
Subtrain<-read.table("Courseproject/train/subject_train.txt")

#join tables
Xtotal<-rbind(Xtest, Xtrain)
Ytotal<-rbind(Ytest, Ytrain)
Subtotal<-rbind(Subtest, Subtrain)

if(Ytest[i,1])