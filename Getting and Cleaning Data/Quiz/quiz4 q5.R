library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
amzn
sampleTimes

library(lubridate)
in_2012 <- sampleTimes[year(ymd(sampleTimes)) == 2012]
in_2012
on_monday <- in_2012[wday(in_2012, label = TRUE) == "Mon"]
on_monday
length(in_2012)
length(on_monday)
