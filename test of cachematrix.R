# Standard R
mat <- matrix(c(2,0,0,2), nrow = 2, ncol = 2)
mat
matInv <- solve(mat)
matInv
# [,1] [,2]
# [1,]  0.5  0.0
# [2,]  0.0  0.5

# Cached
source('cachematrix.R')
matrix <- makeCacheMatrix(mat)
matrix$get()
# [,1] [,2]
# [1,]    2    0
# [2,]    0    2

matrixInv  <- cacheSolve(matrix)
matrixInv
# [,1] [,2]
# [1,]  0.5  0.0
# [2,]  0.0  0.5

matrixInv  <- cacheSolve(matrix)
# getting cached data
matrixInv
# [,1] [,2]
# [1,]  0.5  0.0
# [2,]  0.0  0.5
