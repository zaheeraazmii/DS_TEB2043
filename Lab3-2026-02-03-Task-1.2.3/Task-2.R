# Student Records in List (Stores records in a list, finds highest, lowest, and average)

# Create vectors for student names and scores
student_names <- c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", "Larson", "Holland", "Paul", "Simu", "Renner")
exam_scores <- c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)

# Store in a named list
student_records <- list(
  names = student_names,
  scores = exam_scores
)

# Give names to list elements
names(student_records) <- c("Student Names", "Exam Scores")

# Calculate statistics
highest_score <- max(student_records[[2]])
lowest_score <- min(student_records[[2]])
average_score <- mean(student_records[[2]])

# Find students with highest and lowest scores
students_with_highest <- student_records[[1]][student_records[[2]] == highest_score]
students_with_lowest <- student_records[[1]][student_records[[2]] == lowest_score]

# Display results
cat("Highest Score:", highest_score, "\n")
cat("Lowest Score:", lowest_score, "\n")
cat("Average Score:", round(average_score, 2), "\n")
cat("Student(s) with highest score:", paste(students_with_highest, collapse = ", "), "\n")
cat("Student(s) with lowest score:", paste(students_with_lowest, collapse = ", "), "\n")