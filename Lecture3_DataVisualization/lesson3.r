library("tidyverse")
#Statistical Transformations
ggplot(data = diamonds) +
    geom_bar(aes(x = cut))

ggplot(data = diamonds) +
    stat_count(aes(x = cut))

demo <- tribble(
    ~cut,             ~ratio,
    "Fair",           0.1,
    "Good",           0.2,
    "Very Good",      0.25,
    "Premium",        0.35,
    "Ideal",          0.1
)
ggplot(data = demo) +
geom_bar(
    aes(x = cut, y = ratio), stat = "identity"
)

ggplot(data = diamonds) +
    geom_bar(
        mapping = aes(x = cut, y = ..prop.., group = 1) #Probability
    )

ggplot(data = diamonds) +
    stat_summary(
        mapping = aes(x = cut, y =depth),
        fun.ymin = min,
        fun.ymax = max,
        fun.y = median
    )

ggplot(data = iris) + 
    stat_summary(
        aes(x = Species, y = Sepal.Length), 
        fun.ymax = max, 
        fun.min = min, 
        fun.y = mean
        )

#Exercise
ggplot(data = diamonds) +
    geom_bar(aes(x = color, y = ..prop.., group = 1))

ggplot(data = diamonds) +
    stat_summary(
        mapping = aes(x = color, y = y),
        fun.ymin = min,
        fun.ymax = max,
        fun.y = median
    )
