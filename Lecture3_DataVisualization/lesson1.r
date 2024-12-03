library("tidyverse")
# Creating a ggplot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# Aesthetic Mappings
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# alpha controls the transparency
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Facets
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 3)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

# Exercise
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price)) +
  facet_wrap(~color, nrow = 2)

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price)) +
  facet_wrap(~cut, nrow = 3)

# Save the plot
png("E:\\ProgrammingProjects\\RStudioProjects\\Data_Science\\Lecture3_DataVisualization\\exercise.png")
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price)) +
  facet_grid(color ~ clarity)
dev.off()
