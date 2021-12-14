corr <- function(directory, threshold = 0) {
  mylist <- list.files("/Users/jesusortiz/Documents/RStudio Projects/R-Programming-Coursera-/specdata", pattern = ".csv", full.names = TRUE)
  df <- complete(directory)
  ids <-df[df["nobs"] > threshold, ]$id
  corrr <- numeric()
  for(i in ids){
    mydata <- read.csv(mylist[i])
    dff <- mydata[complete.cases(data), ]
    corrr <- c(corrr, cor(dff$sulfate, dff$nitrate))
  }
  return(corrr)
}

source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
