dose <- c(20, 30, 40, 45 ,60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

clinical_test <- data.frame(dose, drugA, drugB)
plot(clinical_test$dose, clinical_test$drugA, type = 'b', pch = 2)
plot(clinical_test$dose, clinical_test$drugA, type = 'b', pch = 5)
plot(clinical_test$dose, clinical_test$drugA, type = 'b', pch = 25, col = 'red', bg ='blue')

points(clinical_test$dose, clinical_test$drugB, pch = 7)
lines(clinical_test$dose, clinical_test$drugB, , lty = 3, lwd = 3)

attach(mtcars)
terrain.colors(3)
boxplot(mpg~cyl, col = c("#00A600", "#ECB176", "#F2F2F2"))
boxplot(mpg~cyl, col = rainbow(3))

# Set a graphical parameter using par()
opar <- par(no.readonly=TRUE) 
par(lty=2, pch=17, col = 'yellow', lty = 2) 
plot(dose, drugA, type="b") 
hist(mtcars$mpg)

par(opar)

plot(dose, drugA, type="b") 
hist(mtcars$mpg)
