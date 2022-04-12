rankhospital <- function(state, outcome, num = "best"){
  data <- read.csv("outcome-of-care-measures.csv")
  valid_outcome <- list("heart attack", "heart failure", "pneumonia")
  if (state %in% data[7][[1]] == FALSE){print("Invalid state")}
  else if (outcome %in% valid_outcome == FALSE){print("invalid outcome")}
  dt_state <- subset(data, data[7] == state)
  if (outcome == valid_outcome[1]){
    dt_state_oc <- subset(dt_state, dt_state[11] != "Not Available")
    sb_oc_name <- dt_state_oc[order(dt_state_oc[11], dt_state_oc[2]), ]
    short_result <- sb_oc_name[c(2, 11)]  
  }
  else if (outcome == valid_outcome[2]){
    dt_state_oc <- subset(dt_state, dt_state[17] != "Not Available")
    sb_oc_name <- dt_state_oc[order(dt_state_oc[17], dt_state_oc[2]), ]
    short_result <- sb_oc_name[c(2, 17)]
  }
  if (outcome == valid_outcome[3]){
    dt_state_oc <- subset(dt_state, dt_state[23] != "Not Available")
    sb_oc_name <- dt_state_oc[order(dt_state_oc[23], dt_state_oc[2]), ]
    short_result <- sb_oc_name[c(2, 23)]
  }
  
  new_col <- as.numeric(unlist(short_result[2]))
  new_df <- data.frame(short_result, Death2 = new_col)
  sort_df <- new_df[order(new_df[3]),]
  if (num == "best"){num <- 1
    print(sort_df[num, 1])
  }
  else if (num == "worst"){ num <- dim(short_result)[1]
    print(sort_df[num, 1])}
  else {
    print(sort_df[num, 1])
  }
  
}