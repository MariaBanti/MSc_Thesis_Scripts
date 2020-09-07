#Load In situ data (Soil Moisture, Air Temperature, Precipitation) - Example:Station ID=2 / Xrysopigi
STATION_2_XRYSOPIGI_2017.2018 <- read.csv("~/Thesis/DATA_STATIONS-map s/STATION 2/STATION_2_XRYSOPIGI_2017-2018.csv", sep=";")

#Form dates and value type
STATION_2_XRYSOPIGI_2017.2018$Date<-as.Date(STATION_2_XRYSOPIGI_2017.2018$Date,'%d/%m/%Y')
STATION_2_XRYSOPIGI_2017.2018$Soil_Hum_2<-as.numeric(STATION_2_XRYSOPIGI_2017.2018$Soil_Hum_2)

#Aggregate Soil Moisture and Air Temperature by mean value. Aggregate precipitation by sum.
agg2.1<-aggregate(x=STATION_2_XRYSOPIGI_2017.2018[c('Soil_Hum_2','Air_Temp_2')],FUN=mean,by=list(Date=STATION_2_XRYSOPIGI_2017.2018$Date))
agg2.2<-aggregate(x=STATION_2_XRYSOPIGI_2017.2018[c('Precipitation_2')],FUN=sum,by=list(Date=STATION_2_XRYSOPIGI_2017.2018$Date))
agg2<-merge.data.frame(agg2.1,agg2.2,by.x='Date',by.y='Date')
agg2$Station_ID<-2
save(agg2,file='agg2.Rda')

#Merge SMAP, NDVI and In Situ DataFrames 
DF_Station_2<-merge.data.frame(mg2,agg2,by.x = 'Date',by.y='Date')
DF_Station_2$Soil_Hum_2<-(DF_Station_2$Soil_Hum_2)/100
save(DF_Station_2,file='DF_Station_2.Rda')

#Add Area's Land Use
DF_Station_2$Landuse<-'Bush/Shrub'
DF_2_LU<-data.frame(DF_Station_2)

save(DF_2_LU,file='DF_2_LU.Rda')