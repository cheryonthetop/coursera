complete <- function(directory, id = 1:332){
  setwd("/study zone/Coursera/R Programming/Course Materials")
  data_frame <- NULL

  
  for (i in id) {
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
    num_rows <- nrow(data_no_na)
    df_to_add <- data.frame(i, num_rows)
    data_frame <- rbind(data_frame, df_to_add)

  }
  data_frame <- data.frame(data_frame)
  colnames(data_frame) <- c("id","nobs")
  data_frame
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

