library("tidyverse")
library("nycflights13")
# Grouping by Multiple Variables
daily <- group_by(flights, year, month, day)

(per_day <- summarize(daily, flights = n()))
(per_month <- summarize(per_day, flights = sum(flights)))
(per_year <- summarize(per_month, flights = sum(flights)))

# Grouped Mutates(and Filters)
flights_sml <- select(flights,
    year:day,
    ends_with("delay"),
    distance,
    air_time
    )

flights_sml %>%
    group_by(year, month, day) %>%
    filter(rank(desc(arr_delay)) < 10)

popular_dests <- flights %>%
    group_by(dest) %>%
    filter(n() > 365)

popular_dests %>%
    filter(arr_delay > 0) %>%
    mutate(prop_delay = arr_delay / sum(arr_delay)) %>%
    select(year:day, dest, arr_delay, prop_delay)
