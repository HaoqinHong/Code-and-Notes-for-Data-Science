# Add New Variables with mutate()
library("nycflights13")
flights_sml <- select(flights,
    year:day,
    ends_with("delay"),
    distance,
    air_time
    )
# Add new columns that are functions of existing columns
mutate(flights_sml,
    gain = arr_delay - dep_delay,
    speed = distance / air_time * 60,
    )

# Refer to columns that just created
mutate(flights_sml,
    gain = arr_delay - dep_delay,
    hours = air_time * 60,
    gain_per_hour = gain / hours
    )

# transmute() only keep the new variables
transmute(flights_sml,
    gain = arr_delay - dep_delay,
    hours = air_time * 60,
    gain_per_hour = gain / hours
    )

transmute(flights,
    dep_time,
    hour = dep_time %/% 100,    # integer division
    minute = dep_time %% 10     # remainder
    )
