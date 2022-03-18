corr <- function(directory, threshold = 0) {
  setwd("~/r_project/coursera_course/datasciencecoursera")
  loadComplete <- complete(directory)
  checkID <- loadComplete[loadComplete$nobs>threshold, ]
  corDATA = c()
  for (case in checkID$id){
      loadedCSV <- read.csv(paste(sprintf("%03d",case),".csv", sep = ""))
      cleanNA_sulfate <- loadedCSV[(!is.na(loadedCSV$sulfate)),]
      cleanDATA <- cleanNA_sulfate[(!is.na(cleanNA_sulfate$nitrate)),]
      dataSulfate = cleanDATA["sulfate"]
      dataNitrate = cleanDATA["nitrate"]
      corDATA = c(corDATA, cor(dataSulfate, dataNitrate))
  }
corDATA
}