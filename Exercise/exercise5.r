# Problem 4 (Medium)
library(tidyverse)
library(etl)
library(macleish)

# Load the data
data(whately_2015)

# Calculate average temperature by each 10-minute interval
avg_temp <- whately_2015 %>%
  group_by(when = round_date(when, "10 mins")) %>%
  summarize(average_temperature = mean(temperature))

# Create the plot
ggplot(avg_temp, aes(x = when, y = average_temperature)) +
  geom_line() +
  labs(x = "Time", y = "Average Temperature") +
  ggtitle("Average Temperature Over 10-Minute Intervals in 2015")
