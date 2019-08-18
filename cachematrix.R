## This script file has two functions that cache the solution to an inverse 
## matrix


## This function saves a matrix within a list of functions

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) m <<- inverse
    getInverse <- function() m
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## This function solves the matrix to an inverse, then it saves that result to 
## makeCacheInverse()'s m variable. Once stored there, it is doesn't need to be
## calculated again. It is cached.

cacheSolve <- function(x, ...) {
            ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m

}
    
    

