# Problem 1 (Easy)
library(babynames)

name_data <- babynames[babynames$name == "Angelica", ]

plot(name_data$year, name_data$prop, type = "l",
     xlab = "Year", ylab = "Proportion", main = "Proportion of Babies Named Angelica")

axis(side = 1, at = seq(min(name_data$year), max(name_data$year), by = 10))
axis(side = 2)




