names =c("Carrol","Mike","John")
gender = c("Female", "Male", "Male")
height = c(160, 175, 173)
weight = c(49, 89, 77)
age = c(35, 36, 41)
df = data.frame(names,gender,height,weight,age)
View(df)
df["height"]
df["gender"]

#To Access Data
df$gender
df[1:2]
df[c(1,2)]
df[df$names=="Mike",]
df[df$age>35,]
df[df$height>170 & df$weight>80,]

#To Add New Data
newdf= rbind(df,data.frame(names = "Suuria",                            
                           gender = "Female",
                           height = 156,
                           weight = 56,
                           age = 23 ))
print(newdf)
print("Before Adding:\n")
print(df)
newDf = rbind(df, data.frame(names = c("Suuria","Malik"),
                             gender = c("Female","Male"),
                             height = c(156,169),
                             weight = c(56,81),
                             age = c(23, 28)))
print("After Added rows:\n")
print(newDf)
gender = c("Female", "Male", "Male","Female","Male")
height = c(160, 175, 173,156,169)
weight = c(49, 89, 77,56,81)
age = c(35, 36, 41,23, 28)
names =c("Carrol","Mike","John","Suuria","Malik")
df1 = data.frame(names,gender,height,weight,age)
states = c("Selangor","Perak","Melaka")
names = c("Carrol","John","Malik")
df2 = data.frame(names, states)

#To Merge
dfMerge= merge(df1, df2, by = "names", all= TRUE)
gender = c("Female", "Male", "Male","Female","Male")
height = c(160, 175, 173,156,169)
weight = c(49, 89, 77,56,81)
age = c(35, 36, 41,23, 28)
names =c("Carrol","Mike","John","Suuria","Malik")
df1 = data.frame(names,gender,height,weight,age)
states = c("Selangor","Perak","Melaka")
names = c("Carrol","John","Malik")
df2 = data.frame(names, states)
dfMerge= merge(df1, df2, by = "names", all= TRUE)

#To Remove Row
newDf2 = newDf[-2,]
newDf2
newDf3 = newDf
newDf3[1,"age"] <- 30
newDf3[4, "height"] <- 152
newDf3
newDf4 = newDf
newDf4[,-4]
newDf4

#To Import csv Files
data_cv = read.csv("C:\Users\User\Downloads\NAexample.csv")
data_cv
data_cv2 = read.csv("C:\Users\User\Downloads\my_covid.csv")
data_cv2
summary(data_cv2)
newdf<- data_cv[-seq(10, 13), ]
View(newdf)
write.csv (newdf, "C:\Users\User\Downloads\my_covid.csv")
a<-c(1:5, rep(NA,3),6:10)
a
sum(a)
b<-a[!is.na(a)]
b
sum(b)
a[is.na(a)]<-0
a
mean_value <- mean(dfMerge$states, na.rm = TRUE)
dfMerge$states[is.na(dfMerge$states)] <- mean_value

#Removing Bad Values
library(readr)
df_raw <- read.csv("C:\Users\User\Downloads\file1.csv")
df_cleaned <- df_raw
df_logrm <- data.frame(TagsValue=character(), Definition=character(),
                       Value=character())
rows_to_remove <- c()
for (i in 1:nrow(df_raw))
{
  if (df_raw[i, 2] == "Bad value" && df_raw[i, 3] == "Garbage")
  {
    rows_to_remove <- c(rows_to_remove, i)
    df_logrm <- rbind(df_logrm, c(df_raw[i, 1], df_raw[i, 2],df_raw[i, 3]))
  }
}
df_cleaned <- df_cleaned[-rows_to_remove, ]
View(df_cleaned)
View (df_logrm)

#Data Normalization
data(iris)
head(iris)
str(iris)
iris$Sepal.Length_norm <- (iris$Sepal.Length -
                             min(iris$Sepal.Length)) /
  (max(iris$Sepal.Length) - min(iris$Sepal.Length))
head(iris)

#Data Standardization
iris$Sepal.Length
mean_value <- mean(iris$Sepal.Length)
mean_value
sd_value <- sd(iris$Sepal.Length)
sd_value
z_manual <- (iris$Sepal.Length - mean_value) / sd_value
z_manual
iris$Sepal.Length_z_manual <- (iris$Sepal.Length - mean_value) / sd_value
head(iris)
iris$Sepal.Length_z <- scale(iris$Sepal.Length)
head(iris)

#Convert Categorical to Numerical
data(iris)
head(iris)
class(iris$Species)
levels(iris$Species)
iris$Species_numeric <- as.numeric(iris$Species)
head(iris)
