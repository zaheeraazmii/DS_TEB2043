# Program to calculate BMI and display exactly one TRUE category

weight <- as.numeric(readline(prompt = "Enter weight (kg): "))
height <- as.numeric(readline(prompt = "Enter height (m): "))

bmi <- weight / (height ^ 2)

underweight <- normal <- overweight <- obese <- FALSE

if (bmi <= 18.4) {
  underweight <- TRUE
} else if (bmi <= 24.9) {
  normal <- TRUE
} else if (bmi <= 39.9) {
  overweight <- TRUE
} else {
  obese <- TRUE
}

cat("Underweight:", underweight, "\n")
cat("Normal:", normal, "\n")
cat("Overweight:", overweight, "\n")
cat("Obese:", obese, "\n") 