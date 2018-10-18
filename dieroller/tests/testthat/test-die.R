context("Check die arguments")

test_that("check_sides fails with invalid lengths", {

  expect_error(check_sides(c('one', 'two', 'three')))
  expect_error(check_sides(c('one')))
  expect_error(check_sides(1:5))
  expect_error(check_sides(1))
})

test_that("check_prob fails with invalid lengths", {

  expect_error(check_prob(c(1:5)))
  expect_error(check_prob(c(0.5, 0.1, 0.1)))
})

test_that("check_prob fails when sum does not add up to 1", {

  expect_error(check_prob(c(0.5, 0.5, 1, 0, 0)))
  expect_error(check_prob(c(0.1, 0.5, 0, 0, 0)))
})

test_that("die input consists of two vectors, each of length 6 and passed the check_side and check_prob tests", {

  expect_is(die(sides = c('i', 'ii', 'iii', 'iv', 'v', 'vi'),
                  prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)), 'die')
  expect_type(die(sides = c(1, 3, 5, 7, 9, 11),
                  prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)), 'list')
  expect_named(die(sides = c(1, 3, 5, 7, 9, 11),
                  prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)), c('sides', 'prob'))
})

test_that("die fails when input vector is not of length 6", {

  expect_error(die(sides = c('a', 'b', 'c', 'd', 'e')))
  expect_error(die(sides = c('a', 'b', 'c', 'd', 'e', 'f'), prob = c(0.2, 0.1, 0.1, 0.1, 0.5, 0.1)))
})

