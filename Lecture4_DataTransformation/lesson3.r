# Select Columns with select()
library("nycflights13")
# Select columns by name
select(flights, year, month, day)

# Select all columns between year and day(inclusive)
select(flights, year:day) 

# Select all columns except those from year to day(inclusive)
select(flights, -(year:day))

# Other helper functions within select()
select(flights, ends_with("delay") | starts_with("arr"))
select(flights, contains("arr"))

# Use rename() keeps all the variables that aren't explicitly mentioned
rename(flights, tail_num = tailnum)

# Move to the start of the data frame
select(flights, time_hour, air_time, everything())
