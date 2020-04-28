pollutantmean <- function(directory, pollutant, id = 1:332){
  number_of_data_points <- 0
  total <- 0
  setwd("/study zone/Coursera/R Programming/Course Materials")
  
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
    number_of_data_points <- number_of_data_points + nrow(data_no_na)
    
    if (pollutant == "sulfate"){total <- total + sum(data_no_na$sulfate)}
    else {total <- total + sum(data_no_na$nitrate)}
  }
  total / number_of_data_points
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
