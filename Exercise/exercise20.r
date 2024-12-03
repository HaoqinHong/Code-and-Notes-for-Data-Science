# Problem 5 (Easy)
library(tidyverse)
mtcars %>%
  group_by(cyl) %>%
  summarize(
    N = n(),
    avg_mpg = mean(mpg)
  )

