library(raster) 
library(rhdf5) 
library(smapr) 
library(stringr)

#Login in NASA's Earthdata portal
Sys.setenv(ed_un = '<username>', ed_pw = '<password>')

#Set Date Sequence
start_date <-as.Date("2017-01-08") 
end_date <-as.Date("2017-01-08")
date_sequence <-seq(start_date,end_date,by=1)

#View Available Data, Product ID = SPL3SMP
available_data <-find_smap(id="SPL3SMP",dates=date_sequence,version = 5)

#Data Download
data_download <-download_smap(available_data, directory='<set directory>',overwrite=FALSE)

#Define Region of Interest 
c1<-cbind(22.770,41.744) 
c2<-cbind(26.639,41.744) 
c3<-cbind(26.639,39.905) 
c4<-cbind(22.770,39.905)

#Creation of Spatial Polygon 
r1 <- rbind(c1,c2,c3,c4) 
P1 <- Polygon(r1)
Ps1 <- Polygons(list(P1), ID="3") 
SPs <- SpatialPolygons(list(Ps1))
df <- data.frame(N="zona", row.names="3") 
SPDF <- SpatialPolygonsDataFrame(SPs, data=df)
proj4string(SPDF) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")

#Extract datasets/the appropriate layer from SMAP data files (in this case the one referring to passive soil moisture)
sm_raster <-extract_smap(data_download,'Soil_Moisture_Retrieval_Data_ PM/soil_moisture_pm')

#Reprojection and Cropping based on the region's of interest Spatial Polygon
new.crs <- proj4string(SPDF)
sm_rep <- projectRaster(sm_raster, crs = new.crs)
sm.crop<- crop(sm_rep,SPDF) 

#Save raster as .tif
writeRaster(sm.crop,"D:\\R\\Thesis\\Maps\\SMAP\\08Jan2017\\SMAP_08Jan 2017.tif")


