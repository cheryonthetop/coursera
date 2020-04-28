## The function reads the outcome-of-care-measures.csv file and returns a character vector
## with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the 
## specified outcome in that state

best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv")
  
  ## Check that state and outcome are valid
  if (!(state %in% unique(data$State))) {
    stop("Invalid state")
  }
  if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
    stop("Invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
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
  
  na.omit(outcome_Hname)
  outcome_Hname <- transform.data.frame(outcome_Hname, Deaths = as.numeric(as.character(Deaths)))
  sorted <- outcome_Hname[order(outcome_Hname[,2], outcome_Hname[,1]),]
  sorted$Hospital.Name[[1]]
  
}


#Test Cases:
##best("TX", "heart attack")
##best("TX", "heart failure")
##best("MD", "heart attack")
##best("MD", "pneumonia")
##best("BB", "heart attack")
##best("NY", "hert attack")