library("tidyverse")
#Geometric Objects
#Curve fitting
ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y =hwy))

ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y =hwy, linetype = drv))

ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y =hwy, group = drv), se = FALSE) 

ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y =hwy, color = drv)) 

#Display multiple geoms in the same plot
ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y =hwy)) +
    geom_point(mapping = aes(x = displ, y =hwy))

ggplot(data = mpg, aes(x = displ, y =hwy)) +
    geom_smooth() +
    geom_point(aes(color = class))

ggplot(data = mpg, aes(x = displ, y =hwy)) +
    geom_smooth(
        data = filter(mpg, class == "subcompact"),
        se = FALSE #Do not show confidence area
    ) +
    geom_point(aes(color = class))

#Exercise
ggplot(data = diamonds, aes(x = carat, y = price, linetype = cut)) +
    geom_point(aes(color = color)) + 
    geom_smooth(se = FALSE)
