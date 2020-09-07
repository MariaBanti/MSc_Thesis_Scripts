library(raster) 
library(rgdal) 
library(MODIStsp) 
library(xml2)

#Download daily MODIS NDVI .tif file from MODIStsp
MODIStsp()

setwd("D:/R/Thesis/Maps/NDVI/01Jan2017_VI_16Days_1Km_v6/NDVI")
library(stringr)

rlist=list.files(getwd(), pattern=".tif", full.names=FALSE)

for(i in rlist) { 
  assign(unlist(strsplit(i, ".tif")), raster(i)) #Creates raster
} 

a<-stack(rlist) 
a<-a*0.0001

#Save raster
writeRaster(a,"D:\\R\\Thesis\\Maps\\NDVI\\01Jan2017_VI_16Days_1Km_v6\\NDVI_01Jan2017.tif")