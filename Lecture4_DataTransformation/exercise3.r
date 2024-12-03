library("tidyverse")
library("nycflights13")
# For each plane, count the number of flights before the first delay of greater than 1 hour.
flights_first<-flights %>%
    group_by(tailnum) %>%
    arrange(year, month, day, dep_time) %>%
    filter(arr_delay>60) %>%
    summarise(month = first(month), day = first(day), time = first(dep_time))
flights_first

not_cancelled <- flights %>%
    filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>%
    group_by(tailnum) %>%
    summarise(
    n = sum(month < flights_first$month) +
    sum(month == flights_first$month & day<flights_first$day) +
    sum(month==flights_first$month & day==flights_first$day & dep_time<flights_first$time))
