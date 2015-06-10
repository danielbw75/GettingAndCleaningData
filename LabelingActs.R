

acts<-data.frame()
for(i in 1:length(yset)){
        lista<-labels[labels$lab==yset[i],]
        acts<-rbind(acts,lista)

}
