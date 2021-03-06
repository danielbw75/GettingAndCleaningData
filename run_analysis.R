#Getting-and-Cleaning-data Course Project
library(stringr)
#open the Features and activity_labels data

#PLEASE MAKE SURE YOU DID NOT RENAME THE SAMSUNG DATA FOLDER AND IT IS IN
#YOUR WORKIND DIRECTORY
features<-read.table(paste(getwd(),"/UCI HAR Dataset/features.txt",sep=""), col.names=c("vector", "formula"))
activitylabels<-read.table(paste(getwd(),"/UCI HAR Dataset/activity_labels.txt",sep=""), row.names=c("1","2","3","4","5","6"), col.names=c("label", "activity"))
#select the Formulas used in Features to name the test/train columns
# and better see the data instead of numbers


formula<-features[,"formula"]

#PLEASE MAKE SURE YOU DID NOT RENAME THE SAMSUNG DATA FOLDER AND IT IS IN
#YOUR WORKIND DIRECTORY
Xtest<-read.table(paste(getwd(),"/UCI HAR Dataset/test/X_test.txt",sep=""), col.names=formula)
Ytest<-read.table(paste(getwd(),"/UCI HAR Dataset/test/Y_test.txt",sep=""))
Subtest<-read.table(paste(getwd(),"/UCI HAR Dataset/test/subject_test.txt",sep=""), col.names="subject")

#PLEASE MAKE SURE YOU DID NOT RENAME THE SAMSUNG DATA FOLDER AND IT IS IN
#YOUR WORKIND DIRECTORY
Xtrain<-read.table(paste(getwd(),"/UCI HAR Dataset/train/X_train.txt",sep=""), col.names=formula)
Ytrain<-read.table(paste(getwd(),"/UCI HAR Dataset/train/Y_train.txt",sep=""))
Subtrain<-read.table(paste(getwd(),"/UCI HAR Dataset/train/subject_train.txt",sep=""), col.names="subject")

#join tables
Xtotal<-rbind(Xtest, Xtrain)
Ytotal<-rbind(Ytest, Ytrain)
Subtotal<-rbind(Subtest, Subtrain)

#parse the activity label with its code
activities<-data.frame()
for(i in 1:nrow(Ytotal)){
        lista<-activitylabels[activitylabels$label==Ytotal[i,],]
        activities<-rbind(activities,lista)
        
}

#find variables with mean ()
#IMPORTANT: library(stringr)

vartext<-paste(formula)
split<-strsplit(vartext,"-")#separate words of variable names

#gets the numbers of the variables with the word "mean()" or "std()"
goodvars<-data.frame()
m<-"mean()"
s<-"std()"
for (i in 1:length(split)){ 
        if(any(split[[i]]==m)){
                good<-data.frame(i)
                goodvars<-rbind(goodvars,good)
        
        }
        else if(any(split[[i]]==s)){
                        good<-data.frame(i)
                        goodvars<-rbind(goodvars,good)
         
        }        
        
}

#extract only the variables with mean() and std()
extractedX<-Xtotal[,c(goodvars$i)]
extractedraw<-cbind(activities,extractedX,Subtotal)

#extract the mean of variables for each activity and person
media3<-data.frame(matrix(NA, ncol = 66, nrow = 1))
#had to create a "false" data frame with the right amount of columns
#since I was getting a error saying the columns didn't match
for (a in 1:max(Subtotal)){
        media2<-data.frame(matrix(NA, ncol = 66, nrow = 1))
        titles<-data.frame(matrix(a, ncol=66, nrow =1 ))
                for (b in 1:nrow(activitylabels)){
                        temp<-subset(extractedraw, extractedraw$label==b&extractedraw$subject==a)
                        temp2<-c()
                        media<-data.frame(matrix(NA, ncol = 66, nrow = 1))
                        for(c in 3:(ncol(temp)-1)){
                                temp2<-c(temp[,c])
                                media<-cbind(media[complete.cases(media)],mean(temp2))
                                #media gets the mean of every variable for one activity and one subject
                                
                        }
                        media2<-rbind(media2[complete.cases(media2)],media)
                        #media2 stores the mean of all activities for one subject
                }
        colnames(titles)<-colnames(media2)
        media3<-rbind(media3[complete.cases(media3),],titles, media2)
        
        #media3 stores the mean of all activities of all subjects
        }
colnames(media3)<-colnames(extractedX)
#sets the columns names by variables
namesrow<-data.frame(rep(c("SUBJECT", paste(activitylabels$activity)),30))
colnames(namesrow)<-"index"
#sets the index
tidy_data<-cbind(namesrow,media3)
#final tidy data
##The step 4 for labeled dataset is the object named extractedraw
##The step 5 for the tidy data is the object named tidy_data
tidy_data

