#Simple linear regression

#1. data of height
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
#data of weight
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
# Apply the lm() function
relation <- lm(y~x)
print(relation)

#2. Find weight of a person with height 170
X_test <- data.frame(x = 170)
result <- predict(relation,X_test)
print(round(result, digit=2))

#3. Plot the chart
plot(x,y,col = "blue",main = "Height & Weight Regression",
     abline(lm(y~x)),pch = 16,xlab = "Height in cm", ylab = "Weight in Kg")

#4. Training, Testing & Performance analysis
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152,
       131)
#data of weight
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
#Creating data frame
data1= data.frame(x,y)
#splitting data into training and testing
data1_train<-data1[1:7,]
data1_test<-data1[8:10,]
# Apply the lm() function
relation <- lm(y~x, data1_train)
print(relation)

#Make prediction
x_text <- data.frame(x= data1_test$x)
result <- predict(relation,x_text)
print(result)

mape <- mean(abs((data1_test$y -result)/data1_test$y)*100)
cat("The error - MAPE is: ", round(mape,digit=2),"%\n")

actuals_preds <- data.frame(cbind(actuals=data1_test$y,
                                  predicteds=result))

mape <- mean(abs(actuals_preds$actuals - actuals_preds$predicteds )/
               actuals_preds$actuals)*100
cat("The error - MAPE is: ", round(mape,digit=2),"%")