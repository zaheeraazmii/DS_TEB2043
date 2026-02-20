V1 <- c(2,3,1,5,4,6,8,7,9)

M <- matrix(c(V1), nrow= 3, byrow= TRUE)
print(M)

N <- matrix(c(V1), nrow= 3, byrow= FALSE)
print(N)

rownames = c("row1", "row2", "row3")
colnames = c("col1", "col2", "col3")

M1 <- matrix(c(V1), nrow = 3, byrow = TRUE, dimnames =list(rownames, colnames))
print(M1)

M2 <- t(M1)
print(M2)

rownames <- c("row1", "row2", "row3")
colnames <- c("col1", "col2", "col3")

M1 <- matrix(V1, nrow = 3, byrow = TRUE, dimnames = list(rownames, colnames))
print(M1)

M2 <- matrix(M2, nrow = 3, byrow = TRUE, dimnames = list(rownames, colnames))
print(M2)

addition <- M1 + M2
print (addition)

minus <- M1 - M2
print(minus)

multiply <- M1 * M2
print(multiply)

division <- M1/M2
print(division)