library("tidyverse")
library("nycflights13")
# Come up with another approach that will give you the same output 
# as not_cancelled %>% count(dest) and 
# not_cancelled %>% count(tailnum, wt = distance) (without using count()).
not_cancelled <- flights %>%
    filter(!is.na(dep_delay), !is.na(arr_delay)) 
not_cancelled %>%
    count(dest)

not_cancelled %>%
    group_by(dest) %>%
    summarize(n())

not_cancelled %>%
    count(tailnum, wt = distance)

not_cancelled %>%
    group_by(tailnum) %>%
    summarise(distance = sum(distance))
