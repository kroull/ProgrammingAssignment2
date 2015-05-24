# Standard R
mat <- matrix(c(2,0,0,2), nrow = 2, ncol = 2)
mat
matInv <- solve(mat)
matInv

# Cached
matrix <- makeCacheMatrix(mat)
matrix$get()

matrixInv  <- cacheSolve(matrix)
matrixInv

matrixInv  <- cacheSolve(matrix)
matrixInv
