

#Function to get nummber of complete cases in a table callled dat

completecases<- function(directory="specdata",id<-1:2) {
  s <- vector() # s is now a logical vector that is blank
 for (i in 1:2) { #for every i in the total number of files(332)
    path <- c(paste(directory, "/",formatC(id[i], width=3, flag=0),".csv",sep=""))   #path gets the filepath (minus wd) to the files, id is used to determine which file is opened
    data <- read.csv(path) #data is turned into the table for each numbered CSV
    s[i] <- sum(complete.cases(data)) #the ith part of S gets the number of complete cases in the data table
    dat <- data.frame(cbind(id,nobs=s))   # Once it has looped through all of the i's, dat gets a data frame that turns the vector that is s into a datafram with the pieces of the vector as the columns. Nunmber of observations is determined by the size of s
    dat
    }
  

corrprep <- function(directory, threshold = 0) { #The function complete is a function of directory and id, which defaults to 1:332
  id<- 1:2
  allcor<- data.frame()
  for (i in id)
  if((dat[i,2]) > threshold){
  idtable<- cbind(data[4],data[["sulfate"]],data[["nitrate"]])
   idtablenoNas<- idtable[complete.cases(idtable),]
   nitrate<- idtablenoNas[2]
   sulfate<- idtablenoNas[3]
   allcor<- data.frame(rbind(cor(sulfate),cor(nitrate))
   }
  alltable
      }
  
  

corr("specdata",1:2)