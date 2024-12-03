# Problem 9 (Medium)
library(palmerpenguins)
library(ggplot2)

# Scatterplot with regression lines and colored species
ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ species, scales = "free") +
  labs(x = "Bill Length (mm)", y = "Bill Depth (mm)") +
  theme_minimal()
