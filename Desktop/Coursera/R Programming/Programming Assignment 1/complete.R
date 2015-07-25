


complete <- function(directory, id = 1:332) { #The function complete is a function of directory and id, which defaults to 1:332
  s <- vector() # s is now a logical vector that is blank
  for (i in 1:length(id)) { #for every i in the length (332 is default length) do the following:
    path <- c(paste(directory, "/",formatC(id[i], width=3, flag=0),".csv",sep=""))   #path gets the filepath (minus wd) to the files, id is used to determine which file is opened
    data <- c(read.csv(path)) #data is turned into the table for each numbered CSV
    s[i] <- sum(complete.cases(data)) #the ith part of S gets the number of complete cases in the data table
  dat <- data.frame(cbind(id,nobs=s))   # Once it has looped through all of the i's, dat gets a dataa frame that turns the vector that is s into a datafram with the pieces of the vector as the columns. Nunmber of observations is determined by the size of s
  }
  return(dat)#???
}

complete("specdata",1:2)

  