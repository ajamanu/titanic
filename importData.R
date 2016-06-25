
readData <- function(fileDir, whichDataSet) {
      data <- fread(file.path(fileDir, paste0(whichDataSet, ".csv")))
      return(as.data.table(data))
}

