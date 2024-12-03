# Filter Rows with filter()
library("nycflights13")
filter(flights, month == 1, day == 1)
jan1 <- filter(flights, month == 1, day == 1)
dec25 <- filter(flights, month == 12, day == 25)

# Comparisons
sqrt(2) ^ 2 == 2
1/49 * 49 == 1     # Computers use finite precision arithmetic

near(sqrt(2) ^ 2, 2)
near(1/49 * 49, 1)

# Logical Operators
filter(flights, month == 11 | month == 12)
nov_dec = filter(flights, month %in% c(11, 12))
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)

# Missing Values
x <- NA
y <- NA
x == y
is.na(x)
