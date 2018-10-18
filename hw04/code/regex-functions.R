# ---
# title: Regex Functions
# author: Sizhuo(Cindy) Liu
# description: creating regex functions
# outputs: regex-functions.R
# ---

library(stringr)

# 2) Regex Functions
# 2.1) Splitting Characters

# Write a function split_chars()
#' @title split_chars()
#' @description split the content of a string into individual characters
#' @param len character string
#' @return single character elements
split_chars <- function(x) {
  str_split(x, pattern = '')
}

# test function
split_chars('Go Bears!')
split_chars('Expecto Patronum')

# 2.2) Number of Vowels

# Write a function num_vowels()
#' @title num_vowels()
#' @description count the number of vowels in a given character vector
#' @param len character vector with single character elements
#' @return table summarizing the number of each vowels
num_vowels <- function(x) {
  a <- length(which(str_detect(x, 'a') == TRUE))
  e <- length(which(str_detect(x, 'e') == TRUE))
  i <- length(which(str_detect(x, 'i') == TRUE))
  o <- length(which(str_detect(x, 'o') == TRUE))
  u <- length(which(str_detect(x, 'u') == TRUE))
  cbind(a,e,i,o,u)
}

vec <- c('G', 'o', ' ', 'B', 'e', 'a', 'r', 's', '!') 
num_vowels(vec)

# 2.3) Counting Vowels

# Write a function count_vowels()
#' @title count_vowels()
#' @description count the number of vowels in a given character string
#' @param len character string
#' @return table summarizing the number of each vowels in the given character string
count_vowels <- function(x) {
  num_vowels(unlist(split_chars(str_to_lower(x))))
}

count_vowels("The quick brown fox jumps over the lazy dog")
count_vowels("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")

# 2.4) Reversing Characters

# Write a function reverse_chars()
#' @title reverse_chars()
#' @description reverse a string by characters 
#' @param len character vector
#' @return character vector with the reversed characters
reverse_chars <- function(x) {
  paste(rev(unlist(split_chars(x))), collapse = '')
}

reverse_chars('gattaca')
reverse_chars("Lumox Maxima")
# use sep = '' when combining different vectors; use collapse = '' when combining different elements within one single vector

# 2.5) Reversing Sentences By Words

# Write a function reverse_words()
#' @title reverse_words()
#' @description reverse a string by words
#' @param len character string
#' @return character string reversed by words
reverse_words <- function(x) {
  paste(rev(unlist(strsplit(x, ' '))), collapse = ' ')
}

reverse_words("sentence! this reverse")
reverse_words("string")














