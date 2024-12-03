# Problem 2 (Easy)
library(tidyverse)
library(dplyr)

ggplot(storms, aes(x = wind, y = pressure, color = type)) +
  geom_point() +
  labs(
    col = 'Type',
    title = 'Scatterplot Between Wind and Pressure with Each Type of Storm',
    x = 'Wind',
    y = 'Pressure',
  )
