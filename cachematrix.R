## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	cachedmatrix <- NULL
	set <- function(y) {
            x <<- y
	          cachedmatrix <<- NULL
        	  }
  get <- function() {
            x
		        }
  setinverse <- function(solve) {
			              cachedmatrix <<- solve
			              }
  getinverse <- function() {
			            cachedmatrix
			            }
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

	cachedmatrix <- x$getinverse()
        if(!is.null(cachedmatrix)) {
            message("getting cached data")
            return(cachedmatrix)
        }
        data <- x$get()
        cachedmatrix <- solve(data)
        x$setinverse(cachedmatrix)
        cachedmatrix
}
