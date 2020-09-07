# Read the MODIS NDVI csv file - Example:Station ID=2 / Xrysopigi
Station2_statistics_250m_16_days_NDVI <- read.csv("~/Thesis/DATA_STATIONS-maps/STATION 2/Station2_statistics_250m_16_days_NDVI.csv")
#Create data frame
df<-data.frame(Station2_statistics_250m_16_days_NDVI)
#Cut off columns into a new data frame & Rename the columns
df.ndvi<-data.frame(df$date,df$mean) 
df.ndvi$df.date<-as.Date(df.ndvi$df.date) 
colnames(df.ndvi)<-c('Dates','NDVI Mean Values_2')
#Set Date Sequence
start_date_ndvi<-as.Date("2017-01-01") 
end_date_ndvi<-as.Date("2018-08-13")
date_sequence_ndvi<-seq(start_date_ndvi,end_date_ndvi,by=1)

#Set the 2nd data frame(the one to be interpolated)/Paste Mean Values from the 1st data frame with for&if loop
df.ndvi.2<-data.frame(date_sequence_ndvi) 
colnames(df.ndvi.2)<-c('Dates') 
df.ndvi.2$'NDVI Mean Values_2'<-NA
df.ndvi.2$'NDVI Mean Values_2'<-as.numeric(df.ndvi.2$`NDVI Mean Values_2`)

for(i in 1:nrow(df.ndvi)){
  for(j in 1:nrow(df.ndvi.2)){
    if(df.ndvi$Dates[i]==df.ndvi.2$Dates[j]){
      df.ndvi.2$`NDVI Mean Values_2`[j]<-df.ndvi$`NDVI Mean Values_2`[i]
      break
    } else {
      next
    }
  }
}

#Interpolate NDVI mean values by using the package 'Zoo'
library(zoo)

df.ndvi.2$`NDVI Mean Values_2`<-na.spline(df.ndvi.2$`NDVI Mean Values_2`)
View(df.ndvi.2)

#Merge Soil Moisture DataFrame with NDVI DataFrame
load("~/R/Thesis/Station2/sm.crop.df.t.df_Station2.Rda")
mg2<-merge.data.frame(sm.crop.df.t.df_Station2,df.ndvi.2,by.x = 'Date ',by.y='Dates')
save(mg2,file='mg2.Rda')