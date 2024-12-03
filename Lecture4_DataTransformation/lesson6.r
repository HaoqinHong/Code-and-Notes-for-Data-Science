library("Lahman")
library("tidyverse")
library("nycflights13")
# Convert to a tibble so it prints nicely
batting <- as_tibble(Lahman::Batting)
batters <- batting %>% 
    group_by(playerID) %>%
    summarize(
    ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
    ) 
arrange(batters, desc(ba))

batters %>% 
    filter(ab > 1000) %>%
    ggplot(mapping = aes(x = ab, y = ba)) +
    geom_point() +
    geom_smooth(se = FALSE)

batters %>% 
    filter(ab > 1000) %>%
    arrange(desc(ba))

# Useful Summary Function
not_cancelled <- flights %>%
    filter(!is.na(dep_delay), !is.na(arr_delay))
not_cancelled %>%
    group_by(year, month, day) %>%
    summarize(
        # average delay:
        avg_delay1 = mean(arr_delay),
        # average positive delay:
        avg_delay2 = mean(arr_delay[arr_delay > 0])
    )

# Measures of spread sd(x), IQR(x), mad(x)
not_cancelled %>%
    group_by(dest) %>%
    summarize(distance_sd = sd(distance)) %>%
    arrange(desc(distance_sd))

# Measures of rank min(x), quantile(x, 0.25), max(x)
not_cancelled %>%
    group_by(year, month, day) %>%
    summarize(
        first = min(dep_time),
        last = max(dep_time)
    )

# Measures of position first(x), nth(x, 2), last(x)
not_cancelled %>%
    group_by(year, month, day) %>%
    summarize(
        first_dep = first(dep_time),
        last_dep = last(dep_time)
    )

not_cancelled %>%
    group_by(year, month, day) %>%
    mutate(r = min_rank(desc(dep_time))) %>%
    filter(r %in% range(r))

# Counts
not_cancelled %>%
    group_by(dest) %>%
    summarize(carriers = n_distinct(carrier)) %>% # n_distinct() counts the number of distinct(unique) values
    arrange(desc(carriers))

not_cancelled %>% 
    count(dest)

not_cancelled %>%
    count(tailnum, wt = distance)

# Counts and proportions of logical values sum(x > 10), mean(y == 0)
# How many flights left before 5am?
not_cancelled %>%
    group_by(year, month, day) %>%
    summarize(n_early = sum(dep_time < 500))

# What proportion of flights are delayed by more than an hour?
not_cancelled %>%
    group_by(year, month, day) %>%
    summarize(hour_perc = mean(arr_delay > 60))

# Exercise
diamonds %>%
    group_by(cut) %>%
    mutate(r = min_rank(price)) %>%
    filter(r >=10, r<= 20)
