##The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame
##containing the hospital in each state that has the ranking specified in num.

rankall <- function(outcome, num = "best") {
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
  
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  hospitals = NULL
  states = NULL
  
  for (state in unique(data$State)){
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
  
  if (num == "best"){
    hospitals <- c(hospitals, toString(sorted$Hospital.Names[1]))
    
  }
  else if (num == "worst"){
    hospitals <- c(hospitals, toString(sorted$Hospital.Names[nrow(sorted)]))
  }
  else{
    hospitals <- c(hospitals, toString(sorted$Hospital.Names[num])) 
  }
  
  states <- c(states, state)
  # end of for loop
  }
  
  data.frame(states,hospitals)
  
}

## Test Cases
## head(rankall("heart attack", 20), 10)
## tail(rankall("pneumonia", "worst"), 3)
## tail(rankall("heart failure"), 10)
