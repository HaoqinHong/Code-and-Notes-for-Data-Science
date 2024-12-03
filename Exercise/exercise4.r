# Problem 3 (Medium)
library(mosaicData)
library(ggplot2)

marriage_plot <- ggplot(data = Marriage, aes(x = Occupation, fill = cut(AgeMarry, breaks = 10))) +
  geom_bar() +
  labs(x = "Occupation", y = "Count", fill = "Age at Marriage") +
  ggtitle("Distribution of Age at Marriage by Occupation") +
  theme_minimal()

print(marriage_plot)


