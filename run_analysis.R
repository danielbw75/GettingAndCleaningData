#Getting-and-Cleaning-data Course Project

#open the Features and activity_labels data

features<-read.table("Courseproject/features.txt", col.names=c("vector", "formula"))
activitylabels<-read.table("Courseproject/activity_labels.txt", row.names=c("1","2","3","4","5","6"), col.names=c("label", "activity"))
#select the Formulas used in Features to name the test/train columns
# and better see the data instead of numbers


formula<-features[,"formula"]

#open test files
Xtest<-read.table("Courseproject/test/X_test.txt", col.names=formula)
Ytest<-read.table("Courseproject/test/Y_test.txt")
Subtest<-read.table("Courseproject/test/subject_test.txt", col.names="subject")

#open train files
Xtrain<-read.table("Courseproject/train/X_train.txt", col.names=formula)
Ytrain<-read.table("Courseproject/train/Y_train.txt")
Subtrain<-read.table("Courseproject/train/subject_train.txt", col.names="subject")

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
library(stringr)
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
extractedraw<-cbind(extractedX,Ytotal,Subtotal)