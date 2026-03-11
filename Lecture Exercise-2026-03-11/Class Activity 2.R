ozone <- c(11,11,11,12,12,13,13,13,13,14)
solar <- c(290,44,320,149,120,137,112,27,238,274)
wind <- c(9.2,9.7,16.6,12.6,11.5,10.3,11.5,10.3,12.6,10.9)
temp <- c(66,62,73,74,73,76,71,76,64,68)

df <- data.frame(ozone, solar, wind, temp)

set.seed(123)

train_index <- sample(1:nrow(df), 0.7*nrow(df))

train_data <- df[train_index, ]
test_data <- df[-train_index, ]

model <- lm(ozone ~ solar + wind + temp, data = train_data)

summary(model)

predicted_ozone <- predict(model, newdata = test_data)

data.frame(
  Actual = test_data$ozone,
  Predicted = predicted_ozone
)