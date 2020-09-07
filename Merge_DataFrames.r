#Load all stations’ DataFrames
#Rename columns
colnames(DF_1_LU)<-c('Date','SMAP_Value','NDVI_Mean_Value','Soil_Moisture','Air_Temp','Precipitation','Station_ID','LandUse')
colnames(DF_2_LU)<-c('Date','SMAP_Value','NDVI_Mean_Value','Soil_Moisture','Air_Temp','Precipitation','Station_ID','LandUse')
colnames(DF_3_LU)<-c('Date','SMAP_Value','NDVI_Mean_Value','Soil_Moisture','Air_Temp','Precipitation','Station_ID','LandUse')
colnames(DF_4_LU)<-c('Date','SMAP_Value','NDVI_Mean_Value','Soil_Moisture','Air_Temp','Precipitation','Station_ID','LandUse')
colnames(DF_5_LU)<-c('Date','SMAP_Value','NDVI_Mean_Value','Soil_Moisture','Air_Temp','Precipitation','Station_ID','LandUse')

#Merge DataFrames
DF_F_LU<-rbind(DF_1_LU,DF_2_LU,DF_3_LU,DF_4_LU,DF_5_LU) 

#Save Final DataFrame
save(DF_F_LU,file='DF_F_LU.Rda')