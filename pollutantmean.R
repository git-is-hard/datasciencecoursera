pollutantmean <- function(directory, pollutant, id = 1: 332){
                          x = 0
                          y = 0
                    setwd("~/r_project/coursera_course/datasciencecoursera")
                    setwd(directory)
  
                    #get all csv file name in the folder
                    fileName <- dir()
                    
                    #load csv file that need to open
                    loadedCSV <- lapply(fileName[id], read.csv)
                    
                    #mean = x/y
                    if (pollutant == "sulfate"){
                    #find x
                                for (i in c(1:(sum(!is.na(id))))){smallX = sum(loadedCSV[i][[1]]$sulfate[!is.na(loadedCSV[i][[1]]$sulfate)])
                    x = x + smallX
                    }
                    
                    
                    #find y
                                for (i in c(1:(sum(!is.na(id))))){smallY = sum(!is.na(loadedCSV[i][[1]]$sulfate))
                    y = y + smallY
                    }
                    }
                    if (pollutant == "nitrate"){
                      #find x
                      for (i in c(1:(sum(!is.na(id))))){smallX = sum(loadedCSV[i][[1]]$nitrate[!is.na(loadedCSV[i][[1]]$nitrate)])
                      x = x + smallX
                      }
                      
                      
                      #find y
                      for (i in c(1:(sum(!is.na(id))))){smallY = sum(!is.na(loadedCSV[i][[1]]$nitrate))
                      y = y + smallY
                      }
                    }
                    
                    
x/y}

