age <- c(20, 18, 22)
gender <- c("Female", "Male", "Male")
weight <- c(55, 65, 70)
mydata <- data.frame(age, gender, weight)
mydata
fix(mydata) #append the data

mydata1 <- data.frame(age=numeric(0), gender=character(0), weight=numeric(0)) #enter data using editor 
mydata1 <- edit(mydata1)
