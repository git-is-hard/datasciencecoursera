rankall <- function(outcome, num = "best"){
  df <- read.csv("outcome-of-care-measures.csv")
  death_df <- subset(df, select = -c(1,3:6,8:10,12:16, 18:22, 24:46))
  filter_df <- subset(death_df, death_df[3:5] != "Not Available")
  ha_col <- as.numeric(unlist(filter_df[3]))
  hf_col <- as.numeric(unlist(filter_df[4]))
  p_col <- as.numeric(unlist(filter_df[5]))
  new_df <- data.frame(filter_df[1:2], ha = ha_col, hf = hf_col, p = p_col)
  new_df<- subset(new_df, new_df[2] != is.na(new_df[2]))
  df_ha_sort <- new_df[order(new_df[3]),]
  df_hf_sort <- new_df[order(new_df[4]),]
  df_p_sort <- new_df[order(new_df[5]),]
}