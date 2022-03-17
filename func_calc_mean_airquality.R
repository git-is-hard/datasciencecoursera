col_mean <- function(x, remove_NA = TRUE){
  #find the total column
  nc <- ncol(x)
  #create a vector 0 with 6 col
  means <- numeric(nc)
  for (i in 1:ncol(x)){
    # store [i] col mean to [i] means.
    means [i] <- mean(x[, i], na.rm = remove_NA)
  }
  means
}
col_mean2 <- function(x){
              means <- c(1:ncol(x))
              for (i in 1:ncol(x)){
                      means[i] <- mean(x[, i])
              }
              means
}