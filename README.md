# README  

`cv_wells.csv` is a tabular data frame with all the attribute data necessary to run ML models to predict the `dry` column. Plot `shp/cv_wells.shp` if you want to visualize the locations of the data and the spatial dependence of well failure.  

In the csv, the first column, `name`, is the unique ID of the well. There are no duplicate well entries.  

The second column, `dry` is the binary response variable. `1` indicates a dry well, and `0` indicates a non-dry well.  

The remaining columns are geologic and bioclimatic variables from the USGS and WorldClim extracted from rasters to the spatial points.  

That leaves, for the model specification:  

$dry ~ hyd_cond + tmin1...tmin12 + tmax1...tmax12 + prec1...prec12 + bio1...bio12$   

