library(dplyr)
library(readr)
student_data<- read.csv("C:/Users/zaheera/Downloads/dsClass/data science/student_data.csv")

#intro
View(student_data)
summary(student_data)
head(student_data)
tail(student_data)

#filter
#1. Student_fail
Student_fail<- student_data %>% filter(final_exam_mark< 40)
View(Student_fail)

#2. Arrange Student Data (Pass Only)
mydata<- student_data%>% filter(final_exam_mark > 40) %>% arrange(final_exam_mark)
View(mydata)

#descending
mydata1<- student_data %>% filter(final_exam_mark > 40) %>% arrange(desc(final_exam_mark))
View(mydata1)

#3. Select
mydata2 <- student_data%>% select(student_id,coursework_mark, final_exam_mark)
View(mydata2)

glimpse(mydata2)

#4. Mutate
mydata3 = student_data%>% mutate(Total_Mark=((coursework_mark + final_exam_mark) / 200 * 100))
View(mydata3)


#Descriptive Analytics
data <- iris
str(data)


summary(data)
min(data$Sepal.Length) #this produces 4.3
max(data$Sepal.Length) #this produces 7.9



A<-c(170.2, 181.5, 188.9, 163.9, 166.4, 163.7, 160.4, 175.8, 181.5)
quantile(A)
sort(A)
IQR(A) #Difference between 1Q and 3Q

#Visualization
hist(iris$Sepal.Length,
     main = "Histogram of Sepal Length",
     xlab = "Sepal Length (cm)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")

boxplot(Sepal.Length ~ Species,
        data = iris,
        main = "Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length (cm)",
        col = c("lightgreen", "lightpink", "lightyellow"))

plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Sepal Length vs Petal Length",
     xlab = "Sepal Length (cm)",
     ylab = "Petal Length (cm)",
     col = as.numeric(iris$Species),
     pch = 19)



dfplayers<- read.csv("C:/Users/zaheera/Downloads/dsClass/data science/players.csv")
is.na(dfplayers)

median_age <- median(dfplayers$Age, na.rm =TRUE)
View(median_age)


dfplayers$Age[dfplayers$Age<18 | dfplayers$Age>38]<-median_age
View(dfplayers)


#handling outlier
dat2<-c(30,24,26,28,29,28,27,26,32,34,13,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)
boxplot(data, main = "Boxplot")

first_q<-quantile(data,0.25) #this is 26
third_q<-quantile(data,0.75) #this is 31.75
iqr<-IQR(data) #this produces 5.75

le<-first_q - 1.5 * iqr #this produces 17.375
ue<-third_q + 1.5 * iqr #this produces 40.375

data_new<-data
data_new <- data_new[!data_new<le]
data_new <- data_new[!data_new>ue]
data_new

boxplot(data_new, main = "Boxplot New")


























