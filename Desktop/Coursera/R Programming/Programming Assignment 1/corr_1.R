corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}


#this function simply combines all of the data files into one large file 

datacombine<- function(directory,id=1:2){ #function1 is a function of the directory provided and id. The default is 1:332, but in practice this will be filed by the user as they apply the function Polllutantmean
  newdirectory<- paste("C:/Users/kdavison/Desktop/R Programming/Programming Assignment 1/",directory,sep="") #This pastes together the filepath where all the files are stored to the specific directory used in the input  
  allfiles <- list.files(newdirectory,full.names=TRUE) #This provides a character vector of all of the files inside the direcotry provided 
  totaldata<- data.frame() #This produces a blank dataframe with 0 columns and 0 rows
  for(i in id){ #For every i in 332
    totaldata <- rbind(totaldata,read.csv(allfiles[i])) #this joins the empty data frame to the data of the first .csv file
  }
  totaldata #This prints total data, which is the combination of all of the 332 files?
}

corr <- function(directory, threshold = 0){
alldata <- datacombine(directory,id = 1:2)  #Call the datacombine function to create the dataframe of all of the files 
s <- vector() # s is now a logical vector that is blank
id<- 1:332
sulfate<- vector() #make empty vectors which will then be filled by that column from the original data
nitrate<- vector() #make empty vectors which will then be filled by that column from the original data
for (i in 2) { #for every i in 332
  s <- sum(complete.cases(alldata)) #the ith part of S gets the number of complete cases in the data table
  alldatanoNAs <- na.omit(alldata)
  sulfate <- alldatanoNAs[["sulfate"]]
  nitrate <- alldatanoNAs[["nitrate"]]
}
 correlation<- vector()
 if(s > threshold)
 {correlation[i] <- cor(sulfate,nitrate)}
 correlation
}

corr("specdata",400)
 

