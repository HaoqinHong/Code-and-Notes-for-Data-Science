# Problem 10 (Hard)
library(tidyverse)
library(mdsr)

babynames_dist <- make_babynames_dist()

# Filter names with a death probability of 0
deadest_names <- filter(babynames_dist, death_prob == 0)

# Sort the names by frequency in descending order
deadest_names <- deadest_names %>% arrange(desc(frequency))

# Create the plot
ggplot(deadest_names, aes(x = reorder(name, frequency), y = frequency)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(x = "Name", y = "Frequency", title = "Deadest Names") +
  theme_minimal()

