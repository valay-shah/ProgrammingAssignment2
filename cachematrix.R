## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function is use to set and get the vector as well as set and get the inverse of a matrix
library(MASS)
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function
## This function looks if the value is cathed in the previous function and if not it will 
## create the inverse of the matrix.
cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...) #It can also be done by "m<-ginv(data)"
  x$setinverse(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
