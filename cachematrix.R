## Put comments here that give an overall description of what your
## functions do

##### Calculate de inverse matrix, storing this matrix to avoid its calculation again



## Write a short comment describing this function

##### makeCacheMatrix
#####
##### Store the data of a created matrix. The store is composed to a list with 4 elements:
#####   1 - assingment of the matrix (set)
#####   2 - show the matrix (get)
#####   3 - calculate de inverse matrix (setinverse)
#####   4 - show the inverse matrix (getinverse)

makeCacheMatrix <- function(x = matrix()) {
  cachedmatrix <- NULL                # create an empty object, which is used to store the returned values
  
  set <- function(y) {                # create a function to assign the value of the matrix
            x <<- y
            cachedmatrix <<- NULL
            }
  
  get <- function() {                 # create a function to show the matrix
            x
            }
  
  setinverse <- function(solve) {     # create a function to calculate the inverse matrix
                    cachedmatrix <<- solve
                    }
  
  getinverse <- function() {          # create a function to show the inverse matrix
                  cachedmatrix
                  }
  
  # create a list, which elements are been described above
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

##### Calculate the invese matrix. In the case, it is the first time, it calculates the
##### inverse matrix, else it returns the inverse matrix calculated previously, which is
##### obtained calling getinverse() function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'

  cachedmatrix <- x$getinverse()   # obtain the inverse matrix
  
  # if it was calculated previously (x$getinverse() returns the inverse matrix)
  if(!is.null(cachedmatrix)) {
      message("getting cached data")
      return(cachedmatrix)      # return the inverse matrix
      }
  
  # else
  data <- x$get()               # if the inverse matrix was not calculated previously
  cachedmatrix <- solve(data)   # calculate the inverse matrix
  x$setinverse(cachedmatrix)    # store the inverse matrix in the list
  cachedmatrix                  # return the inverse matrix
}
