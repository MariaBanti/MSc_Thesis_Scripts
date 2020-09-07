library(raster)

r<-raster('SM_Real_Winter.tif')
ext<-c(22,28,40,42)

r_cropped<-crop(r, ext)

m<-rep(1,841)

#29x29 cell 
m<- matrix(m,nrow=29)

#Apply focal
r_mean<-focal(r_cropped, m, fun=mean, na.rm=TRUE)

writeRaster(r_mean,"D:\\R\\Thesis\\Maps\\Final_Soil_Moisture\\08Jan20 17\\SM_Real_Winter_Focal_29x29.tif")