# Function self-defined
my_std <- function(x) {(x - mean(x)) / sd(x)}
my_std(x = c(1, 5, 7, 8, 9, 3))

area <- function(r) {3.1415926 * r * r}
area(1.5)

mysquare <- function(x1, x2){
    y <- x1 ^ 2 + x2 ^ 2
    return(y)
}
mysquare(3, 4)

#Normalization function
rescale <- function(x){
    (x - min(x)) / (max(x) - min(x))
}

softmax <- function(x){
    x_exp = exp(x)
    sum_exp = sum(exp(x))
    x = x_exp / sum_exp
    return(x)
}
x <- c(1, 2, 3, 4, 5)
rescale(x)
softmax(x)

