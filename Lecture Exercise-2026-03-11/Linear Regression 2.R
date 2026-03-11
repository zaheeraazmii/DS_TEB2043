#Income Happiness
library(readr)

df <- read_csv("C:\Users\User\Documents\DS_TEB2043\Lecture Exercise-2026-03-11\income_happiness.csv")

#Split data into training (80%) and testing (20%) sets
#Randomly select row indices for training
train_indices <- sample(1:nrow(df), size = 0.8 * nrow(df))
train_data <- df[train_indices, ]
test_data <- df[-train_indices, ]
# Apply the lm() function
relation <- lm(happiness~income, data=train_data)
print(relation)


# Prediction
a <- data.frame(x=test_data$income)
colnames(a) <- "income"
result <- predict(relation,a)
#Plot
plot(test_data$income,test_data$happiness,col="red",
     abline(lm(happiness~income,
               data=train_data)),pch = 16,xlab =
       "income",ylab = "happiness")