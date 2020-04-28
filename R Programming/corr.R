corr <- function(directory, threshold = 0){
  setwd("/study zone/Coursera/R Programming/Course Materials")
  co <- NULL
  
  for (i in 1:332) {
    if (i<10){
      path <- paste(directory, "/", "0", "0", as.character(i), ".csv", sep = "")
    }
    
    else if (i >= 10 & i < 100){
      path <- paste(directory, "/", "0", as.character(i), ".csv", sep = "")
    }
    
    else if (i>=100){
      path <- paste(directory, "/", as.character(i), ".csv", sep = "")
    }
  
    data <- read.csv(path)
    data_no_na <- na.omit(data)   
    if (nrow(data_no_na) > threshold){co = c(co, cor(data_no_na[,2], data_no_na[,3]))}
  }
  co
  
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
