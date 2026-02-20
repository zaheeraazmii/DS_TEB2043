num <- as.integer(readline(prompt = "Input and integer:"))

if (is.na(num) || num < 0){
  print("Invalid Input")
} else {
  original_num <- num
  sum <- 0
  
  #number of digits
  n <- nchar(as.character(num))
  
  while (num > 0){
    digit <- num %% 10 #get last digit
    sum <- sum + digit^n
    num <- num %/% 10
  }
  
  
  if (sum == original_num){
    cat(original_num, "is an Armstrong number.")
  } else {
    cat(original_num, "is not an Armstrong number")
  }
}