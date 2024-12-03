# Problem 2 (Easy)
library(babynames)
library(dplyr)

babynames %>% filter(n > 100)

babynames %>% select(-year)

babynames %>% mutate(name_length = nchar(name))

babynames %>% filter(sex == "M") %>% select(-prop)

babynames %>% select(year, sex)


