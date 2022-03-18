complete <- function(directory, id = 1: 332){
  y = c()
  x = c()
  nobsList = c()

  setwd("~/r_project/coursera_course/datasciencecoursera")
  setwd(directory)
  
  #get all csv file name in the folder
  fileName <- dir()
  
  #load csv file that need to open
  loadedCSV <- lapply(fileName[id], read.csv)
  
  for (i in c(1:length(id))){smallY = sum(!is.na(loadedCSV[i][[1]]$sulfate))
    y[i] <- smallY
  }
  for (i in c(1:length(id))){smallX = sum(!is.na(loadedCSV[i][[1]]$nitrate))
    x[i] <- smallX
  }
  for (i in c(1:length(id))){
    if (x[i] < y[i]){
      nobsList[i] <- x[i]
    }
    if (x[i] > y[i]){
      nobsList[i] <- y[i]
    }
    if (x[i] == y[i]){
      nobsList[i] <- x[i]
    }
  }
  df <- data.frame("id" = c(1: length(id)), "nobs" = nobsList  )
df}