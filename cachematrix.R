## Caches the inverse of the function

## Creates a list of functions to get/set the inverse and get/set the
## inverse in the cache. To be used to cacheSolve

makeCacheMatrix <- function(x = matrix()) {
  i = NULL
  
  set = function(y)
  {
    x <<- y
    i <<- NULL
  }
  
  get = function() x
  
  setinv = function(solve) i <<- solve
  
  getinv = function() i
  
  
  list (set=set, get=get, setinv=setinv, getinv=getinv)
}


## Retrives a cached inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i = x$getinv()
  
  # Check if cached or not
  if (!is.null(i))
  {
    # Not null. So, get the cached data
    message("getting cached data")
    return(i)
  }
  
  # Set the inverse on to the cache
  data = x$get()
  i = solve(data)
  x$setinv(i)
  i
}





