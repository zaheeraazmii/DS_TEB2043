#install package and import library
install.packages("lattice")
library(lattice)
#load data
data(environmental)
data <-environmental
head(data)

#correlation matrix of data, round each value to 2 decimal places
corr_mat <- round(cor(data),2)
print(corr_mat)
View(corr_mat)

#feature selection----------------------------------------------------
#install package and import library
install.packages("lattice")
library(lattice)
#load data
data(environmental)
data <-environmental
head(data)

#correlation matrix of data, round each value to 2 decimal places
corr_mat <- round(cor(data),2)
head(corr_mat)

# Reshape correlation matrix
install.packages("reshape2")
library(reshape2)

melted_corr_mat <- melt(corr_mat)
View(melted_corr_mat)

# plotting the correlation heatmap
library(ggplot2)
ggplot(data = melted_corr_mat, aes(x = Var1, y = Var2, fill = value)) +  geom_tile() +geom_text(aes(label = round(value, 2)), color = "black", size = 4) +  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0)