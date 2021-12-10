# Week 1
## Data Type - Factors
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
x

## Data Type - Missing Values
is.na(x)
is.nan(x)

x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)

## Data Type - Data Frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
nrow(x)
ncol(x)

## Data Type - Names Attribute
x <- 1:3
names(x)
names(x) <- c("foo", "bar","nofr")
x
names(x)
#list
x <- list(a = 1, b = 2, c =3)
x
#matrices
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

## Reading Tabular
?read.table

## Reading Large Tables
initial <- read.table("hw1_data.csv")
classes <- sapply(initial, class)
tabALL <- read.table("hw1_data.csv",
                     colClasses = classes)
hw <- read.csv("hw1_data.csv")
is.na(hw)
class(hw)
names(hw)

## Textual Formarts
y <- data.frame(a = 1, b = "a")
dput(y)

dput(y, file = "y.R")
new.y <- dget("y.R")
new.y
#Creo las variables y luego la dropio, incluso las removio#
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R")
rm(x,y)
source("data.R")
y
x

## Conntections: Interfaces to the Outside World ##
str(file)
##This might take time 
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)

## Subsetting - Basicas ##
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[x>"a"]
u <- x > "a"
u
x[u]

## Subsetting List ##
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]
x[c(1,3)]

name <- "foo"
x[[name]] ##computed index for foo
x$name ## element 'name' doesn't exist
x$foo

x<- list(a = list(10, 12, 14), b= c(3.14, 2.81))
x[[c(1,3)]]

## Subestting - Matrices ##
x <- matrix(1:6, 2, 3)
x[1, 2]
x[2,1]
x[1, 2, drop = FALSE]

x[1, ]
x[1, drop = FALSE]


## Subestting with Partial Matching ##
x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact = FALSE]]

## Subsetting Removing Missing Values ##
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]

## Vectorized Operations ##
x <- 1:4; y <- 6:9
x+y
x>2
x >= 2
y ==8
x *y 
x/y

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x * y ## element-wise multiplication 
x/y
x %*% y ## true matrix multiplication
