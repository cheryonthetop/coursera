## Q1
baseline <- c(140,138,150,148,135)
week2 <- c(132, 135, 151, 146, 130)
t.test(week2-baseline)

## Q2
q <- qt(.975, 8)
s <- 30 / sqrt(9)
1100 + c(-1,1)*q*s

## Q3
?binom.test
binom.test(3, 4, 0.5, alternative = "greater")

## Q4
binom.test(10, 1787, 0.01, alternative = "less")

## Q5
?pt
n_y <- 9 # subjects treated
n_x <- 9 # subjects placebo
??_y <- 1.5# kg/m2 std.dev. treated 
??_x <- 1.8# kg/m2 std.dev. placebo 
??_y <- -3#  kg/m2 average difference treated
??_x <- 1#  kg/m2 average difference placebo

# calculate pooled standard deviation
??_p <- (((n_x - 1) * ??_x^2 + (n_y - 1) * ??_y^2)/(n_x + n_y - 2))
pval <- pt((??_y - ??_x) / (??_p * (1 / n_x + 1 / n_y)^.5), df=n_y + n_x -2)
pval

## Q7
?power.t.test
power.t.test(n = 100, delta = 0.01, sd = 0.04, sig.level = .05, type = "one.sample", alternative = "one.sided")$power

## Q8
power.t.test(power = .9, delta = 0.01, sd = 0.04, sig.level = .05, type = "one.sample", alternative = "one.sided")$n

