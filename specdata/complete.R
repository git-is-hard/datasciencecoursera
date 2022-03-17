complete <- function(directory, id = 1: 332){
  y = c()

  setwd("~/r_project/coursera_course/datasciencecoursera")
  setwd(directory)
  
  #get all csv file name in the folder
  fileName <- dir()
  
  #load csv file that need to open
  loadedCSV <- lapply(fileName[id], read.csv)

  for (i in c(1:(sum(!is.na(id))))){smallY = sum(!is.na(loadedCSV[i][[1]]$sulfate))
    y[i] <- smallY
    }
  df <- data.frame("id" = c(id), "nobs" = y  )
df}


