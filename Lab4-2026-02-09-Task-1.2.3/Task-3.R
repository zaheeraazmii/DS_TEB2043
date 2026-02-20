data1 <- c(1:24)
Array1 <- array(data1, dim= c(2,4,3))
print("Array 1")
print(Array1)


data2 <- c(25:53)
Array2 <- array(data2, dim= c(3,2,5))
print("Array 2")
print(Array2)

print( " Second row of second matrix of array 1 : ")
print(Array1[2, ,2])

print("Element in 3rd row and 2nd of first matrix of array 2 :")
print(Array2[3,2,1])
