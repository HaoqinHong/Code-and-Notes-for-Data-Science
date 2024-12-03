#Subsetting
x <- c(1.1, 2.2, 3.3, 4.4, 5.5)

#index
x[1]
x[c(1, 3)]
x[c(3, 1)]

#Delete
x[-2]
x[c(-3, -4)]

#Logic vector
x > 2
x[x > 2]
x[c(TRUE, FALSE, TRUE, FALSE, FALSE)]
