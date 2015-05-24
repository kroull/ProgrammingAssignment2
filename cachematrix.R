# Caching the Inverse of a Matrix
#
# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. This
# file contains a pair of functions that cache the inverse of a matrix.
#
# See the file test of cachematrix.R for an example of usage.

makeCacheMatrix <- function(x = matrix()) {
  # This function creates a special "matrix" object that can cache its inverse.
  #
  # Args:
  #   x: A matrix.
  #
  # Returns:
  #   A special "matrix", wich can be used as input to the function cacheSolve.

  i <- NULL # i as in Inverse

  set <- function(y) {
    x <<- y
    i <<- NULL
  }

  get <- function() x

  setInverse <- function(inverse) i <<- inverse

  getInverse <- function() i

  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
  # This function computes the inverse of the special "matrix" returned by
  # makeCacheMatrix above. If the inverse has already been calculated (and
  # the matrix has not changed), then cachesolve retrieves the inverse from
  # the cache.
  #
  # Args:
  #   x: A special "matrix" created by the function makeCacheMatrix.
  #
  # Returns:
  #   A matrix with the inverse of x.
  i <- x$getInverse()

  if(!is.null(i) ) {
    message("getting cached data")
    return(i)
  }

  data <- x$get()
  i <- solve(data, ...)
  x$setInverse(i)
  i
}
