library("tidyverse")
library("nycflights13")
# For each destination, compute the total minutes of delay. 
# For each flight, compute the proportion of the total delay for its destination.
flights_destination <- flights %>%
    filter(dep_delay > 0 & arr_delay > 0) %>% 
    group_by(dest) %>% 
    mutate(
        dep_arr_delay = dep_delay + arr_delay,
        total_delay = sum(dep_arr_delay),
        total_delay_proportion = dep_arr_delay / total_delay * 100
    ) %>% 
    select(carrier, flight, dest, dep_arr_delay, total_delay, total_delay_proportion) %>% 
    arrange(dest, desc(total_delay_proportion))
flights_destination
