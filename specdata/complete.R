complete <- function(directory, id = 1:332) {
  mylist <- list.files("/Users/jesusortiz/Documents/RStudio Projects/R-Programming-Coursera-/specdata", pattern = ".csv", full.names = TRUE)
  nobs <- numeric()
  for(i in id) {
    mydata <- read.csv(mylist[i])
    mysum <- sum(complete.cases(mydata))
    nobs <- c(nobs, mysum)
  }
  data.frame(id, nobs)
}

source("complete.R")
complete("/Users/jesusortiz/Documents/RStudio Projects/R-Programming-Coursera-/specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
