## Control Structures - If-else ##

if(<conditions>) {
  ## do something
} else {
  ## do something else
}
x <- 1
if(x >3) {
  y <- 10
} else {
  y <- 0
}

## Control Structures - For loops ##
'Estas tres funciones hacen lo mismo y proveen el mismo resultado'
x <- c("a", "b", "c", "d")

for(i in 1:4) {
  print(x[i])
}

for(i in seq_along(x)) {
  print(x[i])
}

for(i in 1:4) print(x[i])

x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    
  }
} 

## Control Structures - While loops ##
count <- 0
while(count < 10) {
  print(count)
  count <- count +1
}

z <- 5
while(z >= 3 && z <=10) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  
  if(coin ==1) { ## random walk
    z <- z +1
  } else {
      z <- z-1
    }
}

## Control Structures- Repeat, Next, Break ##
x0 <- 1
tol <- 1e-8

repeat {
        x1 <- computeEstimate()
        if(abs(x1 - x0) < tol) {
              break
        } else {
          x0 <- x1
        }
}

for(i in 1:100) {
  if(i <= 20) {
    ## Skip the first 20 iterations
    next
  }
}

## Your First R Function ##
add2 <- function(x, y) {
  x + y
}
add2(3, 5)

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n) {
  use <- x > n
  x[use]
}
x <- 1:20
n <- 12
above(x, n)

colummean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[ ,i], na.rm = removeNA)
  }
  means
}

colummean(airquality)

## Functions ##
f <- function(a, b = 1, c =2, d= NULL) {
  
}

f <- function(a, b) {
  print(a)
  print(b)
}
f(45)

myplot <- function(x, y, type = "1", ...) {
  plot(x, y, type = type, ...)
}
mean
function(x, ...)
UseMethod("mean")

args(paste)
function(..., sep = " ", collapse = NULL)
paste("a", "b", sep = ":")  
paste("a", "b", se = ":")  

## Scoping Rules - Symbol Biding ##
f <- function(x, y) {
  x^2 + y/z
}
