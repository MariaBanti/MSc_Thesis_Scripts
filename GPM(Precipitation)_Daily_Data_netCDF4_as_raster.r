library(ncdf4) 
library(rgdal) 
library(raster)

setwd("<directory>")

#Read the data into a data structure. Print the metadata about this file to a text file.
nc_data <- nc_open('3B-DAY.MS.MRG.3IMERG.20170108-S000000-E235959.V05.nc4')

{
  sink('GPM_IMERG_08Jan2017_metadata.txt')
  print(nc_data)
  sink()
}
nc_data

#Show the data attributes for the file
attributes(nc_data$var)

#Read the latitude and longitude of each precipitation observation 
lon <- ncvar_get(nc_data, "lon")
lat <- ncvar_get(nc_data, "lat", verbose = F)

#Get data for a variable 
precip.array <- ncvar_get(nc_data, "precipitationCal") #or: dat_precip<-ncvar_get(nc_data,attributes(nc_data$var)$names[1])

#Which fill value is used for missing data? 
fillvalue <- ncatt_get(nc_data, "precipitationCal", "_FillValue")

#Close connection with the netCDF file 
nc_close(nc_data) 

r <- raster(precip.array, xmn=min(lon), xmx=max(lon), ymn=min(lat), ymx=max(lat), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))

plot(r)

#Save Raster of Daily Global Precipitation Data 
writeRaster(r,"D:\\R\\Thesis\\Maps\\Precip\\08Jan2017\\Precip_08Jan2017.tif")


#Crop according to the Region of Interest
el<- extent(22.770,26.639,39.905,41.744)
r_cropped<-crop(r,el)

#Save cropped raster
writeRaster(r_cropped,"D:\\R\\Thesis\\Maps\\Precip\\08Jan2017\\Precip_08Jan2017_cropped.tif")

