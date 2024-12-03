# Grouped Summaries with summarize()
library("nycflights13")
library("tidyverse")
summarise(flights, mean(dep_delay))
summarise(flights, mean(dep_delay, na.rm = T))
summarise(flights, avg_delay = mean(dep_delay, na.rm = T))

by_day <- group_by(flights, year, month, day)
summarise(by_day, avg_delay = mean(dep_delay, na.rm = T))

# Combining Multiple Operations with pipe
by_dest <- group_by(flights, dest)
delay <- summarize(by_dest,
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm =TRUE)
    )
delay <- filter(delay, count > 20, dest != "HNL")

ggplot(data = delay, mapping = aes(x = dist, y =delay)) +
    geom_point(aes(size = count), alpha = 1/3) +
    geom_smooth(se = FALSE)

# Tackle the same problem with the pipe
# x %>% f(y) turns into f(x, y), and x %>% f(y) %>% g(z) turns into g(f(x, y), z)
delay <- flights %>%
    group_by(dest) %>%
    summarize(
        count = n(),
        dist = mean(distance, na.rm = TRUE),
        delay = mean(arr_delay, na.rm =TRUE)
    ) %>%
    filter(count > 20, dest != "HNL")

ggplot(data = delay, mapping = aes(x = dist, y =delay)) +
    geom_point(aes(size = count), alpha = 1/3) +
    geom_smooth(se = FALSE)

# Missing values
not_cancelled <- flights %>%
    filter(!is.na(dep_delay), !is.na(arr_delay))
not_cancelled %>%
    group_by(year, month, day) %>%
    summarize(mean = mean(dep_delay))

# Counts
delays <- not_cancelled %>%
    group_by(tailnum) %>%
    summarize(
        delay = mean(arr_delay)
    )

ggplot(data = delays, mapping = aes(x = delay)) +
    geom_freqpoly(binwidth = 10)

# Exercise
by_cut <- group_by(diamonds, cut)
summarize(by_cut, avg_price = mean(price, na.rm = TRUE))

by_class <- group_by(mpg, class)
summarize(by_class, avg_hwy = mean(hwy, na.rm = TRUE))

ggplot(data = diamonds, mapping = aes(x = price)) +
    geom_freqpoly(binwidth = 100)
