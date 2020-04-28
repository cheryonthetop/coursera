## The function reads the outcome-of-care-measures.csv file and returns 
## a character vector with the name of the hospital that has the ranking 
## specified by the num argument. 

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv")
  
  ## Check that state and outcome are valid
  if (!(state %in% unique(data$State))) {
    stop("Invalid state")
  }
  if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
    stop("Invalid outcome")
  }
  if (typeof(num) == "double" && num > nrow(data)){return("NA")}
  
  ## Return hospital name in that state with the given rank 30-day death rate
  state_data <- data[data$State == state,]
  
  if (outcome == "heart attack") {
    outcome_Hname <- data.frame(Hospital.Names = state_data$Hospital.Name , Deaths = state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
  }
  
  if (outcome == "heart failure") {
    outcome_Hname <- data.frame(Hospital.Names = state_data$Hospital.Name , Deaths = state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
  }
  
  if (outcome == "pneumonia") {
    outcome_Hname <- data.frame(Hospital.Names = state_data$Hospital.Name , Deaths = state_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
  }
  
  
  outcome_Hname <- transform.data.frame(outcome_Hname, Deaths = as.numeric(as.character(Deaths)))
  sorted <- outcome_Hname[order(outcome_Hname[,2], outcome_Hname[,1]),]
  sorted <- na.omit(sorted)
  
  if (num == "best"){return(sorted$Hospital.Names[1])}
  if (num == "worst"){return(sorted$Hospital.Names[nrow(sorted)])}
  
  
  sorted$Hospital.Names[num]
  
}

## Test cases:
##rankhospital("TX", "heart failure", 4)
##rankhospital("MD", "heart attack", "worst")
##rankhospital("MN", "heart attack", 5000)