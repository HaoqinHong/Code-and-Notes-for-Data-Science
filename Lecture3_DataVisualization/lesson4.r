library("tidyverse")
# Position Adjustments
ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut, color = cut))

ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut, fill = cut))


ggplot(data = diamonds) +
    geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds) +
    geom_bar(
        mapping = aes(x = cut, fill = clarity),
        position = "dodge"
    ) # places overlapping objects directly beside one another

ggplot(data = diamonds) +
    geom_bar(
        mapping = aes(x = cut, fill = clarity),
        position = "identity"
    ) # place each object exactly where it falls in the context of the graph

ggplot(data = diamonds) +
    geom_bar(
        mapping = aes(x = cut, fill = clarity),
        position = "identity", alpha = 1 / 5
    )

ggplot(
    data = diamonds,
    mapping = aes(x = cut, color = clarity)
) +
    geom_bar(fill = NA, position = "identity")

ggplot(data = diamonds) +
    geom_bar(
        mapping = aes(x = cut, fill = clarity),
        position = "fill"
    ) # makes each set of stacked bars the same height

ggplot(data = mpg) +
    geom_point(
        mapping = aes(x = displ, y = hwy),
        position = "jitter"
    ) # adds a small amount of random noise to each point

# exercise
ggplot(data = mpg) +
    geom_bar(aes(x = class, fill = drv), position = "dodge")

ggplot(data = mpg) + 
    geom_bar(aes(x = class, fill = factor(cyl)), position = "fill")
