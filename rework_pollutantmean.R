pollutantmean <- function(directory, pollutant, id = 1: 332){
  
  file_list <- dir(path = directory)
  dx <- c()
  for (i in id){df <- read.csv(file.path(directory,file_list[i]))
  dx <- c(dx, df[pollutant][!is.na(df[pollutant])])
  }
  mean(dx)
}