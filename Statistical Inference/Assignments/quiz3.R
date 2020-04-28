# QUIZ 3
quantile = 0.95 # is 95% with 2.5% on both sides of the range

n_y <- 9 # nights new system
n_x <- 9 # nights old system
var_y <- 2.25 # variance new (sqrt of ??)
var_x <- 3.24 # variance old (sqrt of ??)
??_y <- -3# average hours new system
??_x <- 1# average hours old system

# calculate pooled standard deviation
??_p <- sqrt(((n_x - 1) * var_x + (n_y - 1) * var_y)/(n_x + n_y - 2))

confidenceInterval <- ??_y - ??_x + c(-1, 1) * qt(quantile, df=n_y+n_x-2) * ??_p * (1 / n_x + 1 / n_y)^.5
round(confidenceInterval,2)

