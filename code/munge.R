library(raster)
library(readr)
library(dplyr)

# read in shapefile
s <- raster::shapefile("/Users/richpauloo/Desktop/aakash/cv_wells.shp")

# extract data, remove categorical geology, write to csv
s@data %>% 
  select(-geo) %>% 
  write_csv("/Users/richpauloo/Desktop/aakash/cv_wells.csv")
