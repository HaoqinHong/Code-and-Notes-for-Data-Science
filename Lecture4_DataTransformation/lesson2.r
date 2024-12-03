# Arrange Rows with arrange()
library("nycflights13")
arrange(flights, year, month, day) # arrange() change the rows' order

# Use desc() to reorder by a column in descending order
arrange(flights, desc(arr_delay))
arrange(flights, desc(dep_delay))

# Missing values are always sorted at the end
df <- tibble(x = c(5, 2, NA))
arrange(df, x)
arrange(df, desc(x))

#Exercise
arrange(diamonds, desc(price))
