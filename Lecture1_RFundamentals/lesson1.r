x <- 5
y <- "Hello"
z <- TRUE

#Vector
v <- c(1, 3, 5, 7, 9)

s <- c("I", "Love", "China")

q <- c("a" = 5, "b" = 6, "c" = 7, "d" = 8)

names(s) <- c("A1", "A2", "A3")

s1 <- seq(1, 100, 2)
s2 <- seq(1000, 100, -50)
s3 <- 1:100

s4 <- rep(x = c(0, 1), times = 3) #0 1 0 1 0 1
s5 <- rep(x = c(0, 1), each = 10) #0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1

four_seasons <- c("spring", "summer", "autumn", "winter") #spring summer autumn winter  
season_fac <- factor(four_seasons)                        #Levels: autumn spring summer winter
