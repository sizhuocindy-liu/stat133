context("Check roll arguments")

test_that("check_times fails when input is a decimal", {

  expect_error(check_times(1.5))
  expect_error(check_times(5.2))
})

test_that("check_times fails when input is negative", {

  expect_error(check_times(-10))
  expect_error(check_times(-5))
})

test_that("roll input consists of two vectors and each passed the die and check_times tests", {

  expect_type(roll(die(
    sides = c('a', 'b', 'c', 'd', 'e', 'f'),
    prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)),
    times = 20), 'list')
  expect_is(roll(die(
    sides = c('a', 'b', 'c', 'd', 'e', 'f'),
    prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)),
    times = 20), 'roll')
  expect_named(roll(die(
    sides = c('a', 'b', 'c', 'd', 'e', 'f'),
    prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)),
    times = 20), c('rolls', 'sides', 'prob', 'total'))
})

test_that("roll fails when times is not a positive integer", {

  expect_error(roll(die(
    sides = c('a', 'b', 'c', 'd', 'e', 'f'),
    prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)),
    times = 20.5))
  expect_error(roll(die(
    sides = c('a', 'b', 'c', 'd', 'e', 'f'),
    prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)),
    times = -10))
  expect_error(roll(die(
    sides = c('a', 'b', 'c', 'd', 'e', 'f'),
    prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)),
    times = -0.5))
})








