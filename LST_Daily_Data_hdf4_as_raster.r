library(gdalUtils) 
library(stringr) 
library(raster)

setwd("<directory>")

#View Subsets within the hdf4 MODIS LST file
sds <- get_subdatasets("MOD11A1.A2017008.h19v04.006.2017013154956.hdf ")
sds

#Get Subsets from the dataset & convert to tif 
gdal_translate(sds[1], dst_dataset = "LST_08Jan2017_Day.tif") 
gdal_translate(sds[5], dst_dataset = "LST_08Jan2017_Night.tif")