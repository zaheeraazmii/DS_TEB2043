# Exam Score Analysis (Stores 20 exam scores, counts grades, and checks pass/fail)

# Input vector of 20 exam scores
scores <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61, 13, 44, 26, 24, 73, 73, 90, 39, 90, 54)

# Initialize grade counters
count_A <- count_B <- count_C <- count_D <- count_E <- count_F <- 0

# Count grades based on score ranges
for (score in scores) {
  if (score >= 90) {
    count_A <- count_A + 1
  } else if (score >= 80) {
    count_B <- count_B + 1
  } else if (score >= 70) {
    count_C <- count_C + 1
  } else if (score >= 60) {
    count_D <- count_D + 1
  } else if (score >= 50) {
    count_E <- count_E + 1
  } else {
    count_F <- count_F + 1
  }
}

# Display grade counts
cat("Grade A (90-100):", count_A, "students\n")
cat("Grade B (80-89):", count_B, "students\n")
cat("Grade C (70-79):", count_C, "students\n")
cat("Grade D (60-69):", count_D, "students\n")
cat("Grade E (50-59):", count_E, "students\n")
cat("Grade F (<=49):", count_F, "students\n")
cat("\n")

# Check pass/fail for each student (>49 passes)
pass_status <- scores > 49
cat("Pass/Fail status for each student (TRUE = Pass, FALSE = Fail):\n")
print(pass_status)