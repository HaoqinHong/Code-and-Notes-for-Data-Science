# 1.Write a R program to take input from the user (name and age) and display the values. 
# Take input from the user
name <- readline("Enter your name: ")
age <- readline("Enter your age: ")

# Display the entered values
cat("Name: ", name, "\n")
cat("Age: ", age, "\n")

# Print the version of R installation
cat("R version: ", R.version.string, "\n")


# 2.Write a R program to get the details of the objects in memory. 
name <- "Python"
n1 <-  10
n2 <-  0.5
nums <- c(10, 20, 30, 40, 50, 60)
print(ls())
print("Details of the objects in memory:")
print(ls.str())

# 3.Write a R program to create a sequence of numbers from 20 to 50 
# and find the mean of numbers from 20 to 60 and sum of numbers from 51 to 91. 
# Create a sequence of numbers from 20 to 50
numbers <- 20:50

# Calculate the mean of numbers from 20 to 60
mean_20_to_60 <- mean(20:60)

# Calculate the sum of numbers from 51 to 91
sum_51_to_91 <- sum(51:91)

# Print the results
cat("Sequence of numbers from 20 to 50:", numbers, "\n")
cat("Mean of numbers from 20 to 60:", mean_20_to_60, "\n")
cat("Sum of numbers from 51 to 91:", sum_51_to_91, "\n")


# 4. Write a R program to create a vector 
# which contains 10 random integer values between -50 and +50. 
random_vector <- numeric(10)
for (i in 1:10) {
  random_vector[i] <- sample(-50:50, 1)
}
print(random_vector)


# 5. Write a R program to get the first 10 Fibonacci numbers. 
# Function to generate Fibonacci numbers
fibonacci <- function(n) {
  fib <- numeric(n)  
  fib[1] <- 0  
  fib[2] <- 1  
  
# Generate the remaining Fibonacci numbers
  for (i in 3:n) {
    fib[i] <- fib[i-1] + fib[i-2]  
  }
  
  return(fib)
}

# Get the first 10 Fibonacci numbers
n <- 10
fib_numbers <- fibonacci(n)
for (i in 1:n) {
  print(fib_numbers[i])
}


# 6.Write a R program to get all prime numbers 
# up to a given number (based on the sieve of Eratosthenes). 
getPrimes <- function(n) {
  sieve <- rep(TRUE, n+1)
  sieve[1] <- FALSE  # 1 is not prime

# Use the sieve of Eratosthenes algorithm
  p <- 2
  while (p^2 <= n) {
    if (sieve[p]) {
      for (i in (p^2):n:p) {
        sieve[i] <- FALSE
      }
    }
    p <- p + 1
  }
  primes <- which(sieve)
  return(primes)
}

# Test the function
n <- 50  # Change this number to your desired value
primeNumbers <- getPrimes(n)
print(primeNumbers)


# 7. Write a R program to print the numbers from 1 to 100 and print "Fizz" for multiples 
# of 3, print "Buzz" for multiples of 5, and print "FizzBuzz" for multiples of both. 
for (i in 1:100) {
  if (i %% 3 == 0 && i %% 5 == 0) {
    print("FizzBuzz")
  } else if (i %% 3 == 0) {
    print("Fizz")
  } else if (i %% 5 == 0) {
    print("Buzz")
  } else {
    print(i)
  }
}


# 8. Write a R program to extract first 10 english letter in lower case and last 10 letters 
# in upper case and extract letters between 22nd to 24th letters in upper case. 
letters_lower <- letters[1:10]
letters_upper <- LETTERS[17:26]

letters_between <- toupper(letters[22:24])

print("First 10 letters in lowercase:")
print(letters_lower)

print("Last 10 letters in uppercase:")
print(letters_upper)

print("Letters between 22nd and 24th positions in uppercase:")
print(letters_between)



# 9.Write a R program to find the factors of a given number. 
number <- 24

findFactors <- function(number) {
  factors <- c()  
  
  for (i in 1:number) {
    if (number %% i == 0) {
      factors <- c(factors, i)  
    }
  }
  
  return(factors)  
}

result <- findFactors(number)
cat(paste("The factors of", number, "are:", paste(result, collapse = ", ")))


# 10. Write a R program to find the maximum and the minimum value of a given vector. 
# Function to find the maximum and minimum values
find_max_min <- function(vector) {
  max_value <- max(vector)
  min_value <- min(vector)
  return(list(maximum = max_value, minimum = min_value))
}

vector <- c(5, 2, 9, 1, 7)
result <- find_max_min(vector)

cat("Maximum value:", result$maximum, "\n")
cat("Minimum value:", result$minimum, "\n")
