#Load-up the data
mtcars
write.csv(mtcars, "E:\\ProgrammingProjects\\RStudioProjects\\Data_Science\\Lecture2_DataOperation\\mtcars.csv")
write.table(mtcars, "E:\\ProgrammingProjects\\RStudioProjects\\Data_Science\\Lecture2_DataOperation\\mtcars.txt", sep=';')

#Load-in the data
hotdogs <- read.table("RStudioProjects\\Data_Science\\Lecture2_DataOperation\\hotdogs.txt", header = FALSE)
hotdogs

potatoes <- read.csv("RStudioProjects\\Data_Science\\Lecture2_DataOperation\\potatoes.csv")
potatoes
