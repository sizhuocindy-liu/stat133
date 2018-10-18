# ---
# title: Binomial Probability Functions
# author: Sizhuo(Cindy) Liu
# description: creating binomial probability functions
# outputs: binomial-functions.R
# ---

# function 'is_integer()'
#' @title check if a number is an integer
#' @description check if a number is an integer
#' @param len input (numeric)
#' @return output (logical)
is_integer <- function(x) {
  if (x %% 2 == 0 | x %% 2 == 1){
    return(2 %% 2 == 0)
  } else {
    return(3 %% 2 == 0)
  }
}
# test function
# TRUE's
is_integer(-1) 
is_integer(0) 
is_integer(2L) 
is_integer(2)
# FALSE's
is_integer(2.1) 
is_integer(pi) 
is_integer(0.01)




# function 'is_positive()'
#' @title check if a number is positive
#' @description check if a number is positive
#' @param len input (numeric)
#' @return output (logical)
is_positive <- function(x) {
  if (x > 0){
    return(2 %% 2 == 0)
  } else {
    return(3 %% 2 == 0)
  }
}
# test function
# TRUE's
is_positive(0.01) 
is_positive(2)
# FALSE's
is_positive(-2) 
is_positive(0)




# function 'is_nonnegative()'
#' @title check if a number is nonnegative
#' @description check if a number is nonnegative
#' @param len input (numeric)
#' @return output (logical)
is_nonnegative <- function(x) {
  if (x >= 0){
    return(2 %% 2 == 0)
  } else {
    return(3 %% 2 == 0)
  }
}
# test function
# TRUE's
is_nonnegative(0) 
is_nonnegative(2)
# FALSE's
is_nonnegative(-0.00001) 
is_nonnegative(-2)




# function 'is_positive_integer()'
#' @title check if a number is a positive integer
#' @description check if a number is a positive integer
#' @param len input (numeric)
#' @return output (logical)
is_positive_integer <- function(x) {
  if (is_integer(x)==TRUE & is_positive(x)==TRUE){
    return(2 %% 2 == 0)
  } else {
    return(3 %% 2 == 0)
  }
}
# test function
# TRUE
is_positive_integer(2) 
is_positive_integer(2L)
# FALSE
is_positive_integer(0) 
is_positive_integer(-2)




# function 'is_nonneg_integer()'
#' @title check if a number is a nonnegative integer
#' @description check if a number is a nonnegative integer
#' @param len input (numeric)
#' @return output (logical)
is_nonneg_integer <- function(x) {
  if (is_integer(x)==TRUE & is_nonnegative(x)==TRUE){
    return(2 %% 2 == 0)
  } else {
    return(3 %% 2 == 0)
  }
}
# test function
# TRUE's
is_nonneg_integer(0) 
is_nonneg_integer(1)
# FALSE
is_nonneg_integer(-1) 
is_nonneg_integer(-2.5)




# function 'is_probability()'
#' @title check if a number represents probability
#' @description check if a numerical input count as a valid probability value
#' @param len input (numeric)
#' @return output (logical)
is_probability <- function(x) {
  if (x>=0 & x<=1){
    return(2 %% 2 == 0)
  } else {
    return(3 %% 2 == 0)
  }
}
# test function
# TRUE's
is_probability(0) 
is_probability(0.5) 
is_probability(1)
# FALSE's
is_probability(-1) 
is_probability(1.0000001)




# function 'bin_factorial()'
#' @title factorial
#' @description computing factorial
#' @param len input (numeric)
#' @return output (numeric)
bin_factorial <- function(x) {
  if (x == 0) {
    return(1)
  } else {
    y <- 1
    for(i in 1:x){
      y <-y*((1:x)[i])
    }
    return(y)
  }
}
# test function
# valid
bin_factorial(5)
bin_factorial(0)




# function 'bin_combinations()'
#' @title combinations
#' @description computing combinations
#' @param len input (numeric)
#' @return output (numeric)
bin_combinations<- function(n,k) {
  bin_factorial(n) / (bin_factorial(k)*(bin_factorial(n-k)))
}
# test function 
bin_combinations(n = 5, k = 2) 
bin_combinations(10, 3) 
bin_combinations(4, 4)




# function 'bin_probability()'
#' @title probability
#' @description computing probability
#' @param len input (numeric)
#' @return output (numeric)
bin_probability <- function(trials, success, prob) {
  if ((is_nonneg_integer(trials)==FALSE) | (is_nonneg_integer(success)==FALSE)) {
    stop('input for trials and success must be nonnegative integers')
  } else if (is_probability(prob)==FALSE) {
    stop('input for prob must be a number between 0 and 1')
  } else {
    p <- bin_combinations(trials, success)*((prob)^(success))*((1-prob)^(trials-success))
    return (p)
  }
}
# test function
bin_probability(trials = 5, success = 2, prob = 0.5)
bin_probability(6,3,0.7)


# function 'bin_distribution()'
#' @title distribution
#' @description creating probability distribution table
#' @param len input (numeric)
#' @return output (data frame)
bin_distribution <- function(trials, prob) {
  bin_dist <- rep(0,trials+1)
  for(i in 0:trials) {
    bin_dist[i+1] <- bin_probability(trials, i, prob)
  }
  return (data.frame(success=0:i,probability=bin_dist))
}
# test function
bin_distribution(5,0.5)








