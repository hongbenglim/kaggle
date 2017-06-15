<<<<<<< HEAD
setwd("~/U Iowa/kaggle")

train <- read.csv("train.csv", header = TRUE)
test  <- read.csv( "test.csv", header = TRUE)
macro <- read.csv("macro.csv", header = TRUE)

missingstrain <- data.frame(vars = names(train), missings = rep(NA, ncol(train)))
for(i in 1:ncol(train)){
    missingstrain$missings[i] <- sum(is.na(train[, i]))
}

missingstest <- data.frame(vars = names(test), missings = rep(NA, ncol(test)))
for(i in 1:ncol(test)){
    missingstest$missings[i] <- sum(is.na(test[, i]))
}
=======
library(tidyverse)
>>>>>>> 12b359f64faedbaaa57530e1a1fda9489ed3fd4a

# Read data
# train - 30471 obs. of 292 variable
# test  -  7662 obs. of 292 variable
# macro -  2484 obs. of 100 variable
train <- read.csv("train.csv", header = TRUE) %>% as_tibble()
test  <- read.csv( "test.csv", header = TRUE) %>% as_tibble()
macro <- read.csv("macro.csv", header = TRUE) %>% as_tibble()

# Count NA for each data set
countNA <- function(df_col){sum(is.na(df_col))}
missings_train <- map_int(train, countNA)
missings_test  <- map_int(test, countNA)
missings_macro <- map_int(macro, countNA)
