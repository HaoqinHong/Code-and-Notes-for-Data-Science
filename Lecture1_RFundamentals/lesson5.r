#Condition statement
square_if <- function(num){
    if(is.numeric(num))
    { num ^ 2 }
    else {
       " Your input is not a numeric!"
    }
}
square_if(5)
square_if("A")

#Return multiple argument
mystat_list <- function(x){
    meanval <- mean(x)
    sdval <- sd(x)
    list(sd = sdval, mean = meanval)
}
mystat_dataframe <- function(x){
    meanval <- mean(x)
    sdval <- sd(x)
    data.frame(sd = sdval, mean = meanval)
}
x <- 1: 100
mystat_list(x)
mystat_dataframe(x)

mystat_list(x)$mean
mystat_list(x)[1]
