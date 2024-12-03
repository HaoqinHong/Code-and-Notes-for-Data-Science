library("tidyverse")
# Visualizing Distributions
# To examine the distribution of a categorical variable
ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut))

diamonds %>%
    count(cut)

# To examine the distribution of a continuous variable
ggplot(data = diamonds) +
    geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

ggplot(data = diamonds) +
    geom_freqpoly(mapping = aes(x = price), binwidth = 100)

ggplot(data = diamonds) +
    geom_freqpoly(mapping = aes(x = carat, y = ..density.., color = cut), binwidth = 0.1)


# Tyical Values
smaller <- diamonds %>%
    filter(carat < 3)
ggplot(data = smaller, mapping = aes(x = carat)) +
    geom_histogram(binwidth = 0.01)

# Unusual Values
ggplot(diamonds) +
    geom_histogram(mapping = aes(x = y), binwidth = 0.5)

ggplot(diamonds) +
    geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
    coord_cartesian(ylim = c(0, 50))

unusual <- diamonds %>% 
    filter(y < 3 | y > 20)
unusual

# Missing Values
diamonds2 <- diamonds %>%
    filter(between(y, 3, 20))

diamonds2 <- diamonds %>%
    mutate(y = ifelse(y < 3 | y > 20, NA, y))

ggplot(data = diamonds2, mapping = aes(x = x, y = y)) +
    geom_point(na.rm = TRUE)
