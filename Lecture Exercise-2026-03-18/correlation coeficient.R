x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
#data of weight
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
data1=data.frame(x,y)
data1_train<-data1[1:7,]
data1_test<-data1[8:10,]
# Apply the lm() function
relation <- lm(y~x, data1_train)
print(relation)

a <- data.frame(x= data1_test$x) 
result <-  predict(relation,a) 
print(result) 
#Performance measurement 
actuals_preds <- data.frame(cbind(actuals=data1_test$y, predicteds=result)) 
correlation_accuracy <- cor(actuals_preds)# 
print(correlation_accuracy)

