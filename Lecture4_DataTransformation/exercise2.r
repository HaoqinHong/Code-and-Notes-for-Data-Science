library("tidyverse")
library("nycflights13")
# Which carrier has the worst delays? 
# Challenge: can you disentangle the effects of bad airports versus bad carriers? Why/why not? 
# (Hint: think about flights %>% group_by(carrier,dest) %>% summarize(n()).)
flights %>% 
    group_by(carrier, dest) %>% 
    mutate(total_delay = dep_delay + arr_delay) %>%
    summarise(total_delay = sum(total_delay)) %>% 
    arrange(desc(total_delay))

filter(airlines, carrier == "B6")
