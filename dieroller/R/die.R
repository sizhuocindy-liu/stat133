#' @title die()
#' @description object 'die'
#' @param sides vector of six elements, by default numbers 1, 2, 3, 4, 5, 6
#' @param prob vector of probabilities for each side (all equal to 1/6 by default)
#' @return data frame
#' # default call: creates a standard fair die
#' fair_die <- die()
#' # die with non-standard sides
#' weird_die <- die(sides = c('i', 'ii', 'iii', 'iv', 'v', 'vi'))
#' # create a loaded die
#' loaded_die <- die(prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))

#' @export
die <- function(sides = c(1,2,3,4,5,6), prob = rep(1/6, 6)) {
  check_sides(sides)
  check_prob(prob)
  table <- data.frame(sides, prob)
  class(table) <- 'die'
  table
}

# private function to check the validity of vector of sides
check_sides <- function(x) {
  if (length(x) != 6) {
    stop ('sides must be a vector of length 6')
  }
}

# private function to check the validity of probability input
check_prob <- function(x) {
  if (sum(x) != 1) {
    stop ('elements in prob must add up to 1')
  }
}

#' @export
print.die <- function(x, ...) {
  cat('object "die"\n')
  print(data.frame(side = x$side, prob= x$prob))
  invisible(x)
}
