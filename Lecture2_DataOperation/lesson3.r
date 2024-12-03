#Getting start with graphs
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg ~ wt))
title("Regression of MPG on Weight")
detach(mtcars)

#Line Chart
dose <- c(20, 30, 40, 45 ,60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

clinical_test <- data.frame(dose, drugA, drugB)
plot(clinical_test$dose, clinical_test$drugA, type = 'l')

points(clinical_test$dose, clinical_test$drugB)
lines(clinical_test$dose, clinical_test$drugB)

title(main = "drugA vs. drugB")

#Histogram
hist(mtcars$mpg)

#Boxplot
boxplot(mtcars$mpg ~ mtcars$cyl)
