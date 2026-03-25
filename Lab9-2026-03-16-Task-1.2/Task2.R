library(caret) 

# Load the dataset
data_raw <- mtcars

# Log Transformation 

data_log <- log(data_raw)

# Standard Scaling (Z-score)

data_standard <- as.data.frame(scale(data_raw))

# Min-Max Scaling

process_minmax <- preProcess(as.data.frame(data_raw), method=c("range"))
data_minmax <- predict(process_minmax, as.data.frame(data_raw))

#Comparison: View Summary for 'mpg' column
print(summary(data_raw$mpg))
print(summary(data_log$mpg))      
print(summary(data_standard$mpg))
print(summary(data_minmax$mpg))   