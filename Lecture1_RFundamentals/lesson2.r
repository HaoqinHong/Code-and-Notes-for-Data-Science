#Matrix
m <- matrix(c(2, 4, 3, 1, 5, 7), nrow = 2, ncol = 3) 
class(m)
length(m)
dim(m)

n1 <- matrix(1:25, 5, 5)
n2 <- matrix(1:25, 5, 5, byrow = TRUE)

#List
list1 <- list(a = c(5, 10), b = c("I", "Love", "R", "Language", "!"), c = c(TRUE, TRUE, FALSE, FALSE))
list2 <- list(list1, n1, n2)

list1[1]
list2[1]
list2[1[1]]

#DataFrame
df <- data.frame(name = c("Alice", "Phoenix", "Kite"), age = c(20, 19, 22), color = c("blue", "red", "grey"))
#The vector in the dataframe should have the same length
