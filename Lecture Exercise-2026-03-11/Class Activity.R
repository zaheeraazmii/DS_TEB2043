# Create dataset
experience <- c(1,2,3,4,5,6,7,8,9,10)
salary <- c(2500,2700,3000,3400,3900,4400,5000,5600,6200,6900)

df <- data.frame(experience, salary)

# Split dataset (70% training, 30% testing)
set.seed(123)

train_index <- sample(1:nrow(df), 0.7*nrow(df))

train_data <- df[train_index, ]
test_data <- df[-train_index, ]

# Build regression model
model <- lm(salary ~ experience, data=train_data)

# Show model summary
summary(model)

# Predict using test data
predicted_salary <- predict(model, newdata=test_data)

# Compare predicted vs actual
data.frame(
  Experience = test_data$experience,
  Actual = test_data$salary,
  Predicted = predicted_salary
)

# Scatter plot
plot(df$experience, df$salary,
     main="Experience vs Monthly Salary",
     xlab="Years of Experience",
     ylab="Monthly Salary (RM)",
     pch=19)

# Add regression line
abline(model, col="blue", lwd=2)