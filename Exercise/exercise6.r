# Problem 5 (Medium)
library(Lahman)
library(ggplot2)

data("Teams")
subset_data <- subset(Teams, select = c(yearID, teamID, W, L, payroll))

subset_data$WinningPercentage <- subset_data$W / (subset_data$W + subset_data$L)
ggplot(subset_data, aes(x = payroll, y = WinningPercentage)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Payroll", y = "Winning Percentage", title = "Relationship between Winning Percentage and Payroll in MLB")
