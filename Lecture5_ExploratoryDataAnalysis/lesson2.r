library("tidyverse")
# Covariation
# A Categorical and Continuous Variable
ggplot(data = diamonds, mapping = aes(x = price)) +
 geom_freqpoly(mapping = aes(color = cut), binwidth = 500)
# The default appearance of geom_freqpoly() is
# not that useful for that sort of comparison because 
# the height is given by the count.

ggplot(diamonds) +
 geom_bar(mapping = aes(x = cut))

# Instead of displaying count, we’ll display density, 
# which is the count standardized
ggplot(
 data = diamonds,
 mapping = aes(x = price, y = ..density..)
 ) +
 geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
 geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
 geom_boxplot()

# To make the trend easier to see, we can reorder class based on the
# median value of hwy:
ggplot(data = mpg) +
 geom_boxplot(
 mapping = aes(
 x = reorder(class, hwy, FUN = median),
 y = hwy))

# If you have long variable names, geom_boxplot() will work better if
# you flip it 90°. You can do that with coord_flip():
ggplot(data = mpg) +
 geom_boxplot(
    mapping = aes(
        x = reorder(class, hwy, FUN = median),
        y = hwy)) +
            coord_flip()

