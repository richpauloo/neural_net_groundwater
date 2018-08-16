library(raster)
library(readr)
library(dplyr)

# read in shapefile
s <- raster::shapefile("/Users/richpauloo/Documents/GitHub/neural_net_groundwater/shp/cv_wells.shp")

# extract data, remove categorical geology, write to csv
s@data %>% 
  select(-geo) %>% 
  write_csv("/Users/richpauloo/Desktop/aakash/cv_wells.csv")

# prepare data for neural net
df <- read_csv("/Users/richpauloo/Documents/GitHub/neural_net_groundwater/cv_wells.csv")

# separate dry and non dry wells
dry <- df %>% dplyr::filter(dry == 1) # 2,059
wet <- df %>% dplyr::filter(dry == 0) # 34,572

# sample for equal size train and test sets
set.seed(345678424)
i <- sample(1:nrow(dry), floor(.8*nrow(dry)), replace = FALSE)
dry_train <- dry[i, ]
dry_test  <- dry[-i, ]

j <- sample(1:nrow(wet), floor(.8*nrow(dry)), replace = FALSE)
wet_train <- wet[j, ]
wet_test  <- wet[-j, ] %>% sample_n(nrow(dry_test))

# bind train and test sets
train <- cbind.data.frame(dry_train, wet_train)
test  <- cbind.data.frame(dry_test, wet_test)

# write
data <- "/Users/richpauloo/Documents/GitHub/neural_net_groundwater/data/"
train %>% write_csv(paste0(data, "train.csv"))
test  %>% write_csv(paste0(data, "test.csv"))
