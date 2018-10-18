report
================
Sizhuo (Cindy) Liu
April 23, 2018

``` r
library(dieroller)
```

    ## 
    ## Attaching package: 'dieroller'

    ## The following object is masked from 'package:graphics':
    ## 
    ##     plot

### De Mere's Problem

#### Problem 1

``` r
# simulate one series of 1000 games of this game-I.
repetitions <- 1000
fair_1000die <- matrix(NA, nrow = 1000, ncol = 4)
fair_die <- die()
for (i in 1:repetitions) {
  fair_1000die[i,] <- roll(fair_die, times = 4)$roll
}

# count the number of games in which there is at least one 6
df_fair_1000die <- data.frame(fair_1000die)
df_fair_1000die$num_six <- rowSums(df_fair_1000die == 6)
count <- nrow(df_fair_1000die[df_fair_1000die[,5] >=1,]) 
count # count
```

    ## [1] 538

``` r
# compute the relative frequency of getting at least one “6” (this will be the approximate probability)
relative_freq <- count / nrow(df_fair_1000die)
relative_freq # relative frequency
```

    ## [1] 0.538

``` r
actual_prob <- 1-(5/6)^4
actual_prob # check
```

    ## [1] 0.5177469

#### Problem 2

``` r
library(stringr)
# simulate one series of 1000 games of this game-II.
fair_1000die2 <- matrix(NA, nrow = 24000, ncol = 2)
fair_die1 <- die() 
fair_die2 <- die()
for (i in 1:24000) {
  fair_1000die2[i,1] <- roll(fair_die1, times = 1)$roll
  fair_1000die2[i,2] <- roll(fair_die2, times = 1)$roll
}

# count the number of games in which there is at least one double 6
df_fair_1000die2 <- data.frame(fair_1000die2)
df_fair_1000die2$num_six <- rowSums(df_fair_1000die2 == 6)
dat <- c()
for (i in 1:24000) {
  dat[i] <- as.numeric(df_fair_1000die2[i,]$num_six==2)
}
dat <-as.character(dat) # outcome of each roll (of pair of die): 1 indicates a double six 
positions <- str_which(dat, '1') # positions of rolls that have a double six
games <- unique(ceiling(positions/24)) # games where there is a double six 
count2 <- length(games) # number of games that have at least a double six

# compute the relative frequency of getting at least one “6” (this will be the approximate probability)
relative_freq2 <- count2 / 1000
relative_freq2 # relative frequency
```

    ## [1] 0.494

``` r
actual_prob <- 1-(35/36)^24
actual_prob # check
```

    ## [1] 0.4914039
