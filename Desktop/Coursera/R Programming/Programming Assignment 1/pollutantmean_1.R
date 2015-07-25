
#pollutantmean
function1<- function(directory,id=1:332){ #function1 is a function of the directory provided and id. The default is 1:332, but in practice this will be filed by the user as they apply the function Polllutantmean
  newdirectory<- paste("C:/Users/kdavison/Desktop/R Programming/Programming Assignment 1/",directory,sep="") #This pastes together the filepath where all the files are stored to the specific directory used in the input  
  allfiles <- list.files(newdirectory,full.names=TRUE) #This provides a character vector of all of the files inside the direcotry provided 
  totalmean<- data.frame() #This produces a blank dataframe with 0 columns and 0 rows
  for(i in id){ #For every i in 332
   totalmean <- rbind(totalmean,read.csv(allfiles[i])) #this joins the empty data frame to the data of the first .csv file
     }
  totalmean #This prints total mean, which is the combination of all of the 332 files?
}
 
pollutantmean<-function(directory,pollutant,id=1:332) { #pollutantmean is a function of directory, which pollutant, and the id
alldata <- function1(directory,id) #Alldata is now the result of function1, which is the combination of the files chosen as the input (not all since the input here is ID from above)
col<- alldata[[pollutant]] # the dataframe col is now a table of only the pollutant that is selected 
pollutantmean <- mean(col,na.rm=TRUE) #takes the mean the table col, excluding the NA values
pollutantmean #disays the final result, which is the total mean
}


pollutantmean("specdata","sulfate",1:2)




