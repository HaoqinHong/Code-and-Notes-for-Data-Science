# Problem 1 (Easy)
library(babynames)
library(dplyr)

Random_subset

result_a <- Random_subset %>%
select(year, sex, name, n) %>%
  filter(year %in% c(2010, 1989, 1928, 1981))

result_b <- Random_subset %>%
  mutate(name_length = nchar(name)) %>%
  select(year, sex, name, n, prop) %>%
  filter(name_length == 6)

result_c <- Random_subset %>%
  mutate(total = n * prop) %>%
  select(year, sex, name, n, prop, total) %>%
  filter(total > 1990000)

result_d <- Random_subset %>%
  slice(c(1:3, 6:10)) %>%
  select(year, n)


