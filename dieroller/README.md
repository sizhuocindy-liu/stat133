
<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

`"dieroller"` is a minimal [R](http://www.r-project.org/) package that provides functions to simulate rolling a die.

-   `die()` creates a die object (of class `"die"`)
-   `roll()` tosses a coin object, producing a `"roll"` object.
-   `plot()` method for a `"roll"` object to plot frequencies of heads.
-   `summary()` method for a `"roll"` object.

Motivation
----------

This package has been developed to illustrate some of the concepts behind the creation of an R package.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "cointoss" (without vignettes)
devtools::install_github("gastonstat/cointoss")

# install "cointoss" (with vignettes)
devtools::install_github("gastonstat/cointoss", build_vignettes = TRUE)
```

Usage
-----

``` r
library(dieroller)
#> 
#> Attaching package: 'dieroller'
#> The following object is masked from 'package:graphics':
#> 
#>     plot

# default die
die1 <- die()
#> object "die"
#>   side      prob
#> 1    1 0.1666667
#> 2    2 0.1666667
#> 3    3 0.1666667
#> 4    4 0.1666667
#> 5    5 0.1666667
#> 6    6 0.1666667
die1
#> object "die"
#>   side      prob
#> 1    1 0.1666667
#> 2    2 0.1666667
#> 3    3 0.1666667
#> 4    4 0.1666667
#> 5    5 0.1666667
#> 6    6 0.1666667

# 1 toss of coin1
roll(die1)
#> object "roll"
#> [[1]]
#> [1] 6

# 20 tosses of coin1
roll20 <- roll(die1, times = 20)
#> object "roll"
#> [[1]]
#>  [1] 6 4 1 4 1 2 2 1 2 5 1 6 6 6 3 3 5 4 5 4
roll20
#> object "roll"
#> [[1]]
#>  [1] 6 4 1 4 1 2 2 1 2 5 1 6 6 6 3 3 5 4 5 4

# summary
summary(roll20)
#> summary "roll"
#> 
#>   side count prop
#> 1    1     4 0.20
#> 2    2     3 0.15
#> 3    3     2 0.10
#> 4    4     4 0.20
#> 5    5     3 0.15
#> 6    6     4 0.20


# 100 tosses
roll100 <- roll(die1, times = 100)
#> object "roll"
#> [[1]]
#>   [1] 1 3 1 3 5 1 6 5 6 5 6 4 3 3 4 2 2 1 3 3 2 2 5 6 6 5 4 2 3 4 3 1 2 4 3
#>  [36] 3 3 5 1 3 4 3 4 6 5 6 2 6 4 3 4 3 4 2 5 4 1 4 5 3 2 6 1 3 6 3 3 3 6 4
#>  [71] 1 3 5 5 2 3 6 1 3 5 5 3 4 4 2 5 2 5 4 5 3 3 5 6 5 1 5 5 1 6

# summary
summary(roll100)
#> summary "roll"
#> 
#>   side count prop
#> 1    1    12 0.12
#> 2    2    12 0.12
#> 3    3    26 0.26
#> 4    4    16 0.16
#> 5    5    20 0.20
#> 6    6    14 0.14
```
