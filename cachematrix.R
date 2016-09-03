## Below are 2 functions that creates a special invertible matrix and caches the 
## inverse of that matrix

## makecasheMatrix creates a special matrix that has a list that
## contains 4 functions:
##  set the values of matrix,
##  get the values of matrix, 
##  set the inverse of the matrix,
##  and get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  ## Return a list of functions available in the "speical"cacheMatrix
  inverseMatrix <- NULL
  set <- function(y) {t
    x <<- y
    inverseMatrix <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inverseMatrix <<- solve
  getinverse <- function() inverseMatrix
  list(set = set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## cacheSolve solve for the inverse of the special matrix created
## in makeCacheMatrix. First it checks to see if there is already an inverse,
## if not it will solve for the invese and return it.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverseMatrix <- x$getinverse()
  if(!is.null(inverseMatrix)) {
    message("getting cached inverse")
    return(inverseMatrix)
  }
  data <- x$get()
  inverseMatrix <- solve(data, ...)
  x$setinverse(inverseMatrix)
  inverseMatrix
}