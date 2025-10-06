# Assignment #6: Matrix Operations and Construction

# TASK 1: Matrix Addition & Subtraction
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)
A + B
A - B

# TASK 2: Create a Diagonal Matrix
D <- diag(c(4, 1, 2, 3))
D

# TASK 3: Construct a Custom 5×5 Matrix
M <- diag(3, 5)
col1 <- matrix(c(3, 2, 2, 2, 2), ncol = 1)
row1 <- matrix(1, ncol = 5)
M <- rbind(row1, M[-1,])
M <- cbind(col1, M[, -1])
M
