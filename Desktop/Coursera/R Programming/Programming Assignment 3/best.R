best<- function(state,outcome){
 data<- read.csv("outcome-of-care-measures.csv",colClasses = "character") #Read in the CSV
  if(!state %in% unique(data[,7])){
    stop("invalid state") #Check to make sure the state that is input is a valid state
  }
  switch(outcome,'heart attack' = { #Assigns the correct columns for the input valuess or returns an error for an invalid outcome 
    col=11
  } , 'heart failure' = {
    col = 17
  } , 'pneumonia' = {
     col = 23 
  }, stop("invalid outcome"))
  answer = data[data$State == state,c(2,col)] 
  answer[which.min(answer[ , 2]),1]
}

