

data <- ToothGrowth

data$supp <- as.numeric(data$supp)
print(head(data))
print(summary(data))
print(str(data))
print(tail(data))

#correlation analysis

# result_supp_x_len = cor(data$supp, data$len, method = "pearson")
# cat("Pearson correlation coefficient is:", result_supp_x_len)

dose_corr <- cor(data$dose, data$len, method="pearson")
print(paste("Pearson correlation between Dose and Length is:", dose_corr))

# dose_test_corr <- cor.test(data$dose, data$len, method = "pearson")
# print(paste("Pearson correlation between Dose and Length is:", dose_test_corr))

library(corrplot)
library(RColorBrewer)

M <- cor(data)
corrplot(M, type="upper")
corrplot(M, type="upper", order="hclust")
corrplot(M, type="upper", order="hclust",col=brewer.pal(n=8,
                                                        name="RdYlBu"))

#plot correlation on heatmap

library(lattice)

corr_mat <- round(cor(data),2)
print(head(corr_mat))
# reorder corr matrix using corr coefficient as distance metric
dist <- as.dist((1-corr_mat)/2)
# hierarchical clustering the dist matrix
hc <- hclust(dist)
corr_mat <-corr_mat[hc$order, hc$order]


library(reshape2)
# reduce the size of correlation matrix
melted_corr_mat <- melt(corr_mat)
print(head(melted_corr_mat))

library(ggplot2)
heatmap <- ggplot(data = melted_corr_mat, aes(x=Var1, y=Var2,
                                   fill=value)) + geom_tile() + geom_text(aes(Var2, Var1, label =
                                                                                value), color = "white", size = 4)

#discuss observation

# 1. Calculate the values first
dose_r <- round(cor(ToothGrowth$dose, ToothGrowth$len), 2)
supp_r <- round(cor(as.numeric(ToothGrowth$supp), ToothGrowth$len), 2)

# 2. Create the dynamic string using paste()
# \n creates a new line for better readability
print(paste(
  "1. Primary Driver of Growth (Dose):",
  paste0("The strongest relationship in the dataset is between Dose and Tooth Length (r ≈ ", round(dose_corr,2), ")."),
  "This high positive correlation proves that increasing the Vitamin C dosage is the most",
  "effective way to stimulate tooth growth, regardless of supplement type."))
  