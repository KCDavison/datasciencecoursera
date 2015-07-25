


combinedfile <- function(directory, id=1:332) {
  wd <- paste("C:/Users/kdavison/Desktop/R Programming/Programming Assignment 1/",directory,sep="")
  filelist <- list.files(wd, full.names=TRUE)
  alldata <- data.frame()
  for (i in id) {
    alldata <- rbind(alldata,read.csv(filelist[i]))
  }
  alldata
}

pollutantmean <- function(directory, pollutant, id=1:332) {
  alldata <- combinedfile(directory, id)
  col <- alldata[[pollutant]]
  pollutantmean <- mean(col, na.rm=TRUE)
  pollutantmean
}
