library("tidyverse")
# Two Categorical Variables
# To visualize the covariation between categorical variables
ggplot(data = diamonds) +
 geom_count(mapping = aes(x = cut, y = color))

diamonds %>%
 count(color, cut)

# Then visualize with geom_tile() and the fill aesthetic:
diamonds %>%
 count(color, cut) %>%
 ggplot(mapping = aes(x = color, y = cut)) +
 geom_tile(mapping = aes(fill = n))

