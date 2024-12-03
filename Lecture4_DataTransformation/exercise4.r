library("tidyverse")
library("nycflights13")
# Which plane (tailnum) has the worst on-time record?
flights_delay <- flights %>%
    group_by(tailnum) %>% 
    filter(!is.na(arr_delay)) %>% 
    summarise(total_delay = sum(arr_delay)) %>%
    arrange(desc(total_delay))
flights_delay
