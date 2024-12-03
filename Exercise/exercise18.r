# Problem 3 (Easy):
library(tidyverse)
mtcars %>%
  group_by(cyl) %>%
  summarize(avg_mpg = mean(mpg)) %>%
  filter(am == 1)
