# Problem 2 (Easy)
# Required libraries
library(ggplot2)

# Data
movie_categories <- c("Action", "Drama", "Thriller", "Biography")
movie_counts <- c(12, 8, 6, 4)

# Create a data frame
data <- data.frame(Category = movie_categories, Count = movie_counts)

# Create the bar plot
ggplot(data, aes(x = Category, y = Count, fill = Category)) +
  geom_bar(stat = "identity") +
  labs(title = "Types of Denzel Washington Movies",
       x = "Category", y = "Count") +
  theme_minimal()
