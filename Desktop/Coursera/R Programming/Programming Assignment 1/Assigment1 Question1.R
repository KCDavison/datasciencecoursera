

pollutantmean<- function(directory,pollutant,id){
  newdirectory<- paste("C:/Users/kdavison/Desktop/R Programming/Programming Assignment 1/",directory,sep="")
  setwd(newdirectory)
  totalmean<- rep(NA,length(id))
  for(i in id){
  filename<- paste(formatC(id[i],digits=2,flag="0"),".csv",sep="")
  file<- read.csv(filename)
  col<-file[[pollutant]]
  filemean<-mean(col,na.rm=TRUE)
  totalmean[i]<- filemean  
  }
  finalaverage <- sum(totalmean[id])/ length(id)
  print(finalaverage)
}

#pollutantmean("specdata","sulfate",1:10)
 