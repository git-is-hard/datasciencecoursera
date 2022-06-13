best <- function( state, outcome){
  #read data
  df <- read.csv("outcome-of-care-measures.csv")[c(2,7,11,17,23)]
  #check if outcome is valid
  if (!(outcome == "heart failure" || outcome == "heart attack" || outcome == "pneumonia"))
  {stop("Invalid outcome.")}
  #check if state is valid
  if ((state %in% unique(df[,2])) == FALSE){stop("Invalid state")}
  #install library
  library(dplyr)
  #filter by state
  state_df <- df %>% filter(State == state)
  #filter by outcome
  if (outcome == "heart attack"){state_df <- state_df[c(1,2,3)]}
  if (outcome == "heart failure"){state_df <- state_df[c(1,2,4)]}
  if (outcome == "pneumonia"){state_df <- state_df[c(1,2,5)]}
  #change col name
  names(state_df)[3] <- "Death"
  
  state_df$Death <- suppressWarnings(as.numeric(state_df$Death))
  state_df <- state_df %>% filter(Death != is.na(state_df$Death))
  sort_df <- state_df %>% arrange((desc(Death)))
  sort_df[sort_df$Death == min(sort_df$Death), 1]
}