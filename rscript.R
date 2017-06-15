library(tidyverse)

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

train <- train %>% mutate_if(is.factor, as.character)
macro <- macro %>% mutate_if(is.factor, as.character)

merged_train <- left_join(train, macro, by = "timestamp")
