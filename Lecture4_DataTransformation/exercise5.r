library("tidyverse")
library("nycflights13")
# What time of day should you fly if you want to avoid delays as much as possible?
not_cancelled <- flights %>%
    filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>%
    group_by(hour) %>%
    select(hour, arr_delay, flight, tailnum) %>%
    summarise(sum(arr_delay)) 
