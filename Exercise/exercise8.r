# Problem 7 (Medium)
library(mosaicData)
library(ggplot2)

data(RailTrail)

# Convert the RailTrail dataset to a data frame
railtrail_df <- as.data.frame(RailTrail)

# Convert the 'Date' column to the appropriate date format
railtrail_df$Date <- as.Date(railtrail_df$Date)

# Create a weekday column (0 for weekend/holiday, 1 for weekday)
railtrail_df$Weekday <- ifelse(weekdays(railtrail_df$Date) %in% c("Saturday", "Sunday"), 0, 1)

# Plot the scatterplot with facets and regression lines
ggplot(railtrail_df, aes(x = HighTemp, y = crossingsPerDayVolume)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(Weekday ~ .) +
  labs(x = "High Temperature (°F)", y = "Crossings per Day Volume")
