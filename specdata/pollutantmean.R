## Programming Assigment ##
data <- read.csv("001.csv", header = T)
View(data)
# Part 1
pollutantmean <-function(directory, pollutant, id = 1:332) {
  mylist <- list.files("/Users/jesusortiz/Documents/RStudio Projects/R-Programming-Coursera-/specdata", pattern = ".csv", full.names = TRUE)
  x <- numeric()
  
  for(i in id) {
    mydata <-read.csv(mylist[i])
    x <- c(x, mydata[[pollutant]])
  }
  mean(x, na.rm = TRUE)
}

# Example 1
pollutantmean("specdata", "nitrate", 23)

# Example 2
pollutantmean("specdata", "nitrate", 70:72)

# Example 3
pollutantmean("specdata", "sulfate", 1:10)

## Part 2 ##
data <- read.csv("115.csv", header = T)
View(data)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")



