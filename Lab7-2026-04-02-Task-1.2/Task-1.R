install.packages('readxl')
any(grepl("readxl",installed.packages()))

library(readxl)
titanic <- read.csv("DS_TEB2043/Lab7-2026-04-02-Task-1.2/titanic.csv")
View(titanic)

#identifying N/As (sum of na and which column)
sum(is.na(titanic))
print(sapply(titanic, function(x) sum(is.na(x))))

#ommiting NA values and making a new table
dim(titanic)
titanic_cleaned = na.omit(titanic)
dim(titanic_cleaned)
View(titanic_cleaned)

install.packages("dplyr")
library(dplyr)

#renaming columns
colnames(titanic_cleaned)
names(titanic_cleaned)
names(titanic_cleaned) = gsub(" ", "_", colnames(titanic_cleaned))
names(titanic_cleaned)

#drop unesccary column (cabin)
titanic_cleaned <- titanic_cleaned %>%
  select(-Cabin)

#filter female (look at rows with female only)
print(filter(titanic_cleaned,Sex == 'female'))
View(filter(titanic_cleaned,Sex == 'female'))

# Save as CSV file
write.csv(titanic_cleaned, "titanic_cleaned.csv")

