complete <- function(directory, id = 1:332){
  file_name <- dir(path = directory)
  nobs <- c()
  for (i in id){df <- read.csv(file.path("specdata", file_name[i]))
  good <- complete.cases(df)
  nobs <- c(nobs, dim(df[good, ])[1])
  }
  cdf <- data.frame(id, nobs )
cdf
}