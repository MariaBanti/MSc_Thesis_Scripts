library(raster) 
library(rhdf5) 
library(smapr) 
library(stringr)

#Login in NASA's Earthdata portal
Sys.setenv(ed_un = '<username>', ed_pw = '<password>')

#Set Date Sequence
start_date <-as.Date("2017-01-01") 
end_date <-as.Date("2018-08-13")
date_sequence <-seq(start_date,end_date,by=1)

#View Available Data, Product ID = SPL3SMP
available_data <-find_smap(id="SPL3SMP",dates=date_sequence,version = 5)
View(available_data)

#Data Downloading
data_download <-download_smap(available_data, directory='<set directory>', overwrite=FALSE)

#Define Region of Interest - Example:Station ID=2 / Xrysopigi
c1<-cbind(23.5103,41.2105)
c2<-cbind(23.6011,41.2105)
c3<-cbind(23.6011,41.1197) 
c4<-cbind(23.5103,41.1197)

#Creation of Spatial Polygon 
r1 <- rbind(c1,c2,c3,c4) 
P1 <- Polygon(r1)
Ps1 <- Polygons(list(P1), ID="3") 
SPs <- SpatialPolygons(list(Ps1))
df <- data.frame(N="zona", row.names="3")
SPDF <- SpatialPolygonsDataFrame(SPs, data=df)
proj4string(SPDF) <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")

#Extract datasets/the appropriate layer from SMAP data files
sm_raster <-extract_smap(data_download,'Soil_Moisture_Retrieval_Data_ PM/soil_moisture_pm')

#Reprojection and Cropping based on the region's of interest Spatial Polygon
new.crs <- proj4string(SPDF)
sm_rep <- projectRaster(sm_raster, crs = new.crs)
sm.crop<- crop(sm_rep,SPDF) 
save(sm.crop,file='sm_crop_2.Rda')

#Create data frame to store soil moisture data
sm.crop.df<-as.data.frame(sm.crop) 
#Transpose data frame that results a matrix 
sm.crop.df.t=t(sm.crop.df)
#Convert the matrix into a data frame 
sm.crop.df.t.df_Station2<-as.data.frame(sm.crop.df.t)
#Give name in the first unnamed column
sm.crop.df.t.df_Station2<-cbind(rownames(sm.crop.df.t.df_Station2),sm.crop.df.t.df_Station2) 
rownames(sm.crop.df.t.df_Station2)<-NULL
colnames(sm.crop.df.t.df_Station2)<-c('Data_Info','SM Value_2')
#Separate the dates into a new column
a<-str_split_fixed(sm.crop.df.t.df_Station2$Data_Info,'_',7) 
a<-as.data.frame(a)
dates = as.Date(strptime(a$V5, "%Y%m%d"))
sm.crop.df.t.df_Station2$Date<-dates

#Aggregate soil moisture values by mean value for the acquisition of daily values and save dataframe
sm.crop.df.t.df_Station2<-aggregate(x=sm.crop.df.t.df_Station2$`SM Value_2`,FUN=mean,by=list(Date=sm.crop.df.t.df_Station2$Date))
colnames(sm.crop.df.t.df_Station2)<-c('Date','SM Value_2') 
save(sm.crop.df.t.df_Station2,file='sm.crop.df.t.df_Station2.Rda')