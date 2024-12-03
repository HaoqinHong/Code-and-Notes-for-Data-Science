#Calculate Operation
x <- c(1, 3, 5, 7, 9)
y <- c(2, 4, 6, 8, 10)

x^2
x + y

#Logic Operation
a <- c(TRUE, FALSE, FALSE)
b <- c(TRUE, TRUE, FALSE)

a | b    #TRUE TRUE FALSE
a & b    #TRUE FALSE FALSE
a && b   #TRUE

a <- c(1, 3, 7)
b <- c(1, 2, 3, 4, 5)

a %in% b
