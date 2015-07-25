## This function takes a matrix provided and calculates the inverse of the matrix. If the matrix has been provided previously, 
##then a cached version of the matrix is passed instead to save space. 

#A cached version of the matrix is made to be used in future iterations 

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL 
  set <- function(y){
    x <<- y
    i <<- NULL 
  }
 get <- function() x
 setinverse <-  function(solve) i <<- inverse
 getinverse<- function() i 
  list(set = set, get = get, 
      setinverse = setinverse, 
      getinverse = getinverse)
}

 ## This funcion looks to see if a chached version is avaliable and returns that rather than recalculating the matrix inverse. 

cacheSolve <- function(x) {
  i <-x$getinverse()
  if(!is.null(i)) {
       message("getting cached data")
       return(i)
  }
        ## Return a matrix that is the inverse of 'x'
   data <- x$get()
   i <- solve(data, ...)
   x$setmean(i)
  return(i)
}


