# Problem 8 (Medium)
library(ggplot2)

ggplot(storms, aes(x = longitude, y = latitude, color = storm_id)) +
  geom_path() +
  facet_wrap(~ year, nrow = 1)
