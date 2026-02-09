# Chemistry and Physics Analysis (Appends new scores and analyzes performance)

# Extended data with Chemistry and Physics scores
chemistry_scores <- c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)
physics_scores <- c(89, 86, 65, 52, 60, 67, 40, 77, 90, 61)

# Update the list with new subjects
student_records_extended <- list(
  names = student_names,
  exam_scores = exam_scores,
  chemistry = chemistry_scores,
  physics = physics_scores
)

# Count failures (score <= 49) for each subject
chemistry_fails <- sum(chemistry_scores <= 49)
physics_fails <- sum(physics_scores <= 49)

# Find highest scores for each subject
highest_chemistry <- max(chemistry_scores)
highest_physics <- max(physics_scores)

# Find students with highest scores in each subject
students_highest_chem <- student_names[chemistry_scores == highest_chemistry]
students_highest_phys <- student_names[physics_scores == highest_physics]

# Display results
cat("Number of students failing Chemistry (<=49):", chemistry_fails, "\n")
cat("Number of students failing Physics (<=49):", physics_fails, "\n")
cat("\n")
cat("Highest Chemistry score:", highest_chemistry, "\n")
cat("Student(s) with highest Chemistry score:", paste(students_highest_chem, collapse = ", "), "\n")
cat("\n")
cat("Highest Physics score:", highest_physics, "\n")
cat("Student(s) with highest Physics score:", paste(students_highest_phys, collapse = ", "), "\n")