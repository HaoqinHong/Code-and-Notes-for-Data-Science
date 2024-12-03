library("tidyverse")
# Coordinate Systems
# coord_flip(): switches the x and y axes
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
    geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy, fill = class)) +
    geom_boxplot() +
    coord_flip()

ggplot(
    data = diamonds,
    mapping = aes(x = cut, y = price, fill = cut)
) +
    geom_boxplot() +
    coord_flip()

# coord_map(): sets the aspect ratio correctly for maps
library("maps")
zealand <- map_data("nz")
ggplot(zealand, aes(long, lat, group = group)) +
    geom_polygon(fill = "white", color = "black")

nz <- map_data("nz")
ggplot(nz, aes(long, lat, group = group)) +
    geom_polygon(fill = "grey", color = "pink") +
    coord_map()

# coord_polar(): uses polar coordinates
bar <- ggplot(data = diamonds) +
    geom_bar(
        mapping = aes(x = cut, fill =cut),
        show.legend = FALSE,
        width = 1
    ) +
    theme(aspect.ratio = 1) +
    labs(x = NULL, y = NULL)
bar
bar + coord_flip()
bar + coord_polar()
bar + coord_polar(theta = 'y')

#exercise
bar <- ggplot(data = mpg) +
    geom_bar(
        mapping = aes(x = class, fill = class),
        show.legend = TRUE,
        width = 1
    ) +
    theme(aspect.ratio = 1) +
    labs(x = "Class", y = "Number")
bar
bar + coord_flip()
bar + coord_polar()
