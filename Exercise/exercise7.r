# Problem 6 (Medium)
# Load required libraries
library(mdsr)
library(ggplot2)
library(dplyr)

# Load the MLB_teams dataset
data("MLB_teams")

# Create a scatter plot with multiple variables
ggplot(MLB_teams, aes(x = W, y = L, color = DivWin, size = HR, shape = HBP)) +
  geom_point() +
  scale_color_manual(values = c("red", "blue"), labels = c("No", "Yes")) +
  labs(x = "Wins", y = "Runs Scored", color = "Division Win",
       size = "Home Runs", shape = "Hit by Pitch") +
  theme_minimal()
