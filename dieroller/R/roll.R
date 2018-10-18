#' @title roll()
#' @description object 'roll'
#' @param die object of class 'die'
#' @param times number of times to roll the die (default value of 1)
#' @return rolls: vector with outputs of the rolls; sides: vector with the sides of the die; prob: vector with probabilities for each side of the die
#' # roll fair die 50 times
#' fair_die <- die()
#'
#' # roll 50 times
#' fair_50rolls <- roll(fair_die, times = 50)
#' # add 10 more rolls
#' fair_60rolls <- fair_50rolls + 10

#' @export
roll <- function(die, times = 1) {
  check_times(times)
  rolls <- sample(x= die$sides, prob = die$prob, size = times, replace = TRUE)
  sides <- die$sides
  prob <- die$prob
  result <- list(
    rolls = rolls,
    sides = sides,
    prob = prob,
    total = times
  )
  class(result) <- 'roll'
  result
}

# private function for checking the validity of the times input
check_times <- function(x) {
  if (x%%1!=0 | x < 0) {
    stop ('times must be a positive integer')
  }
}

#' @title Make Roll Object
#' @description Constructor function for object "roll"
#' @param coin numeric vector
#' @param flips numeric vector
#' @keywords internal

#' @export
make_roll <- function(die, rolls) {
  res <- list(
    sides = die,
    rolls = rolls,
    total = length(rolls),
    prop = data.frame(table(rolls))$Freq / sum(data.frame(table(rolls))$Freq)
  )
  class(res) <- "roll"
  res
}

#' @export
print.roll <- function(x, ...) {
  cat('object "roll"\n')
  print(list(x$rolls))
  invisible(x)
}

#' @export
summary.roll <- function(x) {
  side <- 1:6
  count <- data.frame(table(x$rolls))$Freq
  prop <- count / sum(count)
  freq <- list(freqs = data.frame(side, count, prop))
  class(freq) <- 'summary.roll'
  return(freq)
}

#' @export
print.summary.roll <- function(x, ...) {
  cat('summary "roll"\n\n')
  print(data.frame(side = x$freq$side, count = x$freq$count, prop = x$freq$prop))
  invisible(x)
}

#' @export
"[.roll" <- function(x, i) {
  x$roll[i]
}

#' @export
"[<-.roll" <- function(x, i, value) {
  if (value != x$side[1] &
      value != x$side[2] &
      value != x$side[3] &
      value != x$side[4] &
      value != x$side[5] &
      value != x$side[6]) {
    stop('\nreplacing value must be %s or %s')
  }
  x$roll[i] <- value
  make_roll(x$sides, x$roll)
}

#' @export
"+.roll" <- function(obj, incr) {
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increment (must be positive)") }
  more_rolls <- roll(obj, times = incr)
  make_roll(obj$sides, c(obj$roll, more_rolls$roll))
}

