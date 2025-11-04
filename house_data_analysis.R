sink("house_data")
house_data <- data.frame(
  Price = c(250000, 300000, 400000, 350000, 450000, 500000, 320000, 380000, 420000, 470000),
  Area = c(1200, 1500, 1800, 1600, 2000, 2200, 1400, 1700, 1900, 2100),
  Bedrooms = c(2, 3, 3, 3, 4, 4, 2, 3, 3, 4),
  Distance = c(10, 8, 6, 9, 5, 4, 11, 7, 6, 5)
)

model <- lm(Price ~ Area + Bedrooms + Distance, data = house_data)


summary(model)

new_data <- data.frame(Area = c(1800, 1600),
                       Bedrooms = c(3, 2),
                       Distance = c(6, 9))
predicted_prices <- predict(model, newdata = new_data)
print(predicted_prices)


r_squared <- summary(model)$r.squared
adj_r_squared <- summary(model)$adj.r.squared
residual_error <- summary(model)$sigma

cat("R-squared:", r_squared, "\n")
cat("Adjusted R-squared:", adj_r_squared, "\n")
cat("Residual Standard Error:", residual_error, "\n")
sink()
