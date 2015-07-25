rankall<-function(outcome,num="best"){
  dir<-getwd();source("rankhospital.R")
  directory2<-paste(c(dir,"/outcome-of-care-measures.csv"),collapse='')
  a<-read.csv(directory2,na.strings="Not Available");b<-a[,c(2,7,11,17,23)]
  colnames(b)<-c("hospital","state","heartattack","heartfailure","pneumonia")
  b$hospital<-as.character(b$hospital)
  if (outcome!="heart attack" && outcome!="heart failure" && outcome!="pneumonia"){
    stop("invalid outcome")
  }
  statelist<-unique(b$state);statelist<-as.character(statelist);statelist<-sort(statelist)
  hosp<-vector();st<-vector()
  for (i in 1:length(statelist)){
    hosp[i]<-rankhospital(state=statelist[i],outcome=outcome,num=num)
    st[i]<-statelist[i]
  }
  data<-data.frame(hospital=hosp,state=st)
  return (data)
}