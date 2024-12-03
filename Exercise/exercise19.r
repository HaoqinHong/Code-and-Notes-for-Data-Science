# Problem 4 (Easy)
library(Lahman)
library(ggplot2)

Teams$BABA <- Teams$H / Teams$AB
Teams$SLGSLG <- (Teams$H - Teams$X2B - Teams$X3B - Teams$HR + 2 * Teams$X2B + 3 * Teams$X3B + 4 * Teams$HR) / Teams$AB

ggplot(Teams, aes(x = yearID, y = SLGSLG, color = teamID)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  labs(x = "Year", y = "Slugging Percentage", title = "Slugging Percentage vs. Year")

ggplot(Teams, aes(x = yearID, y = BABA, color = teamID)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  labs(x = "Year", y = "Batting Average", title = "Batting Average vs. Year")

