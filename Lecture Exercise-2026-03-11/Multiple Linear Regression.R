#1. mtcars dataset
data(mtcars)
head(mtcars)
str(mtcars)

#model the MLR
model <- lm(mpg ~ hp + wt + cyl, data = mtcars)
#investigate the properties of the model
summary(model)


data(mtcars)
#split data into train and test sets
data.train<- mtcars[1:22,]
data.test<- mtcars[23:32,]
#modelling
relation <-lm(mpg ~ hp +wt+cyl, data = data.train)
summary(relation)
# Prediction
a <- data.frame(hp = data.test$hp, wt = data.test$wt, cyl = data.test$cyl)
result <- predict(relation, a)
print(round(result, digits = 2)) 