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

missingsmacro <- data.frame(vars = names(macro), missings = rep(NA, ncol(macro)))
for(i in 1:ncol(macro)){
    missingsmacro$missings[i] <- sum(is.na(macro[, i]))
}
