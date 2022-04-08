best <- function(state, outcome){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  std_outcome <- list("heart attack", "heart failure", "pneumonia")
  if (state %in% data[7][[1]] == FALSE){print("Invalid state")}
  else if (outcome %in% std_outcome == FALSE){print("Invalid outcome")}
  df_state <- subset(data, data[7] == state)
  if (outcome == std_outcome[1]){
      df_state_outcome <- subset(df_state, df_state[11] != "Not Available")
      list_num_outcome <- as.numeric(unlist(df_state_outcome[11]))
      df_best <- subset(df_state_outcome, df_state_outcome[11] == sprintf("%1.1f",min(list_num_outcome)))}
  else if (outcome == std_outcome[2]){
      df_state_outcome <- subset(df_state, df_state[17] != "Not Available")
      list_num_outcome <- as.numeric(unlist(df_state_outcome[17]))
      df_best <- subset(df_state_outcome, df_state_outcome[17] == sprintf("%1.1f",min(list_num_outcome)))}
  else if (outcome == std_outcome[3]){
      df_state_outcome <- subset(df_state, df_state[23] != "Not Available")
      list_num_outcome <- as.numeric(unlist(df_state_outcome[23]))
      df_best <- subset(df_state_outcome, df_state_outcome[23] == sprintf("%1.1f",min(list_num_outcome)))}
    
df_best <- df_best[order(df_best[2]), ]
df_best[1,2]
}