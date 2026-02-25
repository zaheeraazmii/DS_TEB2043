
player.data <- data.frame(
  name = c("Anastasia","Dima","Michael","Matthew","Laura", "Kevin", "Jonas"),
  score = c(12.5, 9.0, 16.5,12.0,9.0,8.0,19.0),
  attempts = c(1,3,2,3,2,1,2)
)

player.data$qualify <- c("yes","no","yes","no","no", "no","yes")

player.newdata <- data.frame(
  name = c("Emily"),
  score = c(14.5),
  attempts = c(1),
  qualify=c("yes")
)

player.data <- rbind(player.data,player.newdata)


player.data$qualify <- player.data$qualify == 'yes'

print("Structure of the data: ")
print(str(player.data))
print("Summary of the data: ")
print(summary(player.data))
print("Dimension of data: ")
print(dim(player.data))
print("Number of column: ")
print(ncol(player.data))
print("Number of row: ")
print(nrow(player.data))

print("From this data, we can observe if higher points which is more than 9.0 and attempt less than 3 will qualify.")





