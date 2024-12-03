# Problem 4 (Easy)
# Install the ggplot2 package if you haven't already
# install.packages("ggplot2")

# Load the ggplot2 library
library(ggplot2)

# Sample data
data <- data.frame(
  category = c("A", "B", "C", "D"),
  value = c(10, 15, 7, 12)
)

# Create a bar plot
ggplot(data, aes(x = category, y = value)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Bar Plot", x = "Category", y = "Value")
