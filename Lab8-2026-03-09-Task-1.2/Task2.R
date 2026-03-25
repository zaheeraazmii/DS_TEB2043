library(ggplot2)
library(dplyr)
library(tidyr)

data("EuStockMarkets")

# Convert to data frame and add the time column
eu_data <- as.data.frame(EuStockMarkets) %>%
  mutate(time = as.numeric(time(EuStockMarkets)))

# Reshape from "wide" to "long" format
eu_long <- eu_data %>%
  pivot_longer(
    cols = c(DAX, SMI, CAC, FTSE), 
    names_to = "Stock_Index", 
    values_to = "Price"
  )

closing <- ggplot(eu_long, aes(x = time, y = Price, color = Stock_Index)) +
  geom_line(linewidth = 0.8) +
  labs(
    title = "Daily Closing Prices of Major European Stock Indices",
    x = "Year",
    y = "Closing Price",
    color = "Market Index"
  ) +
  theme_minimal()

print(closing)


distr <- ggplot(eu_long, aes(x = Price, fill = Stock_Index)) +
  geom_density(alpha = 0.5) +
  theme_minimal() +
  labs(title = "Distribution of Stock Prices (1991-1998)",
       x = "Closing Price",
       y = "Density")


print(distr)

# Prepare data with a discrete Year column
eu_yearly <- eu_data %>%
  mutate(Year = as.factor(floor(time)))

gerPrice <- ggplot(eu_yearly, aes(x = Year, y = DAX, fill = Year)) +
  geom_boxplot() +
  guides(fill = "none") +
  theme_bw() +
  labs(title = "German DAX Price Spread by Year")

print(gerPrice)