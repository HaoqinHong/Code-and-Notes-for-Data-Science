attach(iris)
#Save the graph
png("RStudioProjects\\Data_Science\\Lecture2_DataOperation\\mygraph.png")
plot(iris$Sepal.Length, iris$Sepal.Width)
boxplot(iris$Sepal.Length~iris$Species, col = terrain.colors(3))
dev.off()
#We should firstly png() before plotting and dev.off() at last


