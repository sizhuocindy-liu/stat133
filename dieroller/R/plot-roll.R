#' @title plot.roll()
#' @description plot the frequencies of rolls
#' @param x a vector that is the output of the roll() function
#' @return bar plot

#' # create a die and roll it 50 times
#' fair_die <- die()
#' fair_50rolls <- roll(fair_die, times = 50)
#'
#' plot(fair_50rolls)

#' @export
plot <- function(x, times =50) {
  library(stringr)
  barplot(height = summary(x)$freqs$prop,
          xlab = 'sides of die',
          ylab = 'relative frequencies',
          main = str_replace('Frequencies in a Series of 50 Die Rolls', '50', as.character(times))
  )
}


