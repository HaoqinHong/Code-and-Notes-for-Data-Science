# Problem 3 (Easy)
library(ggplot2)

# Create the data frame
data <- tibble(
  name = c("Ledecky", "Ledecky", "Ledecky"),
  gender = c("F", "F", "F"),
  distance = c(100, 200, 400),
  time_in_sd = c(-0.8, 1.7, 2.9)
)

# Generate the plot
ggplot(data, aes(x = distance, y = time_in_sd)) +
  geom_point()
