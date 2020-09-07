#Pearson and Spearman Correlation for a station - Example:Station ID=2 / Xrysopigi
DF_Station_2$Date<-NULL
DF_Station_2$Station_ID<-NULL


cor(DF_Station_2,method='pearson',use='complete.obs')
pairs(DF_Station_2)
cor(DF_Station_2,method='spearman',use='complete.obs')

#Pearson and Spearman Correlation in the final DataFrame (which contains all stations' data)
DF_F_LU$Date<-NULL 
DF_F_LU$Station_ID<-NULL
DF_F_LU$LandUse<-NULL

cor(DF_F_LU,method='pearson',use='complete.obs') 
cor(DF_F_LU,method='spearman',use='complete.obs')